params ["_displ", "_text", "_duration"];
disableSerialization;

_ctrl1 = _displ ctrlCreate ["RscText", -1];
_ctrl1 ctrlSetPosition [safezoneX + 0.05, safezoney + 0.05];
_ctrl1 ctrlSetText _text;
_ctrl1 ctrlCommit 0;

[_ctrl1, _duration] spawn {
  params ["_c", "_d"];
  sleep _d;
  ctrlDelete _c;
}
