[{
	if (isNil "MPS_presistentCrates") exitWith {};
	{
		private _id = _x getVariable ["presistentCrateId", nil];
		if (!isNil "_id") then {
			[_id, _x] call ZONT_fnc_updPersonalLocker;
		};
	} foreach MPS_presistentCrates;
}, 40] call CBA_fnc_addPerFrameHandler;
