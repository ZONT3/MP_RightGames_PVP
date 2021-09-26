waitUntil {vehicle player == player};

[] spawn ZONT_fnc_loadProfile;
[] spawn ZONT_fnc_autoSaveInit;

[] spawn ZONT_fnc_initTeleportTerminals;
//[] spawn ZONT_fnc_initArsenals;

[] spawn ZONT_fnc_addReverse;

[] execVM "chatCommands.sqf";

[] execVM "initPlayerAfterRespawn.sqf";

/******                            Zeus list                             ******/
/* MCH_ZEUS_LIST = [{
  if (isnull (finddisplay 312)) exitWith {};
  mpc_cc_name = format ["%1 (%2)", name player, getPlayerUID player];
  if (isNil 'mpv_current_curators') then {mpv_current_curators = []};

  if (!(mpc_cc_name in mpv_current_curators)) then {
      mpv_current_curators pushBack mpc_cc_name;
      publicVariable 'mpv_current_curators';
      (finddisplay 312) displayAddEventHandler ["Unload", {
          mpv_current_curators deleteAt (mpv_current_curators find mpc_cc_name);
          publicVariable 'mpv_current_curators';
          hintSilent "";
      }];
  };
  private _str = "<t color='#00FF00'>Активные зевсы:</t>";
  { _str = format ["%1<br/>%2", _str, _x]; } forEach mpv_current_curators;
  hintSilent parseText _str;
}, 1] call CBA_fnc_addPerFrameHandler; */


private _fn_checkSlotPermission = {
  waituntil { sleep 0.1; !isNil 'ZPR_roles' };
  if not ([[],[],_this] call ZONT_fnc_checkRole) then {
    ["absrole"] call ZONT_fnc_forceExit;
  };
};

private _var = [];
private _varg = group player getVariable ["ZPR_rr", ""];
private _vars =       player getVariable ["ZPR_rr", ""];
if (_varg != "") then { _var pushBack _varg };
if (_vars != "") then { _var pushBack _vars };
if (count _var > 0) then {
  _var spawn _fn_checkSlotPermission;
};

private _fn_moveToCustomSpawn = {
  params ['_player','_fn_moveToSpawn'];
  waituntil { sleep 0.1; !isNil 'ZPR_roles' };

  private _rhbz = [["RHBZ"]] call ZONT_fnc_checkRole;
  if _rhbz exitWith { [_player, true, 'MP_spawn_rhbz'] call _fn_moveToSpawn };
  private _vagner = [["Vagner"]] call ZONT_fnc_checkRole;
  if _vagner exitWith { [_player, true, 'MP_spawn_vagner'] call _fn_moveToSpawn };
  private _rr = [["RR"]] call ZONT_fnc_checkRole;
  if _rr exitWith { [_player, true, 'MP_spawn_rr'] call _fn_moveToSpawn };
  private _train = [["Civilian"]] call ZONT_fnc_checkRole;
  if _train exitWith { [_player, true, 'MP_spawn_civ'] call _fn_moveToSpawn };
  private _isis = [["ISIS"]] call ZONT_fnc_checkRole;
  if _isis exitWith { [_player, true, 'MP_spawn_isis'] call _fn_moveToSpawn };
};

private _fn_moveToSpawn = {
  params ["_player", "_cg", '_spawnName'];
  private _side = side _player;
  private _spawn = objnull;

  if (isNil '_spawnName') then {
    if (_side == east)       then { _spawn = MP_spawn_east };
    if (_side == west)       then { _spawn = MP_spawn_west };
    if (_side == resistance) then { _spawn = MP_spawn_guer };
  } else {
    _spawn = missionNamespace getVariable _spawnName;
  };

  if (!isNil '_spawn') then {
    _player setPosATL getPosATL _spawn;
    _player setDir getDir _spawn;
  };

  if (_cg) then {
    private _g = createGroup _side;
    [_player] joinSilent _g;
    _g deleteGroupWhenEmpty true;
  };
};

[player, false] call _fn_moveToSpawn;
[player, _fn_moveToSpawn] spawn _fn_moveToCustomSpawn;

MPC_DISPLAY_OPENED = createHashMap;
MPH_DisplyChecker = [{
  private _tmp = [];
  private _report = [];
  {
    private _id = str _x;
    if not (_id in MPC_DISPLAY_OPENED) then {
      _report pushBack _id;
    };
    _tmp pushBack [_id, true];
  } forEach allDisplays;
  MPC_DISPLAY_OPENED = createHashMapFromArray _tmp;
  _report spawn {
    {
      [format ["%1 [%2] OPENED %3", name player, getPlayerUID player, _this]] remoteExec ["ZONT_fnc_log", 2];
    } forEach _this;
  };
}, 1] call CBA_fnc_addPerFrameHandler;

/*
// Delete agents
[] spawn {
  waitUntil {
  	{
  		if (
        agent _x isKindOf "Rabbit_F" ||
        agent _x isKindOf "Snake_random_F" ||
        agent _x isKindOf "Servo_skull"
      ) then {
  			deleteVehicle agent _x;
  		};
  	} forEach agents;

  	sleep 0.01; false;
  };
};*/
