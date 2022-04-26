params ["_unit",["_getBankAccount",false]];

private _varName = ["lbm_myFunds","moneymenu_myBankBalance"] select _getBankAccount;
private _funds = _unit getVariable [_varName,0];

_funds
