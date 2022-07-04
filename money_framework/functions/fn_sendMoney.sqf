params ["_target", "_recipient", ["_amount",0], ["_mode","GIVE"]];

if (_amount <= 0) exitWith {player say "AddItemFailed"};

switch (_mode) do {
    case ("GIVE"): {
        player setVariable ["lbm_myFunds", ((player getVariable ["lbm_myFunds",0]) - _amount) max 0, true];

        if (player != _recipient) then {
            _desc = if (_target isKindOf "Man") then {format ["<t color='#00FF00'>%1</t> Cr Дано %2.", _amount, name _target]} else {format ["<t color='#00FF00'>%1</t> Cr Передано в хранилище.", _amount]};

            [
                _desc,
                format ["Кошелек: <t color='#00FF00'>%1</t> Cr", player getVariable ["lbm_myFunds",0]]
            ] call moneymenu_fnc_formattedHint;
        };
    };

    case ("ATM_DEPOSIT"): {
        player setVariable ["lbm_myFunds", ((player getVariable ["lbm_myFunds",0]) - _amount) max 0, true];
        player setVariable ["moneymenu_myBankBalance", (player getVariable ["moneymenu_myBankBalance",0]) + _amount, true];

        [
            format ["<t color='#00FF00'>%1</t> Cr Переведено.", _amount],
            format ["Банк: <t color='#00FF00'>%1</t> Cr", player getVariable ["moneymenu_myBankBalance",0]],
            format ["Кошелек: <t color='#00FF00'>%1</t> Cr", player getVariable ["lbm_myFunds",0]]
        ] call moneymenu_fnc_formattedHint;
    };

    case ("ATM_WITHDRAW"): {
        player setVariable ["lbm_myFunds", ((player getVariable ["lbm_myFunds",0]) + _amount) max 0, true];
        player setVariable ["moneymenu_myBankBalance", (player getVariable ["moneymenu_myBankBalance",0]) - _amount, true];

        [
            format ["<t color='#00FF00'>%1</t> Cr Снято.", _amount],
            format ["Банк: <t color='#00FF00'>%1</t> Cr", player getVariable ["moneymenu_myBankBalance",0]],
            format ["Кошелек: <t color='#00FF00'>%1</t> Cr", player getVariable ["lbm_myFunds",0]]
        ] call moneymenu_fnc_formattedHint;
    };

    case ("ATM_TRANSFER"): {
        player setVariable ["moneymenu_myBankBalance", ((player getVariable ["moneymenu_myBankBalance",0]) - _amount) max 0, true];

        [
            format ["<t color='#00FF00'>%1</t> Cr Переведено %2.", _amount, name _recipient],
            format ["Банк: <t color='#00FF00'>%1</t> Cr", player getVariable ["moneymenu_myBankBalance",0]],
            format ["Кошелек: <t color='#00FF00'>%1</t> Cr", player getVariable ["lbm_myFunds",0]]
        ] call moneymenu_fnc_formattedHint;
    };

    case ("DIRECT_SEND"): {
        player setVariable ["lbm_myFunds", ((player getVariable ["lbm_myFunds",0]) - _amount) max 0, true];

        [
            format ["<t color='#00FF00'>%1</t> Cr Отправлено %2.", _amount, name _recipient],
            format ["Кошелек: <t color='#00FF00'>%1</t> Cr", player getVariable ["lbm_myFunds",0]]
        ] call moneymenu_fnc_formattedHint;
    };
};

[_target,_recipient,_amount,_mode,player] remoteExec ["moneymenu_fnc_receiveMoney",0,false];
