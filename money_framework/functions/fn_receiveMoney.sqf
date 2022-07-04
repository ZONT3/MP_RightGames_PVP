params ["_target","_recipient", ["_amount",0], ["_mode", "GIVE"],"_sender"];

if (local _recipient && _mode in ["GIVE","DIRECT_SEND"]) then {

    _recipient setVariable ["lbm_myFunds", (_recipient getVariable ["lbm_myFunds",0]) + _amount, true];

    if (player == _recipient) then {
        [
            format ["<t color='#00FF00'>%1</t> Cr Получено от %2.", _amount, (name _sender)],
            format ["Кошелек: <t color='#00FF00'>%1</t> Cr", player getVariable ["lbm_myFunds",0]]
        ] call moneymenu_fnc_formattedHint;
    };
};

if (local _target && _mode == "TAKE") then {
    _target setVariable ["lbm_myFunds", ((_target getVariable ["lbm_myFunds",0]) - _amount) max 0, true];

    if (player == _target) then {
        [
            format ["<t color='#00FF00'>%1</t> Cr Взято %2.", _amount, (name _recipient)],
            format ["Кошелек: <t color='#00FF00'>%1</t> Cr", player getVariable ["lbm_myFunds",0]]
        ] call moneymenu_fnc_formattedHint;
    };
};

if (local _recipient && _mode == "TAKE") then {
    _recipient setVariable ["lbm_myFunds", (_recipient getVariable ["lbm_myFunds",0]) + _amount, true];

    if (player == _recipient) then {
        _actionDesc = if (_target isKindOf "Man") then {format ["taken from %1", _target getVariable ["ace_name",name _target]]} else {"Взято с хранилища"};
        [
            format ["<t color='#00FF00'>%1</t> Cr %2.", _amount,_actionDesc],
            format ["Кошелек: <t color='#00FF00'>%1</t> Cr", player getVariable ["lbm_myFunds",0]]
        ] call moneymenu_fnc_formattedHint;
    };
};

if (local _recipient && _mode == "ATM_TRANSFER") then {
    _recipient setVariable ["moneymenu_myBankBalance", (_recipient getVariable ["moneymenu_myBankBalance",0]) + _amount, true];
    _latestReceipts = _recipient getVariable ["moneymenu_latestReceipts",[]];
    _latestReceipts pushBack [_amount,name _sender];
    while {count _latestReceipts > 3} do {
        _latestReceipts deleteAt 0;
    };
};
