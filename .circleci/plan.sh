#!/bin/sh

environment=$1

param_github_user=$(eval echo "\$$GITHUB_USER_ENV_VAR_NAME")
param_github_token=$(eval echo "\$$GITHUB_TOKEN_ENV_VAR_NAME")
terraform_plan=${PARAM_PLAN}

if [ "${param_github_token}" = "" ]; then
  echo "GITHUB_TOKEN not set."
  exit 1
fi

if [ "${param_github_user}" = "" ]; then
  echo "GITHUB_USER not set."
  exit 1
fi

if [ "${terraform_plan}" = "" ]; then
  echo "No terraform plan output provided."
  exit 1
fi

pr_response=$(curl --silent \
                  --location \
                  --request GET "https://api.github.com/repos/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/pulls?head=$CIRCLE_PROJECT_USERNAME:$CIRCLE_BRANCH&state=open" \
                  -u "$param_github_user":"$param_github_token")

if [ "$(echo "${pr_response}" | jq length)" -eq 0 ]; then
  echo "No PR found to update, skipping."
  # Exit 0 to not error and stop the workflow.
  exit 0
fi

post_plan_comment() {
  pr_comment_url="$1"
  plan_output="$2"

  message=$(jo body="$(printf "**Terraform plan output for $environment:**\n\`\`\`\n%s" "$plan_output")")

  curl  --silent \
        --location \
        --request POST "$pr_comment_url" \
        -u "$param_github_user":"$param_github_token" \
        --header 'Content-Type: application/json' \
        --header 'Accept: application/vnd.github+json' \
        --data "$message"
  }

plan_output=$(jo body="\`\`\`\n$(terraform show -no-color "${terraform_plan}")")
pr_comment_url=$(echo "${pr_response}" | jq --raw-output ".[]._links.comments.href")

post_plan_comment "$pr_comment_url" "$plan_output"
