#!/bin/sh

environment=$1
terraform_plan=$2

pr_response=$(curl --silent \
                   --location \
                   --request GET "https://api.github.com/repos/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/pulls?head=$CIRCLE_PROJECT_USERNAME:$CIRCLE_BRANCH&state=open" \
                   -u "$GITHUB_USER":"$GITHUB_TOKEN")

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
        -u "$GITHUB_USER":"$GITHUB_TOKEN" \
        --header 'Content-Type: application/json' \
        --header 'Accept: application/vnd.github+json' \
        --data "$message"
}

echo "$pr_response"

plan_output=$(jo body="\`\`\`\n$(terraform show -no-color "${terraform_plan}")")
pr_comment_url=$(echo "${pr_response}" | jq --raw-output ".[].review_comments_url")

post_plan_comment "$pr_comment_url" "$plan_output"
