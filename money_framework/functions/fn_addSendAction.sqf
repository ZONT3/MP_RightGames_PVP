params ["_condition"];

if (!hasInterface) exitWith {};

_action = [
    "moneymenu_mainSendDirectlyAction",
    "Отправить Деньги",
    (missionNamespace getVariable ["moneymenu_moduleRoot",[] call moneymenu_fnc_getModuleRoot]) + "\data\moneyIcon.paa",
    {[_this select 0,"DIRECT_SEND"] call moneymenu_fnc_loadMenu},
    _condition
] call ace_interact_menu_fnc_createAction;

[player,1,["ACE_SelfActions", "ACE_Equipment"],_action] call ace_interact_menu_fnc_addActionToObject;
