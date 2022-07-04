params ["_unit", ["_funds",0], ["_setBankAccount",false]]; // поставь true, если ты дурак

private _varName = ["lbm_myFunds","moneymenu_myBankBalance"] select _setBankAccount;
_unit setVariable [_varName, _funds, true];
