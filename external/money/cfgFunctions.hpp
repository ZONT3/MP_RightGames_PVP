#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY external
#endif

class moneymenu {
    class common {
        file = MODULES_DIRECTORY\money\functions;

        class addCheckAction {};
        class addFunds {};
        class addGiveAction {};
        class addPlayerEHs {};
        class addSendAction {};
        class addTakeAction {};
        class addTransferAction {};
        class checkSend {};
        class formattedHint {};
        class getFunds {};
        class getModuleRoot {};
        class initModule {postInit = 1;};
        class loadMenu {};
        class receiveMoney {};
        class sendMoney {};
        class setCanGive {};
        class setCanTakeFromDead {};
        class setCanTakeFromSurrendered {};
        class setFunds {};
        class setStorage {};
        class setTransferToSides {};
        class updateMoney {};
        class updatePlayerList {};
    };
};
