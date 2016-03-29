#define GUI_GRID_H	(0.06)
class Life_atm_management {
	idd = 2700;
	name= "life_atm_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Display: Life_RscPicture
		{
			idc = -1;
			text = "textures\panel\phoneD.paa";
			x = -0.36;
			y = -0.13;
			w = 1.60;
			h = 1.20;
		};
		
		class Life_RscTitleBackground:Life_RscText 
		{
			idc = -1;
			x = 0.35;
			y = 0.16;
			w = 0.4875;
			h = 0.04;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	
	class controls {

		class CashTitle : Life_RscStructuredText
		{
			idc = 2701;
			text = "";
			x = 0.5625;
			y = 0.22;
			w = 0.275;
			h = 0.18;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class Title : Life_RscTitle {
			idc = -1;
			text = "$STR_ATM_Title";
			x = 0.55;
			y = 0.16;
			w = 0.275;
			h = 0.04;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {-1,-1,-1,0};
		};
		
		class k25Button : life_RscButtonMenu 
		{
			idc = -1;
			text = "25.000";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,0] spawn noaim_fnc_bankfast;";
			x = 0.36;
			y = 0.35;
			w = 0.170;
			h = (1 / 25);
		};
		
		class k100Button : life_RscButtonMenu 
		{
			idc = -1;
			text = "100.000";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,1] spawn noaim_fnc_bankfast;";
			x = 0.36;
			y = 0.41;
			w = 0.170;
			h = (1 / 25);
		};
		
		class k250Button : life_RscButtonMenu 
		{
			idc = -1;
			text = "250.000";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,2] spawn noaim_fnc_bankfast;";
			x = 0.36;
			y = 0.47;
			w = 0.170;
			h = (1 / 25);
		};
		
		class k500Button : life_RscButtonMenu 
		{
			idc = -1;
			text = "500.000";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,3] spawn noaim_fnc_bankfast;";
			x = 0.36;
			y = 0.53;
			w = 0.170;
			h = (1 / 25);
		};
		
		class ResetButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "Reset";
//	colorBackground[] = {0,0,1,0.75};
			onButtonClick = "[0,4] spawn noaim_fnc_bankfast;";
			x = 0.36;
			y = 0.59;
			w = 0.170;
			h = (1 / 25);
			class Attributes 
			{
				align = "left";
			};
		};
		
		class WithdrawButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_ATM_Withdraw";
			onButtonClick = "[] call noaim_fnc_bankWithdraw";
			
			x = 0.5625;
			y = 0.62;
			w = 0.275;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		
		class DepositButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_ATM_Deposit";
			onButtonClick = "[] call noaim_fnc_bankDeposit";
			x = 0.5625;
			y = 0.56;
			w = 0.275;
			h = 0.04;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class moneyEdit : Life_RscEdit 
		{
			idc = 2702;
			text = "1";
			sizeEx = GUI_GRID_H;
			x = 0.5625; 
			y = 0.44;
			w = 0.275; 
			h = 0.06;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class PlayerList : Life_RscListBox 
		{
			idc = 2703;
			x = 0.1375;
			y = 0.16;
			w = 0.2125;
			h = 0.6795;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class TransferButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_ATM_Transfer";
			onButtonClick = "[] call noaim_fnc_bankTransfer";
			x = 0.5625;
			y = 0.68;
			w = 0.275;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		
		class GangDeposit : TransferButton
		{
			idc = 2705;
			text = "$STR_pInAct_DepositToGang";
			onButtonClick = "[] call noaim_fnc_gangDeposit";
			x = 0.5625;
			y = 0.74;
			w = 0.275;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		
		/*class DepositallButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "Alles Einz.";
//	colorBackground[] = {0,1,0,0.75};
			onButtonClick = "[0,5] spawn noaim_fnc_bankfast;";
			x = 0.36;
			y = 0.65;
			w = 0.170;
			h = (1 / 25);
			class Attributes 
			{
				align = "left";
			};
		};*/
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.35;
			y = 0.8;
			w = 0.4875;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
	};
};