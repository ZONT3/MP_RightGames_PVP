//	edited by [TF]def 2015 09 20 (0.4.1)
/**/
//Only display vehicles for that players side, if true Opfor can only spawn Opfor vehicles and so on.
VVS_SideOnly = false;

//Only set to true if you are making pre-made vehicle lists with VVS_x (i.e VVS_Car)
VVS_Premade_List = false;

ZONT_fnc_filterVVS = {
  switch(_this) do {
  	case "HQ": { VVS_HQ + VVS_Wheeled };
  	case "BMO": { VVS_BMO };
  	case "A10": { VVS_A10 };
  	case "Wheeled": { VVS_Wheeled };
  	case "SWheeled": { VVS_Wheeled_Spec };
  	case "CD": { VVS_CD };
    case "USAF": { VVS_USAF };
    case "CBRN": { VVS_CBRN };

  	default {[]};
  };
};

ZONT_fnc_onSpawnVVS = {
  params ["_vehicle", "_class", "_mode"];

  private _fnc_type = switch(_mode) do {
  	case "CD": {
      _vehicle setVehicleAmmo 0;
      _vehicle setFuel 0;
    };
  };

  private _fnc_class = switch (_class) do {
    case "OPTRE_M808S": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M808B2": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M808B_UNSC": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M813_TT": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12A1_LRV": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12R_AA": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12G1_LRV": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12_FAV_APC": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M12_LRV": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M412_IFV_UNSC": {
      [_vehicle, "colortan"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M413_MGS_UNSC": {
      [_vehicle, "colortan"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M494": {
      [_vehicle, "colordes"] call BIS_fnc_initVehicle;
    };
  };
};


VVS_HQ = [
];

VVS_Wheeled = [
];

VVS_CD = [
  "OPTRE_M494",
  "OPTRE_M808B_UNSC",
  "OPTRE_M808B2",
  "OPTRE_M808S"
];

VVS_A10 = [
  "OPTRE_M413_MGS_UNSC",
  "OPTRE_M412_IFV_UNSC"
];

VVS_Wheeled_Spec = [
  "OPTRE_M274_ATV"
];

VVS_BMO = [
  "OPTRE_M12_FAV_APC",
  "OPTRE_M12_LRV",
  "OPTRE_M12_FAV",
  "OPTRE_M12A1_LRV",
  "OPTRE_M12G1_LRV",
  "OPTRE_M12R_AA",
  "OPTRE_M813_TT",
  "OPTRE_M914_RV"
];

VVS_USAF = [

];

VVS_CBRN = [
  "OPTRE_M12_FAV_APC",
  "Typhoon_Truck_03_covered_F_U"
];


VVS_Car = [];
VVS_Air = [];
VVS_Ship = [];
VVS_Armored = [];
VVS_Autonomous = [];
VVS_Support = [];

VVS_R_Car = [];
VVS_R_Air = [];
VVS_R_Ship = [];
VVS_R_Armored = [];
VVS_R_Autonomous = [];
VVS_R_Support = [];


/*
this disableAI "move"; this disableAI "radioprotocol"; this disableAI "autocombat"; this disableAI "weaponaim";
this addAction [
"Запрос Техники",
VVS_fnc_openVVS,
[VVS_west_Land,"West"],
6,
true,
true,
"",
"true",
5
];
*/
