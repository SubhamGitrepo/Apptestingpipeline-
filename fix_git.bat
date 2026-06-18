@echo off
cd /d d:\Prod_infras

echo ============================================================
echo 1. Checking what files are in the current commit...
echo ============================================================
git show --name-status --oneline

echo.
echo ============================================================
echo 2. Checking if terraform.tfvars files are tracked...
echo ============================================================
git ls-files | findstr /I "tfvars tfstate"

echo.
echo ============================================================
echo 3. Removing sensitive files from git tracking...
echo ============================================================
git rm --cached environment/dev/terraform.tfvars 2>nul
git rm --cached environment/qa/terraform.tfvars 2>nul
git rm --cached environment/prod/terraform.tfvars 2>nul

echo.
echo ============================================================
echo 4. Amending commit...
echo ============================================================
git commit --amend --no-edit

echo.
echo ============================================================
echo DONE! Now run: git push --force-with-lease
echo ============================================================
