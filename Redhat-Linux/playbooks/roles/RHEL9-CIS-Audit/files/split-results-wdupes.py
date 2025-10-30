#!/usr/bin/env python3
import json
import re
import sys
from pathlib import Path

# --- Handle input argument ---
if len(sys.argv) < 2:
    print("Usage: python3 split-results.py <path_to_audit_json>")
    sys.exit(1)

input_file = Path(sys.argv[1])

if not input_file.exists():
    print(f"❌ Error: File not found — {input_file}")
    sys.exit(1)

# --- Output paths ---
output_dir = Path("/opt/parsed_results")
failed_dir = output_dir / "failed"

# Ensure directories exist
output_dir.mkdir(exist_ok=True)
failed_dir.mkdir(exist_ok=True)

# --- Load the Goss JSON results ---
with open(input_file) as f:
    data = json.load(f)

# Some Goss outputs wrap results in {"results": [...]}
results = data.get("results", data)

# --- Separate successful/failed tests ---
success = [r for r in results if r.get("successful") is True]
failed = [r for r in results if r.get("successful") is False]

# --- Write summary JSON files ---
with open(output_dir / "successful.json", "w") as f:
    json.dump(success, f, indent=4)

with open(output_dir / "failed.json", "w") as f:
    json.dump(failed, f, indent=4)

# --- Write individual failed tests — one JSON per failed entry ---
for idx, r in enumerate(failed, start=1):
    cis_ids = r.get("meta", {}).get("CIS_ID", ["unknown"])
    cis_id = cis_ids[0] if cis_ids else "unknown"

    # Sanitize CIS ID and resource-id for filename
    cis_id_safe = re.sub(r'[^0-9._-]+', '_', cis_id)
    resource_id_safe = re.sub(r'[^0-9a-zA-Z._-]+', '_', r.get("resource-id", "unknown"))

    filename = f"{cis_id_safe}_{resource_id_safe}_{idx}.json"
    with open(failed_dir / filename, "w") as f:
        json.dump(r, f, indent=4)

# --- Summary output ---
print(f"✅ Successful: {len(success)}")
print(f"❌ Failed: {len(failed)}")
print(f"📁 Summary results saved in: {output_dir.resolve()}")
print(f"📁 Individual failed results in: {failed_dir.resolve()}")
