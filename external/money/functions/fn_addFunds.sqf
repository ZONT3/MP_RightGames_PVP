params ["_unit", ["_funds",0], ["_addToBankAccount",false]];

if (!local _unit) exitWith {_this remoteExec ["moneymenu_fnc_addFunds",_unit,false]};

private _varName = ["lbm_myFunds","moneymenu_myBankBalance"] select _addToBankAccount;
_unit setVariable [_varName, ((_unit getVariable [_varName,0]) + _funds) max 0, true];

_unit getVariable _varName

private _money = [MPS_BDL_money, "loadMoney", [getPlayerUID _player]] call ZONT_fnc_bd_customRequest;
[MPS_BDL_money, "saveMoney", [getPlayerUID _player, _money]] call ZONT_fnc_bd_customRequest;
