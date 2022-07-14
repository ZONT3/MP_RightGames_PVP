params ["_obj", "_access", "_fn_restriction"];

if (isNil "_obj" or {isNull _obj}) exitWith {};
if (typeName _access != typeName []) exitWith {};
if (count _access > 0 and {typeName _access != typeName []}) then {
	_access = [_access];
};

if (isNil "_fn_restriction") then {
	_fn_restriction = {
		// здесь пытаемся заблокировать доступ. ящик - _this
		_this lockInventory true;
	};
};

[_obj, _access, _fn_restriction, ] spawn {
	params ["_obj", "_access", "_fn_restriction"];
  	waituntil { sleep 0.1; !isNil "ZPR_roles" };
	if not (_access call ZONT_fnc_checkRole) then {
		_obj call _fn_restriction;
	}
};
