class Life_My_Gang_Diag {
	idd = 2620;
	name= "life_my_gang_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class nAtabletG : Life_RscPicture {
			idc = 3004;
			text = "textures\panel\tab-gangverwalten.paa";
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
			idc = 2629;
			text = "";
			x = 0.22;
			y = 0.313;
			w = 0.6;
			h = (1 / 25);
		};
		
		class GangMemberList : Life_RscListBox 
		{
			idc = 2621;
			text = "";
			sizeEx = 0.035;
			
			x = 0.16; y = 0.38;
			w = 0.40; h = 0.44;
		};

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
		
		class GangLeave : Life_RscButtonInvisible {
			idc = -1;
			//text = "$STR_Gang_Leave";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call noaim_fnc_gangLeave";
			x = 0.58;
			y = 0.382;
			w = (10.1 / 40);
			h = (1 / 25);
		};
		
		class GangLock : Life_RscButtonInvisible 
		{
			idc = 2622;
			//text = "$STR_Gang_UpgradeSlots";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn noaim_fnc_gangUpgrade";
			x = 0.58;
			y = 0.433;
			w = (10.1 / 40);
			h = (1 / 25);
		};
		
		class GangKick : Life_RscButtonInvisible 
		{
			idc = 2624;
			//text = "$STR_Gang_Kick";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call noaim_fnc_gangKick";
			x = 0.58;
			y = 0.537;
			w = (10.1 / 40);
			h = (1 / 25);
		};
		
		class GangLeader : Life_RscButtonInvisible 
		{
			idc = 2625;
			//text = "$STR_Gang_SetLeader";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn noaim_fnc_gangNewLeader";
			x = 0.58;
			y = 0.59;
			w = (10.1 / 40);
			h = (1 / 25);
		};
		
		class InviteMember : Life_RscButtonInvisible 
		{
			idc = 2630;
			//text = "$STR_Gang_Invite_Player";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn noaim_fnc_gangInvitePlayer";
			x = 0.58;
			y = 0.642;
			w = (10.1 / 40);
			h = (1 / 25);
		};
		
		class DisbandGang : InviteMember
		{
			idc = 2631;
			//text = "$STR_Gang_Disband_Gang";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn noaim_fnc_gangDisband";
			x = 0.58;
			y = 0.485;
			w = (10.1 / 40);
			h = (1 / 25);
		};
		
		class ColorList : Life_RscCombo
		{
			idc = 2632;
			x = 0.58; y = 0.725;
			w = (10 / 40); h = 0.03;
		};
		
		class GangBank : Title {
			idc = 601;
			style = 1;
			text = "";
			x = 0.17; //0.24
		};
	};
};

class Life_Create_Gang_Diag {
	idd = 2520;
	name= "life_my_gang_menu_create";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 2520)}; ((findDisplay 2520) displayCtrl 2523) ctrlSetText format[localize ""STR_Gang_PriceTxt"",[(call life_gangPrice)] call noaim_fnc_numberText]};";
	
	class controlsBackground {
		class nAtabletGS : Life_RscPicture {
			idc = -1;
			text = "textures\panel\tab-gangerstellen.paa";
			//x -1.00 = links | 1.00 = rechts
			//y -1.00 = oben| 1.00 = unten
			x = -0.444999;
			y = -0.00433818;
			w = 1.80;
			h = 1.20;
		};
	};
	
	class controls {
	
		class InfoMsg : Life_RscStructuredText
		{
			idc = 2523;
			sizeEx = 0.020;
			text = "";
			x = 0.33;
			y = 0.50;
			w = 0.5; h = .11;
		};

		class CloseLoadMenu : Life_RscButtonInvisible {
			idc = -1;
			//text = "$STR_Global_Close";
			tooltip = "Schliessen";
			onButtonClick = "closeDialog 0;[] call noaim_fnc_p_updateMenu;";
			x = 0.895;
			y = 0.905;
			w = (4.9 / 40);
			h = (2 / 40);
		};
		
		class GangCreateField : Life_RscButtonInvisible {
			idc = -1;
			//text = "$STR_Gang_Create";
			tooltip = "Erstellen";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call noaim_fnc_createGang";
			x = 0.28;
			y = 0.685;
			w = (17.87 / 40);
			h = (1.22 / 25);
		};
		
		class CreateGangText : Life_RscEdit
		{
			idc = 2522;
			text = "$STR_Gang_YGN";
			
			x = 0.180 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.61;
			w = (13.2 / 40);
			h = (1.1 / 25);
		};
	};
};