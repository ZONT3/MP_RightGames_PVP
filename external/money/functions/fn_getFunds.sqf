params ["_unit",["_getBankAccount",false]];

private _varName = ["lbm_myFunds","moneymenu_myBankBalance"] select _getBankAccount;
private _funds = _unit getVariable [_varName,0];
private _money = [MPS_BDL_money, "loadMoney", [getPlayerUID _player]] call ZONT_fnc_bd_customRequest;
[MPS_BDL_money, "saveMoney", [getPlayerUID _player, _money]] call ZONT_fnc_bd_customRequest;

_funds
