class RanLicenseShop {
idd = 9547;
name= "life_ranlicense_shop";
movingEnable = false;
enableSimulation = true;
onLoad = "uiNamespace setVariable [""RanLicenseShop"", _this select 0];";
objects[] = { };

	class controls {

		class RscTitleBackground: Life_RscText
		{
			idc = -1;

			text = "Licenses"; //--- ToDo: Localize;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 31 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(					profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class Mainbackground: Life_RscText
		{
			idc = -1;

			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 6.1 * GUI_GRID_H + GUI_GRID_Y;
			w = 31 * GUI_GRID_W;
			h = 13 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class listbox: Life_RscListBox
		{
			idc = 95127;
			sizeEx = 0.035;
			x = 4.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
		};
		class ShowLicenseslistbox: Life_RscListBox
		{
			idc = 95132;
			sizeEx = 0.035;
			x = 22 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
		};
		class MyLicenses: Life_RscText
		{
			idc = 55130;

			text = "Verfuegbar";
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class ShowLicenses: Life_RscText
		{
			idc = 55129;

			text = "Meine Lizenzen";
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class buybutton: Life_RscButtonMenu
		{
			idc = 55127;
			action = "if( (lbData[95127,lbCurSel (95127)] != """") ) then { [false, false, false, lbData[95127,lbCurSel (95127)]] call noaim_fnc_buyLicense; closeDialog 0; };";

			text = "Kaufen";
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
	};
};