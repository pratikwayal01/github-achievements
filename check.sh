#!/usr/bin/env bash
# Live badge counts via the GitHub API. Read-only.
set -euo pipefail

GH="${GH:-pratikwayal01}"
REPO_STAR="${REPO_STAR:-kim}"

stars=$(gh api "repos/$GH/$REPO_STAR" --jq .stargazers_count 2>/dev/null || echo "?")
prs=$(gh api "search/issues?q=author:$GH+type:pr+is:merged&per_page=1" --jq .total_count 2>/dev/null || echo "?")
sponsors=$(gh api "users/$GH" --jq '.is_sponsor // false' 2>/dev/null || echo "?")
ospd=$(gh api "search/issues?q=author:$GH+type:pr+is:merged+-repo:$GH/*&per_page=1" --jq .total_count 2>/dev/null || echo "?")

printf '%-24s %s\n' "Badge" "Count"
printf '%-24s %s\n' "-----------------------" "-----"
printf '%-24s %s (target 16)\n' "Starstruck"   "$stars"
printf '%-24s %s (target 2 / 16 / 128)\n' "Pull Shark"  "$prs"
printf '%-24s %s\n' "Public Sponsor" "$sponsors"
printf '%-24s %s (excludes own repos)\n' "Open Source Contributor" "$ospd"
printf '%s\n' "Pair Extraordinaire + Galaxy Brain: count co-author trailers / marked answers manually (no API for them)."