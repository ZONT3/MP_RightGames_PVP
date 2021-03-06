#include "..\dialog\defines.hpp"
disableSerialization;

_dialog = findDisplay moneymenu_DIALOG;
_list = _dialog displayCtrl moneymenu_recipient;

_allowedSides = player getVariable ["moneymenu_canTransferToSides",moneymenu_canTransferToSidesDefault];

_listIndex = 0;
{
    if (_x != player && alive _x && !isNull _x) then {
        if (side _x == side player || (side _x) in _allowedSides) then {
            _list lbAdd (name _x);

            _list lbSetData [_listIndex, getplayerUID _x];
            _listIndex = _listIndex + 1;
        };
    };
} forEach (call BIS_fnc_listPlayers);

lbSort _list;

if (lbSize _list > 0) then {_list lbSetCurSel 0};
