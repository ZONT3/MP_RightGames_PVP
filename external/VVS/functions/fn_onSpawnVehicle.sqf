params ["_vehicle", "_class", "_mode"];

private _functions = [_mode, _class] call ZONT_fnc_onSpawnVVS;

if not (_functions isEqualType []) exitWith { };
{
  if (_x isEqualType {}) then { call _x  };
} foreach _functions;
