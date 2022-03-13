if ( ( ZPR_allowedIDs isEqualType [] ) and { 1 in ZPR_allowedIDs } ) exitWith {};

MPC_tpTriggers = call {
  private _res = [];
  {
    if ((vehicleVarName _x find "TPB_") == 0) then {
      _res pushBack _x;
    };
  } foreach allMissionObjects "EmptyDetector";
  _res
};

MPC_tpSpawn = [] spawn {
  while {true} do {
    _past = true;
    if (!isNil 'MPC_thirdPerson') then { _past = MPC_thirdPerson };
    MPC_thirdPerson = call {
      private _res = false;
      if (vehicle player != player) exitWith { true };
      { if (getPos player inArea _x) exitWith {_res = true} } forEach MPC_tpTriggers;
       _res
    };
    if (str _past != str MPC_thirdPerson) then {
      if (MPC_thirdPerson) then {
        hint "Вы вошли в зону, где разрешено третье лицо"
      } else {
        hint "Вы вышли из зоны, где разрешено третье лицо"
      }
    };
    sleep 0.25;
  };
};

MPC_tpHandler = [{
  if (isNil 'MPC_thirdPerson') exitWith {};
  if (!MPC_thirdPerson && cameraView == "External") then {
    player switchCamera "Internal";
    systemChat "Третье лицо вне базы разрешено только в технике!"
  }
}] call CBA_fnc_addPerFrameHandler;
