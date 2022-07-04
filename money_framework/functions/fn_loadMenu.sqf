#include "..\dialog\defines.hpp"
disableSerialization;

params ["_target",["_mode","GIVE"]];

if (_mode in ["ATM_TRANSFER", "DIRECT_SEND"]) then {createDialog "moneyMenu_ATM"} else {createDialog "moneyMenu"};

_dialog = findDisplay moneymenu_DIALOG;
_title = _dialog displayCtrl moneymenu_title;
_myMoney = _dialog displayCtrl moneymenu_myfunds;

uiNamespace setVariable ["moneymenu_currentMode", _mode];
uiNamespace setVariable ["moneymenu_currentTarget",_target];

switch (_mode) do {
    case ("GIVE"): {
        uiNamespace setVariable ["moneymenu_currentRecipient", _target];
        _secure = if (!isNil {_target getVariable "moneymenu_owner"}) then {"Защищено"} else {"Незащищено"};
        _text = if (_target isKindOf "Man") then {toUpper format ["Передать Деньги %1", (name _target)]} else {toUpper format ["Сохранить Деньги (%1)", _secure]};
        _title ctrlSetText _text;
        [player,_mode] call moneymenu_fnc_updateMoney;
    };

    case ("TAKE"): {
        uiNamespace setVariable ["moneymenu_currentRecipient", player];
        _secure = if (!isNil {_target getVariable "moneymenu_owner"}) then {"Защищено"} else {"Незащищено"};
        _text = if (_target isKindOf "Man") then {toUpper format ["Взять Деньги с %1", _target getVariable ["ace_name",name _target]]} else {toUpper format ["Забрать деньги из хранилища (%1)", _secure]};
        _title ctrlSetText _text;
        [_target,_mode] call moneymenu_fnc_updateMoney;
    };

    case ("ATM_TRANSFER"): {
        uiNamespace setVariable ["moneymenu_currentRecipient", _target];
        _title ctrlSetText "Перевод";
        [] call moneymenu_fnc_updatePlayerList;
        [player,_mode] call moneymenu_fnc_updateMoney;
    };

    case ("ATM_DEPOSIT"): {
        uiNamespace setVariable ["moneymenu_currentRecipient", _target];
        _title ctrlSetText "Депозит";
        [player,_mode] call moneymenu_fnc_updateMoney;
    };

    case ("ATM_WITHDRAW"): {
        uiNamespace setVariable ["moneymenu_currentRecipient", player];
        _title ctrlSetText "ВыводL";
        [_target,_mode] call moneymenu_fnc_updateMoney;
    };

    case ("DIRECT_SEND"): {
        uiNamespace setVariable ["moneymenu_currentRecipient", _target];
        _title ctrlSetText "Отправить деньги";
        [] call moneymenu_fnc_updatePlayerList;
        [player,_mode] call moneymenu_fnc_updateMoney;
    };
};
