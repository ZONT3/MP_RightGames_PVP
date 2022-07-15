params ["_obj", "_access", "_fn_restriction", "_fn_allowance", ["_allowServer", false], ["_allowClient", true]];

if (isServer and !hasInterface and !_allowServer) exitwith {};
if (hasInterface and !_allowClient) exitwith {};

if (isNil "_obj" or {isNull _obj}) exitWith {};
if (typeName _access != typeName []) exitWith {};
if (count _access > 0 and {typeName _access != typeName []}) then {
	_access = [_access];
};

if ((isNil "_fn_restriction") and (isNil "_fn_allowance")) then {
	_fn_restriction = {
		// здесь пытаемся заблокировать доступ. ящик - _this
		_this lockInventory true;
	};
};

[_obj, _access, _fn_restriction, _fn_allowance] spawn {
	params ["_obj", "_access", "_fn_restriction", "_fn_allowance"];
  	waituntil { sleep 0.1; !isNil "ZPR_roles" };
	
	if not (_access call ZONT_fnc_checkRole) then {
		if (!isNil "_fn_restriction") then {
			_obj call _fn_restriction;
		}
	} else {
		if (!isNil "_fn_allowance") then {
			_obj call _fn_allowance;
		}
	};
};
