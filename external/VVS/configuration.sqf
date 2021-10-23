//	edited by [TF]def 2015 09 20 (0.4.1)
/**/
//Only display vehicles for that players side, if true Opfor can only spawn Opfor vehicles and so on.
VVS_SideOnly = false;

//Only set to true if you are making pre-made vehicle lists with VVS_x (i.e VVS_Car)
VVS_Premade_List = false;

ZONT_fnc_filterVVS = {
  switch(_this) do {
  	case "HQ": { VVS_HQ + VVS_Wheeled };
  	case "BTR": { VVS_BTR };
    case "Turel": { VVS_Turel };
    case "RMO": { VVS_RMO };
  	case "BMO": { VVS_BMO };
  	case "Wheeled": { VVS_Wheeled };
  	case "SWheeled": { VVS_Wheeled_Spec };
  	case "Tanks": { VVS_Tanks };
  	case "TV": { VVS_TV };
    case "BTR1": { VVS_BTR1 };
    case "Turel1": { VVS_Turel1 };

  	default {[]};
  };
};

ZONT_fnc_onSpawnVVS = {
  // params ["_mode", "_vehicle"];
  switch(_this) do {
  	case "TV": { {
      _vehicle setVehicleAmmo 0;
      _vehicle setFuel 0
    } };

  	default {nil};
  };
};


VVS_HQ = [

];

VVS_Wheeled = [
];

VVS_Tanks = [
  "LOP_UKR_T72BA",
  "LOP_UKR_T72BB",
  "LOP_UKR_2S1"
];

VVS_TV = [
  "LOP_NK_T34",
  "rhs_t72ba_tv"
];

VVS_BMO = [
  "LOP_US_UAZ",
  "LOP_US_UAZ_AGS",
  "LOP_US_UAZ_Open",
  "LOP_US_UAZ_SPG",
  "LOP_US_UAZ_DshKM",
  "UK3CB_ARD_O_Hilux_GMG",
  "UK3CB_ARD_O_Hilux_Dshkm",
  "UK3CB_ARD_O_Hilux_Closed",
  "UK3CB_ARD_O_Hilux_Open",
  "UK3CB_ARD_O_Hilux_Pkm",
  "UK3CB_ARD_O_Hilux_Spg9",
  "UK3CB_ARD_O_Hilux_Zu23"
  "RHS_Ural_MSV_01",
  "RHS_Ural_Fuel_MSV_01",
  "RHS_Ural_Open_VMF_01",
  "RHS_Ural_Repair_VMF_01",
  "UK3CB_CW_SOV_O_LATE_Kraz255_Open",
  "UK3CB_CW_SOV_O_EARLY_Kraz255_Fuel"
];

VVS_RMO = [
  "LOP_UKR_Ural",
  "LOP_UKR_Ural_open",
  "LOP_UA_Ural_fuel",
  "RHS_Ural_Repair_VMF_01",
  "rhs_kraz255b1_cargo_open_msv",
  "rhs_kraz255b1_fuel_msv",
  "LOP_UKR_UAZ_Open",
  "LOP_UKR_UAZ",
  "LOP_UKR_UAZ_AGS",
  "LOP_UKR_UAZ_DshKM",
  "LOP_UKR_UAZ_SPG",
  "UK3CB_ADC_O_LR_Open",
  "LOP_AM_OPF_Landrover",
  "UK3CB_ADE_I_LR_AGS30"
];

VVS_BTR = [
  "LOP_UKR_BTR60",
  "LOP_UKR_BTR70",
  "LOP_UKR_BTR80",
  "UK3CB_KDF_O_MTLB_PKT",
  "LOP_UKR_BMP1",
  "LOP_UKR_BMP2D"
];

VVS_Turel = [
  "rhsgref_nat_d30",
  "UK3CB_KDF_O_Ural_Zu23",
  "CUP_O_BMP2_ZU_TKA",
  "UK3CB_KDF_O_Gaz66_ZU23",
  "UK3CB_KDF_I_MTLB_ZU23"
];

VVVS_BTR1 = [
  "rhs_btr60_msv",
  "rhs_btr70_msv",
  "rhs_btr80_msv",
  "rhs_bmp2e_msv",
  "rhs_bmp1_msv",
  "UK3CB_KDF_I_MTLB_PKT",
  "cdf90_raf_BRDM2"
];

VVS_Turel1 = [
  "rhs_gaz66_zu23_msv",
  "RHS_Ural_Zu23_MSV_01",
  "UK3CB_CW_SOV_O_LATE_MTLB_ZU23",
  "rhs_D30_msv",
  "rhs_2s1_tv"
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
