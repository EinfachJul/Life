/*
	File: craft.hpp
	Description: Crafting System
	Created by EdgeKiller
    Coder: EdgeKiller
*/
class Life_craft {
	idd = 666;
	name= "life_craft";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn noaim_fnc_craft";

	class controlsBackground {
	
		class nAtabltSPd : Life_RscPicture {
			idc = -1;
			text = "textures\panel\tab-craft.paa";
			//x -1.00 = links | 1.00 = rechts
			//y -1.00 = oben| 1.00 = unten
			x = -0.444999;
			y = -0.00433818;
			w = 1.80;
			h = 1.20;
		};
	};

	class controls {

		//Craft list
		class craftList : life_RscListBox
		{
			idc = 669;
			sizeEx = 0.030;
			onLBSelChanged = "[] spawn noaim_fnc_craft_update";
			x = 0.125;
			y = 0.25;
			w = 0.27; h = 0.68;
		};

		//Materials list
		class materialList : Life_RscControlsGroup
		{
			idc = 671;
			w = 0.265;
			h = 0.68;
			x = 0.41;
			y = 0.25;

			class Controls
			{
				class mats : Life_RscStructuredText
				{
					idc = 672;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.25; h = 0.64;
				};
			};
		};

		//FILTER
		class FilterList : Life_RscCombo
		{
			idc = 673;
			colorBackground[] = {0,0,0,0.7};
			onLBSelChanged  = "[] call noaim_fnc_craft_updateFilter";
			x = 0.69;
			y = 0.24;
			w = (5.25 / 30);
			h = (1 / 25);
		};

		//Craft button
		class ButtonCraft : Life_RscButtonInvisible {
			idc = 674;
			//text = "$STR_CRAFT_Button";
			tooltip = "Bauen";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "if(!life_is_processing) then {[] spawn noaim_fnc_craftAction};";
			x = 0.68;
			y = 0.52;
			w = (7.9 / 40);
			h = (1.6 / 25);
		};

		class CloseButtonKey : Life_RscButtonInvisible {
			idc = -1;
			tooltip = "Schliessen";
			//text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.895;
			y = 0.905;
			w = (5.2 / 40);
			h = (2 / 40);
		};
	};
}; 