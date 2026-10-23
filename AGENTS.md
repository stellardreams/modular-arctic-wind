# AGENTS.md — working rules for this repository

Operational rules for any AI agent or human contributor working in `modular-arctic-wind`.
Where one of these rules conflicts with a general habit, this file wins.

---

## 🚨 Protected branches — never delete

**`main` and `main-dev` are permanent. Never delete them, in any circumstance, on any branch operation.**

### Rules

1. **Check the PR head before merging.** If it is `main` or `main-dev`, omit `--delete-branch` entirely.
2. **After any merge that used `--delete-branch`, verify:**
   ```bash
   gh api repos/stellardreams/modular-arctic-wind/branches --jq '.[].name'
   ```
   Both protected branches (`main` and `main-dev`) must still be present.
3. **`--delete-branch` is only ever for throwaway branches** — `feat/*`, `fix/*`, `docs/*`, `ci/*` — and only once merged.
4. **Never substitute another branch** for a missing protected one. Stop and ask.

---

## 🧭 Ecosystem Scope & Companion Inventions

This repository (`modular-arctic-wind`) is strictly dedicated to the **Modular Arctic Wind Turbine** hardware, aerodynamics, foundations, erection kinematics, and microgrid hybridization suites.

Work specific to companion inventions — including **AMU** (Autonomous Modular Unit / Surface Habitat), **CORA-M** (7-DoF Cooperative Robotic Arm), and **STRIDER-M** (Polar Transporter Crawler) — is primarily handled via the parent repository: **[`stellardreams/asi.surge.sh`](https://github.com/stellardreams/asi.surge.sh)**. Always check `asi.surge.sh` for primary updates to those systems.

---

## Verification gate — nothing gets checked off without proof

Applies to issue bodies, comments, and any checklist.
An item may only change `- [ ]` → `- [x]` when **concrete execution or tool verification happened in the session**: command output observed, tests run (`./scripts/test_wind.sh`), file inspected on disk, API response confirmed.
