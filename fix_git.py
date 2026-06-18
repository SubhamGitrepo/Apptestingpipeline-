#!/usr/bin/env python3
import subprocess
import os

os.chdir('d:\\Prod_infras')

print("=" * 60)
print("1. Checking what files are in the current commit...")
print("=" * 60)
result = subprocess.run(['git', 'show', '--name-status', '--oneline'], capture_output=True, text=True)
print(result.stdout)
if result.stderr:
    print("ERROR:", result.stderr)

print("\n" + "=" * 60)
print("2. Checking if terraform.tfvars files are tracked...")
print("=" * 60)
result = subprocess.run(['git', 'ls-files'], capture_output=True, text=True)
tfvars_files = [line for line in result.stdout.split('\n') if 'tfvars' in line or 'tfstate' in line]
if tfvars_files:
    print("Found sensitive files in git:")
    for f in tfvars_files:
        print(f"  - {f}")
else:
    print("No sensitive files found - already clean!")

print("\n" + "=" * 60)
print("3. Removing sensitive files from git tracking...")
print("=" * 60)
files_to_remove = [
    'environment/dev/terraform.tfvars',
    'environment/qa/terraform.tfvars',
    'environment/prod/terraform.tfvars',
]
for file in files_to_remove:
    try:
        result = subprocess.run(['git', 'rm', '--cached', file], capture_output=True, text=True)
        if result.returncode == 0:
            print(f"✓ Removed: {file}")
        elif "did not match" in result.stderr:
            print(f"⊘ Not found: {file}")
        else:
            print(f"✗ Error removing {file}: {result.stderr}")
    except Exception as e:
        print(f"⊘ {file} not found or already removed")

print("\n" + "=" * 60)
print("4. Amending commit to update history...")
print("=" * 60)
result = subprocess.run(['git', 'commit', '--amend', '--no-edit'], capture_output=True, text=True)
print(result.stdout)
if result.stderr and "nothing to commit" not in result.stderr:
    print("ERROR:", result.stderr)

print("\n" + "=" * 60)
print("✅ Fix complete! Ready to push with: git push --force-with-lease")
print("=" * 60)
