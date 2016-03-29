//Grid macros
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class marketView
{
	idd = 39500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
	
		class nAtabletMA : Life_RscPicture {
			idc = 3002;
			text = "textures\panel\tab-market.paa";
			//x -1.00 = links | 1.00 = rechts
			//y -1.00 = oben| 1.00 = unten
			x = -0.444999;
			y = -0.00433818;
			w = 1.80;
			h = 1.20;
		};
		class lblResourceName: RscText
		{
			idc = 1000;
			text = "Resource"; //--- ToDo: Localize;
			x = 10.5 * GUI_GRID_W + GUI_GRID_X; //13.0
			y = 7.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			sizeEx = 1.3 * GUI_GRID_H;
		};
		class lblResourcePrice: RscText
		{
			idc = 1001;
			text = "XXXXXXXXXXXXX€"; //--- ToDo: Localize;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 7.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorText[] = {0,1,0,1};
			sizeEx = 1.3 * GUI_GRID_H;
		};
		class RscStructuredText_1101: RscStructuredText
		{
			idc = 1101;
			text = "<t align='center'>Entwicklung</t>"; //--- ToDo: Localize;
			x = 15.95 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.8};
		};
		class picTrendGlobal: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 15.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class picTrendLocal: RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 15.5 * GUI_GRID_W + GUI_GRID_X;
			y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "Seit Serverstart"; //--- ToDo: Localize;
			x = 19.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			sizeEx = 1.2 * GUI_GRID_H;
		};
		class RscText_1003: RscText
		{
			idc = 1003;
			text = "Vor kurzem"; //--- ToDo: Localize;
			x = 19.5 * GUI_GRID_W + GUI_GRID_X;
			y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			sizeEx = 1.2 * GUI_GRID_H;
		};
		class lblTrendGlobal: RscText
		{
			idc = 1004;
			text = "xxxxxxxx€"; //--- ToDo: Localize;
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class lblTrendLocal: RscText
		{
			idc = 1005;
			text = "xxxxxxxx€"; //--- ToDo: Localize;
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
	
	class controls
	{
		class bClose: Life_RscButtonInvisible
		{
			idc = 2400;
			tooltip = "Schliessen";
			//text = "Schliessen"; //--- ToDo: Localize;
			x = 0.895;
			y = 0.905;
			w = (4.9 / 40);
			h = (2 / 40);
			onButtonClick="closeDialog 0;";
		};
		class listResources: RscListbox
		{
			idc = 1500;
			x = 1.0 * GUI_GRID_W + GUI_GRID_X; //1.5
			y = 5.75 * GUI_GRID_H + GUI_GRID_Y; //5.69
			w = 8.4 * GUI_GRID_W;
			h = 18.0 * GUI_GRID_H;
			onLBSelChanged = "[] spawn noaim_fnc_refreshMarketView";
		};
	};
};