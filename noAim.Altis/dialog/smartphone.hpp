class Life_my_smartphone {
	idd = 88888;
	name = "life_my_telephone_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn noaim_fnc_smartphone;";
	
	class controlsBackground {
		
		class nAtablet : Life_RscPicture {
			idc = 3001;
			text = "textures\panel\tab-sms.paa";
			//x -1.00 = links | 1.00 = rechts
			//y -1.00 = oben| 1.00 = unten
			x = -0.444999;
			y = -0.00433818;
			w = 1.80;
			h = 1.20;
		};
	};
	
	class controls {
		/*
		class MessageTitle : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 88886;
			text = "";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			x = 0.1;
			y = 0.25;
			w = 0.6;
			h = (1 / 25);
		};
		
		class RandomTitle : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 88890;
			text = "$STR_SMARTPHONE_RANDOMTITLE";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			x = 0.325;
			y = 0.25 + 0.3 + (1 / 25);
			w = 0.7;
			h = (1 / 25);
		};*/
		
		class PlayerList : Life_RscListBox
		{
			idc = 88881;
			onLBSelChanged = "[2] spawn noaim_fnc_smartphone;";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			x = 0.11;
			y = 0.234 + (1 / 25);
			w = 0.198;
			h = 0.68;
		};
		
		class MessageList : Life_RscListNBox
		{
			idc = 88882;
			onLBSelChanged = "[(lbCurSel 88882)] call noaim_fnc_showMsg;";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			colorBackground[] = {0.28,0.28,0.28,0.28};
			columns[] = {0,0.3};
			x = 0.325;
			y = 0.24 + (1 / 25);
			w = 0.54;
			h = 0.3;
		};

		class TextShow : Life_RscControlsGroup {
			x = 0.325;
			y =  0.25 + 0.3 + (1 / 25) + (1 / 25);
			w =  0.7;
			h =  0.24;
			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
				class showText : Life_RscStructuredText {
					idc = 88887;
					text = "";
					colorBackground[] = {0.28,0.28,0.28,0.28};
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					shadow = 0;
					x = 0;
					y = 0;
					w = 0.55;//w = 0.7;
					h = 1.7;//h = 2.15;
				};
			};
		};
		
		class Schreiben : Life_RscButtonInvisible {
			idc = 887892;
			tooltip = "Schreiben";
			//text = "$STR_SMARTPHONE_SCHREIBEN";
			onButtonClick = "createDialog ""Life_smartphone_schreiben"";";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			x = 0.51;
			y = 0.905;
			w = (8.7 / 40);
			h = (2 / 40);
		};
		/*
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_SMARTPHONE_TITLE";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		*/
		
		/*class PlayerListTitle : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_SMARTPHONE_PLAYERLISTTITLE";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			x = 0.11;
			y = 0.25;
			w = 0.2;
			h = (1 / 25);
		};*/
		
		class CloseLoadMenu : Life_RscButtonInvisible {
			idc = -1;
			tooltip = "Schliessen";
			//text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;[] call noaim_fnc_p_updateMenu";
			x = 0.895;
			y = 0.905;
			w = (4.9 / 40);
			h = (2 / 40);
		};
		
		class Notruf : Life_RscButtonInvisible {
			idc = -1;
			tooltip = "Notruf";
			//text = "$STR_SMARTPHONE_NOTRUF";
			onButtonClick = "createDialog ""Life_smartphone_notruf"";";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			x = 0.895;
			y = 0.855;
			w = (4.9 / 40);
			h = (2 / 40);
		};

		class DeleteMessages : Life_RscButtonInvisible {
			idc = -1;
			tooltip = "Löschen";
			//text = "Nachrichten löschen";
			onButtonClick = "[3] call noaim_fnc_smartphone;";
			colorBackground[] = { 0.584, 0.086, 0.086, 1.0 };
			x = 0.745;
			y = 0.905;
			w = (5.80 / 40);
			h = (2 / 40);
		};
	};
};

class Life_smartphone_schreiben
{
	idd = 88883;
	name = "life_my_smartphone_schreiben";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[0,(lbData[88881,(lbCurSel 88881)])] spawn noaim_fnc_newMsg;";
	
	class controlsBackground {
		class nAphone : Life_RscPicture 
		{
			idc = 3001;
			text = "textures\panel\tab-msg.paa";
			//text = "textures\panel\tab-notruf.paa";
			//x -1.00 = links | 1.00 = rechts
			//y -1.00 = oben| 1.00 = unten
			x = -0.444999;
			y = -0.00433818;
			w = 1.80;
			h = 1.20;
		};
	};
	class controls {
	
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 88886;
			text = "$STR_SMARTPHONE_NACHRICHTTITLE";
			x = 0.1;
			y = 0.2;
			w = 0.95;
			h = (1 / 25);
		};
		
		class Absenden : Life_RscButtonInvisible {
			idc = 88885;
			tooltip = "Absenden";
			//text = "$STR_SMARTPHONE_ABSENDEN";
			onButtonClick = "[1,-1,(ctrlText 88884)] call noaim_fnc_newMsg;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			x = 0.10;
			y = 0.69;
			w = 0.19;
			h = (1.02 / 25);
		};
		
		class AdminMsg : Life_RscButtonInvisible 
		{
			idc = 888897;
			tooltip = "Admin PN";
			//text = "$STR_CELL_AdminMsg";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			onButtonClick = "[5,-1,(ctrlText 88884)] call noaim_fnc_newMsg;";
			x = 0.70;
			y = 0.69;
			w = 0.19;
			h = (1.02 / 25);
		};
		
		class CopMsgTo : Life_RscButtonInvisible 
		{
			idc = 888998;
			tooltip = "Polizei PN";
			//text = "$STR_CELL_AdminMsg";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			onButtonClick = "[11,-1,(ctrlText 88884)] call noaim_fnc_newMsg;";
			x = 0.70;
			y = 0.75;
			w = 0.19;
			h = (1.02 / 25);
		};
		
		class FwMsgTo : Life_RscButtonInvisible 
		{
			idc = 888999;
			tooltip = "Feuerwehr PN";
			//text = "$STR_CELL_AdminMsg";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			onButtonClick = "[12,-1,(ctrlText 88884)] call noaim_fnc_newMsg;";
			x = 0.70;
			y = 0.81;
			w = 0.19;
			h = (1.02 / 25);
		};
		
		class Close : Life_RscButtonInvisible {
			idc = -1;
			tooltip = "Schliessen";
			//text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			x = 0.895;
			y = 0.905;
			w = (4.9 / 40);
			h = (2 / 40);
		};
		
		class textEdit : Life_RscEdit {
			idc = 88884;
			text = "";
			sizeEx = 0.030;
			x = 0.11; y = 0.47;
			w = 0.78; h = 0.17;
		};
	};
};

class Life_smartphone_notruf {
	idd = 887890;
	name= "life_my_smartphone_notruf";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[6] spawn noaim_fnc_newMsg;";
	
	class controlsBackground {
		
		class nAphone : Life_RscPicture 
		{
			idc = 3001;
			text = "textures\panel\tab-notruf.paa";
			//x -1.00 = links | 1.00 = rechts
			//y -1.00 = oben| 1.00 = unten
			x = -0.444999;
			y = -0.00433818;
			w = 1.80;
			h = 1.20;
		};
	};
	
	class controls {

		/*
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 888892;
			text = "$STR_SMARTPHONE_Notruftitle";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};*/
		
		class textEdit : Life_RscEdit
		{
			idc = 888894;
			text = "";
			sizeEx = 0.030;
			x = 0.11; y = 0.47;
			w = 0.78; h = 0.17;
		};
		
		class TxtCopButton : Life_RscButtonInvisible 
		{
			idc = 888895;
			tooltip = "Polizei";
			//text = "Test8";
			//text = "$STR_CELL_TextPolice";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[2,-1,(ctrlText 888894)] call noaim_fnc_newMsg;";
			
			x = 0.10;
			y = 0.69;
			w = 0.19;
			h = (1.02 / 25);
		};
		
		class TxtAdminButton : Life_RscButtonInvisible 
		{
			idc = 888896;
			tooltip = "Call Admin";
			//text = "$STR_CELL_TextAdmins";
			//text = "Test7";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[3,-1,(ctrlText 888894)] call noaim_fnc_newMsg;";
			
			x = 0.70;
			y = 0.69;
			w = 0.19;
			h = (1.02 / 25);
		};
		
		class AdminMsgAll : Life_RscButtonInvisible 
		{
			idc = 888898;
			//tooltip = "Admin News";
			//colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[7,-1,(ctrlText 888894)] call noaim_fnc_newMsg;";
			
			x = 0.70;
			y = 0.75;
			w = 0.19;
			h = (1.02 / 25);
		};
		
		class CopMsgAll : Life_RscButtonInvisible
		{
			idc = 888198;
			//text = "Cop News";
			//colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[9,-1,(ctrlText 888894)] call noaim_fnc_newMsg;";
			
			x = 0.10;
			y = 0.75;
			w = 0.19;
			h = (1.02 / 25);
		};
		
		class TaxiRequest : Life_RscButtonInvisible
		{
			idc = -1;
			tooltip = "Call Taxi";
			//text = "TAXI";
			//text = "Call Taxi";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[] call noaim_fnc_taxi_call";
			
			x = 0.50;
			y = 0.69;
			w = 0.19;
			h = (1.02 / 25);
		};
		
		class ButtonCallFWxz : Life_RscButtonInvisible
		{
			idc = 9811;
			tooltip = "FW Position";
			//text = "Test3";
			//text = "Call Taxi";
			colorBackground[] = {1,0,0,1};
			onButtonClick = "[] spawn noaim_fnc_fw_call; _handled = true;";	
			x = 0.30;
			y = 0.75;
			w = 0.19;
			h = (1.02 / 25);
		};
		
		class EMSReq : Life_RscButtonInvisible
		{
			idc = 888899;
			tooltip = "Feuerwehr Call";
			//text = "$STR_CELL_EMSRequest";
			//text = "Test2";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[4,-1,(ctrlText 888894)] call noaim_fnc_newMsg;";
			x = 0.30;
			y = 0.69;
			w = 0.19;
			h = (1.02 / 25);
		};
		
		class MedMsgAll : Life_RscButtonInvisible
		{
			idc = 888398;
			//text = "Med News";
			//text = "Test6";
			//colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[10,-1,(ctrlText 888894)] call noaim_fnc_newMsg;";
			
			x = 0.30;
			y = 0.81;
			w = 0.19;
			h = (1.02 / 25);
		};
		
		class CloseButton : Life_RscButtonInvisible {
			idc = -1;
			tooltip = "Schliessen";
			//text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.895;
			y = 0.905;
			w = (4.9 / 40);
			h = (2 / 40);
		};
	};
};