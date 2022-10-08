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


  private _fnc_class = switch (_class) do {
    case "OPTRE_M808S": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M808B2": {
      [_vehicle, "colorsand"] call BIS_fnc_initVehicle;
    };
    case "OPTRE_M808BM_UNSC": {
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
    case "SC_Mantis": {
      [_vehicle, "DesertCamo"] call BIS_fnc_initVehicle;
    };
    case "SC_EXT_Scorpion": {
      [_vehicle, "Tan"] call BIS_fnc_initVehicle;
    };
    case "SC_EXT_Ant_SE": {
      [_vehicle, "Tan"] call BIS_fnc_initVehicle;
    };
    case "SCEXT_Gator_Logistics_SE": {
      [_vehicle, "Tan"] call BIS_fnc_initVehicle;
    };
    case "SC_Gator_TO_SE": {
      [_vehicle, "Tan"] call BIS_fnc_initVehicle;
    };
    case "SCEXT_Gator_TC_A_SE": {
      [_vehicle, "Tan"] call BIS_fnc_initVehicle;
    };
    case "SCEXT_Gator_Flatbed_Trans_SE": {
      [_vehicle, "Tan"] call BIS_fnc_initVehicle;
    };
  };
};


VVS_HQ = [
];

VVS_Wheeled = [
];

VVS_CD = [
  "SC_EXT_Scorpion",
  "SC_EXT_Ant_SE",
  "OPTRE_M808B2",
  "OPTRE_M808BM_UNSC"
];

VVS_A124 = [
];

VVS_Wheeled_Spec = [
];

VVS_BMO = [
  "OPTRE_M412_IFV_UNSC",
  "OPTRE_M813_TT",
  "OPTRE_m1087_stallion_unsc_resupply",
  "OPTRE_m1087_stallion_cover_unsc",
  "OPTRE_m1087_stallion_unsc_refuel",
  "OPTRE_m1087_stallion_unsc_repair",
  "OPTRE_m1087_stallion_unsc_medical",
  "OPTRE_M12_FAV_APC_MED",
  "OPTRE_M12_FAV_APC",
  "OPTRE_M12_LRV",
  "OPTRE_M12R_AA",
  "OPTRE_M12A1_LRV",
  "SC_SaurusAPC_SE"
];

VVS_USAF = [

];

VVS_CBRN = [
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
