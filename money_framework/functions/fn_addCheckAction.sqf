params ["_condition", "_target", ["_params",[]], ["_inherit", false]];

if (!hasInterface) exitWith {};
if (isNil "_target") exitWith {};
if ((typeName _target) == "OBJECT" && {isNull _target}) exitWith {};

if (isNil "moneymenu_atmObjects") then {moneymenu_atmObjects = [missionConfigFile >> "CfgMoneymenu" >> "atmObjects", "array", 0] call CBA_fnc_getConfigEntry};

_actionDesc = if (_target in moneymenu_atmObjects) then {"Проверить Баланс"} else {"Проверить Баланс"};
_self = if (typeName _target == "OBJECT" && {_target == player}) then {1} else {0};
_actionPath = if (typeName _target == "OBJECT" && {_target == player}) then {["ACE_SelfActions", "ACE_Equipment"]} else {["ACE_MainActions"]};
_code = if (_target in moneymenu_atmObjects) then {
    {
        _hint = [
            format ["Баланс: <t color='#00FF00'>%1</t> Cr", player getVariable ["moneymenu_myBankBalance",0]],
            format ["Кошелек: <t color='#00FF00'>%1</t> Cr", player getVariable ["lbm_myFunds",0]]
        ];

        _latestReceipts = player getVariable ["moneymenu_latestReceipts",[]];
        if (count _latestReceipts > 0) then {
            _hint pushBack "";
            _hint pushBack "Последние операции:";
            for [{_i=((count _latestReceipts) min 3)}, {_i>0}, {_i=_i-1}] do {
                _data = _latestReceipts select (_i-1);
                _hint pushBack format ["<t color='#00FF00'>%1</t> Cr - %2", _data select 0, _data select 1];
            };
        };

        _hint call moneymenu_fnc_formattedHint;
    }
} else {
    {
        [
            format ["Кошелек: <t color='#00FF00'>%1</t> Cr", player getVariable ["lbm_myFunds",0]]
        ] call moneymenu_fnc_formattedHint;
    }
};


_action = [
    "moneymenu_mainCheckAction",
    _actionDesc,
    (missionNamespace getVariable ["moneymenu_moduleRoot",[] call moneymenu_fnc_getModuleRoot]) + "\data\moneyIcon.paa",
    _code,
    _condition,
    {},
    _params
] call ace_interact_menu_fnc_createAction;

if (typeName _target == "STRING") then {

    [_target,_self,_actionPath,_action,_inherit] call ace_interact_menu_fnc_addActionToClass;
};

if (typeName _target == "OBJECT") then {

    [_target,_self,_actionPath,_action] call ace_interact_menu_fnc_addActionToObject;
};
