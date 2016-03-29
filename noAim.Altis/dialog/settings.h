class SettingsMenu
{
	idd = 2900;
	name = "SettingsMenu";
	movingEnabled = 1;
	enableSimulation = 1;
	
	class controlsBackground
	{
		class nAtabletS : Life_RscPicture {
			idc = 3002;
			text = "textures\panel\tab-settings.paa";
			x = -0.444999;
			y = -0.00433818;
			w = 1.80;
			h = 1.20;
		};
		
		/*class RscTitleBackground : life_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};*/
		
		/*class RscMainBackground : life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.43 - (22 / 250);
		};*/
		
		class PlayerTagsHeader : Life_RscText
		{
			idc = -1;
			text = "$STR_SM_PlayerTags";
			colorBackground[] = {0, 0, 0,0.7};
			x = 0.02;
			y = 0.63;
			w = 0.35;
			h = (1 / 25);
		};
		
		class SideChatHeader : PlayerTagsHeader
		{
			idc = -1;
			text = "$STR_SM_SC";
			shadow = 0;
			
			y = 0.68;
		};
		
		class RevealNearestHeader : PlayerTagsHeader
		{
			idc = -1;
			text = "Reveal Nearest Objects";
			
			y = 0.73;
		};
		
		/*class Title : life_RscTitle
		{
			idc = -1;
			colorBackground[] = {0,0,0,0};
			text = "$STR_SM_Title";
			x = 0.3;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};*/
	};
	
	class controls
	{
		class VDonFoot : life_RscText
		{
			idc = -1;
			text = "$STR_SM_onFoot";
			
			x = 0.021; y = 0.258;
			w = 0.275; h = 0.04;
		};
		
		class VDinCar : life_RscText
		{
			idc = -1;
			text = "$STR_SM_inCar";
			
			x = 0.021; y = 0.305;
			w = 0.275; h = 0.04;
		};
		
		class VDinAir : life_RscText
		{
			idc = -1;
			text = "$STR_SM_inAir";
			
			x = 0.021; y = 0.355;
			w = 0.275; h = 0.04;
		};
		
		class VD_onfoot_slider : life_RscXSliderH 
		{
			idc = 2901;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call noaim_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip1";
			x = 0.12;
			y = 0.30 - (1 / 25);
			
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_onfoot_value : life_RscText
		{
			idc = 2902;
			text = "";
			
			x = 0.40; y = 0.258;
			w = 0.275; h = 0.04;
		};
		
		class VD_car_slider : life_RscXSliderH 
		{
			idc = 2911;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call noaim_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip2";
			x = 0.12;
			y = 0.35 - (1 / 25);
			
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_car_value : life_RscText
		{
			idc = 2912;
			text = "";
			
			x = 0.40; y = 0.31;
			w = 0.275; h = 0.04;
		};
		
		class VD_air_slider : life_RscXSliderH 
		{
			idc = 2921;
			text = "";
			onSliderPosChanged = "[2,_this select 1] call noaim_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip3";
			x = 0.12;
			y = 0.40 - (1 / 25);
			
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_air_value : life_RscText
		{
			idc = 2922;
			text = "";
			
			x = 0.40; y = 0.36;
			w = 0.275; h = 0.04;
		};
		
		class PlayerTagsONOFF : Life_RscActiveText
		{
			text = "ON";
			tooltip = "$STR_GUI_PlayTags";
			colorDisabled[] = {1,1,1,0.3};
			idc = 2970;
			sizeEx = 0.04;
			x = 0.37;
			y = 0.63;
			w = 0.275;
		};
		
		class SideChatONOFF : PlayerTagsONOFF
		{
			idc = 2971;
			tooltip = "";
			action = "[] call noaim_fnc_sidechat;";
			y = 0.68;
		};
		
		class RevealONOFF : PlayerTagsONOFF
		{
			tooltip = "$STR_GUI_PlayerReveal";
			idc = 2972;
			y = 0.73;
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
	};
};