#include "..\dialog\defines.hpp"
disableSerialization;

params [["_target",player],["_mode","GIVE"]];

_dialog = findDisplay moneymenu_DIALOG;
_myMoney = _dialog displayCtrl moneymenu_myfunds;
_myMoneyDesc = _dialog displayCtrl moneymenu_myfundsDesc;

_money = if (_mode in ["ATM_WITHDRAW","ATM_TRANSFER"]) then {player getVariable ["moneymenu_myBankBalance",0]} else {_target getVariable ["lbm_myFunds",0]};

switch (true) do {
    case (_mode in ["ATM_WITHDRAW","ATM_TRANSFER"]): {
        _myMoneyDesc ctrlSetText "Мой банк:";
    };

    case (_target == player): {
        _myMoneyDesc ctrlSetText "Мой счет:";
    };

    default {
        _myMoneyDesc ctrlSetText "Счет:";
    };
};

_text = format ["%1 Cr", _money];
_myMoney ctrlSetText _text;

[MPS_BDL_money, "saveMoney", [getPlayerUID _player, _money]] call ZONT_fnc_bd_customRequest;
