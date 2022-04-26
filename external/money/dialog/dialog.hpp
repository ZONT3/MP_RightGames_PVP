class moneyMenu {
  idd = moneymenu_DIALOG;
  movingEnable = true;
  enableSimulation = true;

  class ControlsBackground {
    class MainBackground: mm_RscBackground {
      idc = -1;

      x = moneymenu_BG_X;
      y = moneymenu_BG_Y;
      w = moneymenu_BG_W;
      h = moneymenu_BG_H;
    };

    class TopBar: mm_RscBackground {
      idc = -1;
      moving = true;

      x = moneymenu_BG_X;
      y = moneymenu_TopBar_Y;
      w = moneymenu_BG_W;
      h = moneymenu_Item_H;
      colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0])",1};
    };

    class DialogTitleText: mm_RscText {
      idc = moneymenu_title;
      text = "Передать деньги (NAME)";

      x = moneymenu_BG_X;
      y = moneymenu_TopBar_Y;
      w = moneymenu_BG_W;
      h = moneymenu_Item_H;
    };

    class MyFundsText: mm_RscText {
      idc = moneymenu_myfundsDesc;
      text = "Мой Счет:";
      colorBackground[] = {0,0,0,0.5};
      x = moneymenu_BG_X + moneymenu_Padding_X;
      y = moneymenu_BG_Y + moneymenu_Padding_Y;
      w = moneymenu_Info_W;
      h = moneymenu_Item_H;
    };

    class MyFundsAmount: mm_RscTextRight {
      idc = moneymenu_myfunds;
      text = "Cr";
      x = moneymenu_BG_X + moneymenu_Padding_X;
      y = moneymenu_BG_Y + moneymenu_Padding_Y;
      w = moneymenu_Info_W;
      h = moneymenu_Item_H;
    };

    class GiveBG: mm_RscText {
      idc = -1;
      text = "Количество:";
      colorBackground[] = {0,0,0,0.5};
      x = moneymenu_BG_X + moneymenu_Padding_X;
      y = moneymenu_BG_Y + moneymenu_Padding_Y + moneymenu_Item_H + moneymenu_Padding_Y;
      w = moneymenu_Info_W;
      h = moneymenu_Item_H;
    };

    class GiveTextRight: mm_RscTextRight {
      idc = -1;
      text = "Cr";
      x = moneymenu_BG_X + moneymenu_Padding_X;
      y = moneymenu_BG_Y + moneymenu_Padding_Y + moneymenu_Item_H + moneymenu_Padding_Y;
      w = moneymenu_Info_W;
      h = moneymenu_Item_H;
    };
  };

  class Controls {
    class CloseButton: mm_RscCloseButton {
      idc = -1;
      x = moneymenu_BG_X + moneymenu_BG_W - moneymenu_ItemSpace_Y - moneymenu_CloseButton_W;
      y = moneymenu_TopBar_Y + moneymenu_ItemSpace_Y;
      w = moneymenu_CloseButton_W;
      h = moneymenu_CloseButton_W;
    };

    class InputBox: mm_RscEdit {
      idc = moneymenu_input;
      text = "0";
      style = ST_RIGHT;
      x = moneymenu_BG_X + moneymenu_Info_W - (moneymenu_Padding_X) - moneymenu_Input_W;
      y = moneymenu_BG_Y + moneymenu_Padding_Y + moneymenu_Item_H + moneymenu_Padding_Y;
      w = moneymenu_Input_W;
      h = moneymenu_Item_H;
    };

    class OKButton: mm_RscButton {
      idc = moneymenu_okbutton;
      action = "[] call moneymenu_fnc_checkSend";
      text = "OK";
      sizeEx = 0.04 * TEXT_SCALE;
      style = ST_RIGHT;

      x = moneymenu_BG_X + moneymenu_BG_W - moneymenu_Button_W;
      y = moneymenu_BG_Y + moneymenu_BG_H + moneymenu_ItemSpace_Y;
      w = moneymenu_Button_W;
      h = moneymenu_Item_H;
    };
  };
};

class moneyMenu_ATM: moneyMenu {
    idd = moneymenu_DIALOG;
    movingEnable = true;
    enableSimulation = true;

    class ControlsBackground: ControlsBackground {
        class MainBackground: MainBackground {
            h = moneymenu_BG_H + moneymenu_Padding_Y + moneymenu_Item_H;
        };

        class TopBar: TopBar {};
        class DialogTitleText: DialogTitleText {};
        class MyFundsText: MyFundsText {};
        class MyFundsAmount: MyFundsAmount {};
        class GiveBG: GiveBG {};
        class GiveTextRight: GiveTextRight {};

        class RecipientBG: mm_RscText {
            idc = -1;
            text = "Получатель:";
            colorBackground[] = {0,0,0,0.5};
            x = moneymenu_BG_X + moneymenu_Padding_X;
            y = moneymenu_BG_Y + moneymenu_Padding_Y + 2*moneymenu_Item_H + 2*moneymenu_Padding_Y;
            w = moneymenu_Info_W;
            h = moneymenu_Item_H;
        };
    };

    class Controls: Controls {
        class CloseButton: CloseButton {};

        class InputBox: InputBox {};

        class OKButton: OKButton {
            y = moneymenu_BG_Y + moneymenu_BG_H + moneymenu_ItemSpace_Y + moneymenu_Padding_Y + moneymenu_Item_H;
        };

        class Category: mm_RscCombo {
            idc = moneymenu_recipient;

            x = moneymenu_BG_X + moneymenu_Padding_X + moneymenu_Info_W - moneymenu_Recipient_W;
            y = moneymenu_BG_Y + moneymenu_Padding_Y + 2*moneymenu_Item_H + 2*moneymenu_Padding_Y;
            w = moneymenu_Recipient_W;
            h = moneymenu_Item_H;
        };
    };
};
