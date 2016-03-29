#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class feuerwehr
{
	idd = 13525;
	movingEnabled = false;
	enableSimulation = true;
	onLoad = "[] spawn noaim_fnc_feuerwehr;";
	
	class controlsBackground
	{
		class fwbackground: life_RscText
		{
			idc = -1;
			x = 5.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 29 * GUI_GRID_W;
			h = 16.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.6};
		};

		class RscFrame_1800: life_RscFrame
		{
			idc = -1;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 14.5 * GUI_GRID_H;
		};
		class fwtext: life_RscStructuredText
		{
			idc = 13529;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 14.5 * GUI_GRID_H;
		};

		class RscText_1001: life_RscText
		{
			idc = -1;
			text = "Feuerwehr"; //--- ToDo: Localize;
			x = 5.5 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 29 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class RscFrame_1801: life_RscFrame
		{
			idc = -1;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 14.5 * GUI_GRID_H;
		};
	};
			
	class controls
	{		
		class totenliste: life_RscListbox
		{
			idc = 13526;
			sizeEx = 0.035;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 14.5 * GUI_GRID_H;
			onLBSelChanged = "[_this] spawn noaim_fnc_feuerwehrcall;";
		};
		class accept: life_RscButtonMenu
		{
			idc = 13527;
			text = "Bestätigen"; //--- ToDo: Localize;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick="[1] call noaim_fnc_medicservice;";
		};
		class close: life_RscButtonMenu
		{
			idc = -1;
			text = "Abbrechen"; //--- ToDo: Localize;
			x = 5.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick="closeDialog 0;";	
		};
		class closetwice: life_RscButtonMenu
		{
			idc = 13528;
			text = "Beenden"; //--- ToDo: Localize;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;	
			onButtonClick="[2] call noaim_fnc_medicservice;";
		};
	};
};
