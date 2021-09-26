private _res = [MPS_BDL_locker, "getLocker", [_this]] call ZONT_fnc_bd_customRequest;

private _ret = [[[],[]],[[],[]],[[],[]],[[],[]]];
try {
  private _content = _res select 0 select 0;
  _ret = _content;
} catch {
  [MPS_BDL_locker, "addLocker", [_this]] call ZONT_fnc_bd_customRequest;
};

_ret;

// [[[],[]],[["G_Tactical_Black"],[1]],[["30Rnd_556x45_Stanag","20Rnd_762x51_Mag","9Rnd_45ACP_Mag","30Rnd_9x21_Mag","200Rnd_65x39_cased_Box","1Rnd_HE_Grenade_shell","HandGrenade","MiniGrenade","ACE_30Rnd_556x45_Stanag_M995_AP_mag","ACE_30Rnd_556x45_Stanag_Mk262_mag","ACE_30Rnd_556x45_Stanag_Mk318_mag"],[24,6,6,6,3,6,6,6,4,4,4]],[[],[]]]
