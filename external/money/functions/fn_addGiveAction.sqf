params ["_condition", "_target", ["_params",[]], ["_inherit", false]];

if (!hasInterface) exitWith {};
if (isNil "_target") exitWith {};
if ((typeName _target) == "OBJECT" && {isNull _target}) exitWith {};

if (isNil "moneymenu_atmObjects") then {moneymenu_atmObjects = [missionConfigFile >> "CfgMoneymenu" >> "atmObjects", "array", 0] call CBA_fnc_getConfigEntry};

_actionDesc = switch (true) do {
    case (_target isKindOf "Man"): {"Передать Деньги"};
    case (_target in moneymenu_atmObjects): {"Внести Деньги"};
    default {"Сохранить Деньги"};
};

_mode = if (_target in moneymenu_atmObjects) then {"ATM_DEPOSIT"} else {"GIVE"};
_code = compile (format ["[_this select 0,'%1'] call moneymenu_fnc_loadMenu",_mode]);

_action = [
    "moneymenu_mainGiveAction",
    _actionDesc,
    (missionNamespace getVariable ["moneymenu_moduleRoot",[] call moneymenu_fnc_getModuleRoot]) + "\data\moneyIcon.paa",
    _code,
    _condition,
    {},
    _params
] call ace_interact_menu_fnc_createAction;

if (typeName _target == "STRING") then {
    /*[_target,0] call ace_interact_menu_fnc_addMainAction;*/
    [_target,0,["ACE_MainActions"],_action,_inherit] call ace_interact_menu_fnc_addActionToClass;
};

if (typeName _target == "OBJECT") then {
    /*[typeOf _target,0] call ace_interact_menu_fnc_addMainAction;*/
    [_target,0,["ACE_MainActions"],_action] call ace_interact_menu_fnc_addActionToObject;
};
