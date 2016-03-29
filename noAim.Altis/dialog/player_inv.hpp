#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	
	class controlsBackground {
		
		class nAtablet : Life_RscPicture {
			idc = 3002;
			text = "textures\panel\tablet.paa";
			//x -1.00 = links | 1.00 = rechts
			//y -1.00 = oben| 1.00 = unten
			x = -0.444999;
			y = -0.00433818;
			w = 1.80;
			h = 1.20;
		};
	
	/*
		class life_RscTitleBackground:life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.11])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.03])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',1])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
		
		class Title : life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_PM_Title";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
	*/
		
		class moneyStatusInfo : Life_RscStructuredText
		{
			idc = 2015;
			sizeEx = 0.020;
			text = "";
			x = 0.12;
			y = 0.23;
			w = 0.3;
			h = 0.6;
		};
		
		class PlayersWeight : life_RscTitle {
			idc = carry_weight;
			sizeEx = 0.030;
			//style = 1;
			x = 0.150; //0.100
			y = 0.559;
			text = "";
		};
		
		/*
		class PlayersName : Title {
			idc = carry_weight;
			style = 1;
			text = "";
		};*/
	};
	
	class controls {
	
		class itemList : life_RscListBox 
		{
			idc = item_list;
			sizeEx = 0.030;
			
			x = 0.60; y = 0.23;
			w = 0.265; h = 0.25;
		};
		
		class moneyEdit : Life_RscEdit 
		{
			idc = 2018;
			
			text = "1";
			sizeEx = 0.030;
			x = 0.13; y = 0.40;
			w = 0.18; h = 0.03;
		};
		
		class NearPlayers : Life_RscCombo 
		{
			idc = 2022;
			x = 0.13; y = 0.44;
			w = 0.18; h = 0.03;
		};
		
		class moneyDrop : Life_RscButtonInvisible
		{
			idc = 2001;
			tooltip = "Geben";
			//text = "$STR_Global_Give";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call noaim_fnc_giveMoney";
			sizeEx = 0.025;
			x = 0.132; y = 0.48;
			w = 0.1; h = 0.04;
		};
		
		class itemEdit : Life_RscEdit {
		
			idc = item_edit;
			text = "1";
			sizeEx = 0.030;
			x = 0.61; y = 0.49;
			w = 0.25; h = 0.03;
		
		};
		class iNearPlayers : Life_RscCombo
		{
			idc = 2023;
			x = 0.61; y = 0.53;
			w = 0.25; h = 0.03;
		};
		
		class DropButton : Life_RscButtonInvisible {
			
			idc = 2002;
			tooltip = "Geben";
			//text = "$STR_Global_Give";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call noaim_fnc_giveItem;";
			x = 0.787;
			y = 0.573;
			w = (3.5 / 40);
			h = (1 / 25);
		};
		
		class UseButton : Life_RscButtonInvisible {
			
			//text = "$STR_Global_Use";
			tooltip = "Benutzen";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call noaim_fnc_useItem;";
			x = 0.683;
			y = 0.573;
			w = (4 / 40);
			h = (1 / 25);
		};
		
		class RemoveButton : Life_RscButtonInvisible {
			
			//text = "$STR_Global_Remove";
			tooltip = "Entfernen";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call noaim_fnc_removeItem;";
			x = 0.60;
			y = 0.573;
			w = (3.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonClose : Life_RscButtonInvisible {
			idc = -1;
			tooltip = "Schliessen";
			//text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.895;
			y = 0.905;
			w = (4.9 / 40);
			h = (2 / 40);
		};
		
		class ButtonSettings : Life_RscButtonInvisible {
			idc = -1;
			tooltip = "Einstellung";
			//text = "$STR_Global_Settings";
			onButtonClick = "[] call noaim_fnc_settingsMenu;";
			x = 0.745;
			y = 0.80;
			w = (4.9 / 40);
			h = (6.2 / 40);
		};
		
		class ButtonMyGang : Life_RscButtonInvisible {
			idc = 2011;
			tooltip = "Gang";
			//text = "$STR_PM_MyGang";
			onButtonClick = "if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""Life_Create_Gang_Diag"";} else {[] spawn noaim_fnc_gangMenu;};};";
			x = 0.49;
			y = 0.630;
			w = (4.9 / 40);
			h = (6.2 / 40);
		};
		
		class Licenses_Menu : Life_RscControlsGroup
		{
			idc = -1;
			w = 0.24;
			h = 0.38;
			x = 0.36;
			y = 0.23;
			
			class Controls
			{
				class life_licenses : Life_RscStructuredText
				{
					idc = 2014;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.27; h = 0.65;
				};
			};
		};
		
		class ButtonGangList : Life_RscButtonMenu {
			idc = 2012;
			tooltip = "WantedList";
			text = "$STR_PM_WantedList";
			onButtonClick = "[] call noaim_fnc_wantedMenu";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.88;
			y = 0.69;
			w = (5.1 / 40);
			h = (1.8 / 40);
		};
		
		class ButtonFWList : Life_RscButtonMenu {
			idc = 2045;
			tooltip = "Feuerwehrliste";
			text = "Zentrale";
			//onButtonClick = "[] call noaim_fnc_wantedMenu";
			onButtonClick = "closeDialog 0; createdialog ""feuerwehr"";";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.88;
			y = 0.69;
			w = (5.1 / 40);
			h = (1.8 / 40);
		};
	
		class ButtonKeys : Life_RscButtonInvisible {
			idc = 2013;
			tooltip = "Schluessel";
			//text = "$STR_PM_KeyChain";
			onButtonClick = "createDialog ""Life_key_management"";";
			x = 0.62;
			y = 0.630;
			w = (4.9 / 40);
			h = (6.2 / 40);
		};
		
		class ButtonCell : Life_RscButtonInvisible {
			idc = 2014;
			//text = "SMS";
			tooltip = "SMS";
			onButtonClick = "[] call noaim_fnc_handy";
			//onButtonClick = "createDialog ""life_my_smartphone"";";
			x = 0.745;
			y = 0.630;
			w = (4.9 / 40);
			h = (6.2 / 40);
		};
		
		class ButtonSyncData : Life_RscButtonInvisible {
			idc = -1;
			//text = "$STR_PM_SyncData";
			tooltip = "Save";
			onButtonClick = "[] call SAX_fnc_syncData;";
			x = 0.895;
			y = 0.855;
			w = (4.9 / 40);
			h = (2 / 40);
		};

		class ButtonCallTaxi : Life_RscButtonInvisible {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			//text = "Taxi";
			tooltip = "Call Taxi";
			onButtonClick = "closeDialog 0;[] call noaim_fnc_taxi_call;";
			x = 0.62;
			y = 0.80;
			w = (4.9 / 40);
			h = (6.2 / 40);
		};
		
		class ButtonCallBackup : Life_RscButtonMenu { //Cops
			idc = 9414;
			//shortcuts[] = {0x00050000 + 2};
			tooltip = "Backup";
			text = "Backup";
			onButtonClick = "[] spawn noaim_fnc_requestBackup; _handled = true;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.88;
			y = 0.63;
			w = (5.1 / 40);
			h = (1.8 / 40);
		};

		class ButtonTaxiMenu : Life_RscButtonMenu { //Civs
			idc = 9810;
			//shortcuts[] = {0x00050000 + 2};
			text = "TaxiMenu";
			tooltip = "TaxiMenu";
			onButtonClick = "if (license_civ_taxi) then {closeDialog 0;[] spawn noaim_fnc_openTaxiMenu;};";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.88;
			y = 0.63;
			w = (5.1 / 40);
			h = (2 / 40);
		};
	
		class ButtonMarket : Life_RscButtonInvisible {
			idc = -1;
			//text = "Markt";
			tooltip = "Markt";
			onButtonClick = "[] call noaim_fnc_openMarketView;";
            x = 0.12;
            y = 0.630;
            w = (4.9 / 40);
            h = (6.2 / 40);
		};
		
		class ProfButton : Life_RscButtonInvisible {
 
			//text = "Skills";
			tooltip = "Skills";
			onButtonClick = "[] call noaim_fnc_profSetup;";
			x = 0.37;
			y = 0.630;
			w = (4.9 / 40);
			h = (6.2 / 40);
		};
		
		class ButtonCraft : Life_RscButtonInvisible {
			idc = 2025;
			//text = "$STR_PM_Craft";
			tooltip = "Craft";
			onButtonClick = "createDialog ""Life_craft"";";
            x = 0.248;
            y = 0.630;
            w = (4.9 / 40);
            h = (6.2 / 40);
        };
		
		class ButtonInfoz: Life_RscButtonInvisible {
			idc = -1;
			//text = "INFO";
			tooltip = "Info"; //--- ToDo: Localize;
			onButtonClick = "createDialog ""life_infos"";";
			x = 0.12;
			y = 0.80;
			w = (4.9 / 40);
			h = (6.2 / 40);
		};
		
		class ButtonRegelnz : Life_RscButtonInvisible {
			idc = -1;
			//text = "REGELN";
			tooltip = "Regeln";
			onButtonClick = "createDialog ""life_regeln"";";
			x = 0.248;
			y = 0.80;
			w = (4.9 / 40);
			h = (6.2 / 40);
		};
		
		class ButtonBussz : Life_RscButtonInvisible {
			idc = -1;
			//text = "BUßGELD";
			tooltip = "Bußgeld";
			onButtonClick = "createDialog ""life_bussgeld"";";
			x = 0.37;
			y = 0.80;
			w = (4.9 / 40);
			h = (6.2 / 40);
		};
		
		class ButtonTestss : Life_RscButtonInvisible {
			idc = -1;
			//text = "TEST";
			tooltip = "Test";
			onButtonClick = "closeDialog 0;";
			x = 0.494;
			y = 0.80;
			w = (4.9 / 40);
			h = (6.2 / 40);
		};
	};
};