#!/usr/bin/env bash
# Bash tests for Git Fundamentals Assessment
set -e

pass_count=0
fail_count=0

check() {
  desc="$1"
  shift
  if eval "$@"; then
    echo "PASS: $desc"
    ((pass_count++))
  else
    echo "FAIL: $desc"
    ((fail_count++))
  fi
}

# Test 1: about.txt exists and committed
check "about.txt exists and tracked" \
  "[ -f about.txt ] && git ls-files --error-unmatch about.txt > /dev/null 2>&1"

# Test 2: Commit message for about.txt contains 'add: about.txt'
check "about.txt commit message correct" \
  "git log --pretty=%s -- about.txt | grep -qi 'add: about.txt'"

# Test 3: .gitignore ignores *.log
check ".gitignore ignores *.log" \
  "git check-ignore test.log >/dev/null 2>&1 || (echo 'test.log' > test.log && git check-ignore test.log >/dev/null 2>&1)"

# Test 4: feature/update-bio branch exists
check "feature/update-bio branch exists" \
  "git show-ref --verify --quiet refs/heads/feature/update-bio || git show-ref --verify --quiet refs/remotes/origin/feature/update-bio"

# Test 5: bio.txt merged into main
check "bio.txt present in main branch" \
  "git checkout main >/dev/null 2>&1 && [ -f bio.txt ] && git ls-files --error-unmatch bio.txt >/dev/null 2>&1"

# Test 6: Tag v1.0.0 exists
check "Tag v1.0.0 exists" \
  "git tag | grep -q '^v1.0.0$'"

echo
echo "============================"
echo "Total Passed: $pass_count"
echo "Total Failed: $fail_count"
echo "============================"

if [ $fail_count -eq 0 ]; then
  echo "All tests passed!"
  exit 0
else
  echo "Some tests failed. Fix and try again."
  exit 1
fi
