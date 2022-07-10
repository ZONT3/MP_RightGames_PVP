if (!isServer) exitWith {};

params ["_hol", "_id"];

private _uid = format ["L_%1", _id];

if (isNil "MPS_presistentCrates") then {
	MPS_presistentCrates = [];
};

_hol allowDamage false;
[_hol, _uid call ZONT_fnc_fetchPersonalLocker] call ZONT_fnc_setContainerGear;

_hol setVariable ["presistentCrateId", _uid];
MPS_presistentCrates pushBack _hol;
