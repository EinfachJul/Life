class life_infos
{
	idd = 4501;
	name = "life_infos";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn noaim_fnc_infos";

	class controlsBackground
	{
		class nAtabletIN : Life_RscPicture {
			idc = 3004;
			text = "textures\panel\tab-info.paa";
			//x -1.00 = links | 1.00 = rechts
			//y -1.00 = oben| 1.00 = unten
			x = -0.444999;
			y = -0.00433818;
			w = 1.80;
			h = 1.20;
		};
		class Title : life_RscTitle
		{
			idc = 4502;
			text = "Infos/Befehle";
			x = 11.1 * GUI_GRID_W + GUI_GRID_X;
			y = 1.0 * GUI_GRID_H + GUI_GRID_Y;
			w = 29 * GUI_GRID_W;
			h = 8.5 * GUI_GRID_H;
			//colorBackground[] = {0, 0, 0, 0.7};
			sizeEx =  0.035;
		};
	};
	
	class controls
	{
		class iText : Life_RscControlsGroup {
			x = 11.1 * GUI_GRID_W + GUI_GRID_X;
			y = 6.0 * GUI_GRID_H + GUI_GRID_Y;
			w = 29 * GUI_GRID_W;
			h = 16 * GUI_GRID_H;
			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
					class StructeredText : RscStructuredText {
					idc = 4503;
					//type = CT_STRUCTERED_TEXT;
					//style = 528;
					//colorBackground[] = {0,0,0,0.4};
					sizeEx = 0.035;
					text = "";
					x = 0 * GUI_GRID_W + GUI_GRID_X;
					y = 0 * GUI_GRID_H + GUI_GRID_Y;
					w = 0.70;
					h = 2;
				};
			};
			sizeEx =  0.025;
		};
		
		class iList: life_RscListBox
		{
			idc = 4504;
			onLBSelChanged = "[1] call noaim_fnc_infos;";

			x = 0.55 * GUI_GRID_W + GUI_GRID_X;
			y = 6.0 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.5 * GUI_GRID_W;
			h = 18.0 * GUI_GRID_H;
			sizeEx =  0.035;
			//colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0.4};
		};
		
		class CloseButtonKey : Life_RscButtonInvisible {
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