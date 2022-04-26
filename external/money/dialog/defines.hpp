//CONTROLS =====================================================================
#define moneymenu_DIALOG           40000
#define moneymenu_title            40001
#define moneymenu_myfunds          40010
#define moneymenu_myfundsDesc      40011
#define moneymenu_input            40020
#define moneymenu_okbutton         40030
#define moneymenu_recipient        40040


//DIMENSIONS AND POSITIONS =====================================================

#define moneymenu_BG_W             (0.4 * X_SCALE)

#define moneymenu_Item_H           (0.025 * Y_SCALE)
#define moneymenu_Item_W           (0.025 * X_SCALE)
#define moneymenu_ItemSpace_Y      (0.0025 * SZ_SCALE)

#define moneymenu_Padding_Y        (0.5 * moneymenu_Item_H)
#define moneymenu_Padding_X        (0.5 * moneymenu_Item_W)

#define moneymenu_Info_W           (moneymenu_BG_W - 2*moneymenu_Padding_X)
#define moneymenu_Input_W          (0.45 * moneymenu_Info_W)
#define moneymenu_Recipient_W      (0.5 * moneymenu_Info_W)

#define moneymenu_Button_W         (0.15 * X_SCALE)

#define moneymenu_CloseButton_W    (moneymenu_Item_H - (2 * moneymenu_ItemSpace_Y))
#define moneymenu_TopBar_Y         (moneymenu_BG_Y - moneymenu_Item_H - moneymenu_ItemSpace_Y)

#define moneymenu_BG_H             (2*moneymenu_Item_H + 3*moneymenu_Padding_Y)
#define moneymenu_BG_X             CENTER(1, moneymenu_BG_W)
#define moneymenu_BG_Y             CENTER(1, moneymenu_BG_H)
