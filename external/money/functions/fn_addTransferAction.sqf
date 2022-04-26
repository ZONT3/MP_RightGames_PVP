params ["_condition", "_target", ["_params",[]], ["_inherit", false]];

if (!hasInterface) exitWith {};
if (isNil "_target") exitWith {};
if ((typeName _target) == "OBJECT" && {isNull _target}) exitWith {};

_action = [
    "moneymenu_mainTransferAction",
    "Перевести Деньги",
    (missionNamespace getVariable ["moneymenu_moduleRoot",[] call moneymenu_fnc_getModuleRoot]) + "\data\moneyIcon.paa",
    {[_this select 0,"ATM_TRANSFER"] call moneymenu_fnc_loadMenu},
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
