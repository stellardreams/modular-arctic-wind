#!/usr/bin/env bash
# ==============================================================================
# Modular Arctic Wind — Standalone Numerical Verification Suite
# Note: Companion inventions (AMU-Surface Habitat, CORA-M 7-DoF Robotics, and
# STRIDER-M Polar Transporter) are primarily handled via the parent repository:
# https://github.com/stellardreams/asi.surge.sh — best to check there for updates.
# ==============================================================================
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
WIND_DIR="$REPO_ROOT/cad/openscad/v2.0"

echo "=============================================================================="
echo " 🌬️  MODULAR ARCTIC WIND — STANDALONE NUMERICAL VERIFICATION SUITE"
echo "=============================================================================="

MODELS=(
    "envelope.py:Arctic Environmental & Air Density Envelope"
    "power_resource.py:Power Resource Sizing & Betz Limit Audit"
    "container_sizing.py:ISO 20ft Container Internal Geometry"
    "foundation_load_envelope.py:Foundation Overturning & Ballast Stability"
    "hoist_kinematics.py:Gin-Pole A-Frame Winch Line Kinematics"
    "powertrain_envelope.py:Direct-Drive PMSG & Nacelle Architecture"
    "container_pack_audit.py:Complete 20ft Container Payload Mass Audit"
    "microgrid_dispatch.py:Annual Hourly Microgrid & Diesel Displacement"
    "weibull_wind_resource.py:Weibull Wind Resource & AEP Matrix"
    "aero_icing_loads.py:Aerodynamic Storm Gust & Asymmetric Rime Icing"
    "cold_climate_fmea.py:Cold-Climate Subsystem FMEA (IEC 60812)"
    "levelized_cost_energy.py:Arctic Levelized Cost of Energy (LCOE)"
)

PASSED=0
TOTAL=${#MODELS[@]}
for entry in "${MODELS[@]}"; do
    IFS=":" read -r script desc <<< "$entry"
    if python3 "$WIND_DIR/$script" >/dev/null 2>&1; then
        printf "PASS | %-28s | %s\n" "$script" "$desc"
        PASSED=$((PASSED + 1))
    else
        printf "FAIL | %-28s | %s\n" "$script" "$desc"
        exit 1
    fi
done

echo "=============================================================================="
echo "Summary: $PASSED/$TOTAL models passed in standalone destination."
echo "✅ Standalone repository integrity verified."
exit 0
