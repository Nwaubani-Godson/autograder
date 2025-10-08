# Git Fundamentals Assessment

Welcome to the assessment of git fundamentals. Follow these instructions carefully.
You can test your progress locally with `./run-tests.sh`.

---

## Tasks

### 1. About File
- Create a file named `about.txt` in the repository root.
- Add your **full name** on the first line of the file.
- Commit with the message: `add: about.txt`

### 2. Ignore Logs
- Create a `.gitignore` file that ignores all `*.log` files.
- Commit with the message `add: .gitignore`

### 3. Branching
- Create a branch called **feature/update-bio**.
- In the branch, add a file named `bio.txt` with a short bio about yourself.
- Commit with the message: `add: bio.txt`

### 4. Merge
- Merge `feature/update-bio` into `main` (or `master`) branch.

### 5. Tagging
- Create a lightweight tag named **v1.0.0** on your final merge commit.

---

## Testing Locally

```bash
chmod +x run-tests.sh
./run-test.sh
```

If all tests pass, push your changes

```bash
git push origin main --tags
```

## Notes
- Do not delete the `tests.sh` or `run-tests.sh` files
- You can run tests as manay times as you like before pushing.
- A failing test means something is wrong with your setup

*Good luck*


Trigger test