params ["_vehicle", "_class", "_mode"];

private _functions = [_mode, _class] call ZONT_fnc_onSpawnVVS;

diag_log ("VVS_fnc_onSpawnVehicle [""_vehicle"", ""_class"", ""_mode""] = " + [_vehicle, _class, _mode]);
diag_log ("VVS_fnc_onSpawnVehicle _functions = " + str _functions);

if not (_functions isEqualType []) exitWith { };
{
  if (_x isEqualType {}) then { call _x  };
} foreach _functions;
