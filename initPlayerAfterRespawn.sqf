
waituntil { sleep 0.1; !isnull player and {alive player} };
waituntil { sleep 0.1; !isNil 'ZPR_roles' };


private _med = [["Med"]] call ZONT_fnc_checkRole;
private _mdfm = [["MDFM"]] call ZONT_fnc_checkRole;


if (_med or _mdfm) then 
{
 player setVariable ["ace_medical_medicclass", 2, true];
};

player enableStamina false;
player enableFatigue false;


/*
private _mechanicus = [["Mechanicus"]] call ZONT_fnc_checkRole;
private _inqusition = [["Inqusition"]] call ZONT_fnc_checkRole;


player enableStamina !(_mechanicus || _inqusition);

player setUnitTrait ['engineer', _mechanicus]; 
*/
