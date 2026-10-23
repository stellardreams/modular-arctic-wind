# Modular Arctic Wind Turbine Architecture (50 kW)

Autonomous, containerized polar wind power generation system engineered for extreme northern conditions:
- **Nominal Electrical Rating**: 50 kW at 10.5 m/s rated wind speed.
- **Extreme Survival**: −60 °C structural operation in dense polar air (\rho = 1.656 kg/m³), 120 km/h operating band, 151 km/h 50-year storm gusts.
- **Containerized Logistics**: 100% packaged inside a single 20 ft ISO high-cube container (9,216.8 kg \le 10,886 kg limit).
- **Crane-Less Erection**: Integrated container A-frame gin-pole and winch line rigging for remote field installation.
- **Airfoil Aerodynamics**: Segmented (\le 1.90 m) NACA 4415/4412 lofted rotor blades with thermal anti-icing.
- **Microgrid Hybridization**: 400V 3-phase AFE inverter with autonomous droop control and 50 kWh BESS buffer, displacing 21,087 L/year of diesel fuel.

## Repository Layout
- `cad/freecad/`: Parametric FreeCAD 1.0.0 Python solid model generators and 360° turntables.
- `cad/step_exports/`: Monolithic ISO 10303 STEP solid models (`modular_wind_turbine_v3.step`).
- `cad/openscad/v2.0/`: OpenSCAD visual assemblies and 12 physics verification models.
- `docs/specifications/`: Authoritative technical specification document.
- `scripts/`: Local test runners and render automation pipelines.

## Quick Start: Verification
Run the 12-model numerical verification suite:
```bash
./scripts/test_wind.sh
```
