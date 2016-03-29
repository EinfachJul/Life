/*
File: prof.hpp
Author: Jacob "PapaBear" Tyler
Edited By: [midgetgrimm]
Description:
Dialog for new gui
*/
class Life_Prof_Dialog
{
idd = 7730;
name = "life_prof_dialog";
movingEnabled = false;
enableSimulation = true;

class controlsBackground
{

		class nAtabletPR : Life_RscPicture
		{
			idc = 3001;
			text = "textures\panel\tab-skills.paa";
			x = -0.444999;
			y = -0.00433818;
			w = 1.80;
			h = 1.20;
		};
	/*
        class Frame2: Life_RscText
        {
            idc = -1;
            colorBackground[] = {0, 0, 0,0.7};
            x = 0.1; y = 0.15;
            w = 0.87;
            h = 0.61;
        };
        class Frame: life_RscTitle
        {
            idc = -1;
            text = "SKILL SYSTEM - GAIN EXPERIENCE";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            style = "0x03";
            tooltip = "Earning more experience helps you make more money, and make it faster!";
            //tooltipColorShade[] = {0.267,0.267,0.267,1};
            tooltipColorText[] = {1,1,1,1};
            tooltipColorBox[] = {1,1,1,1};
            x = 0.1;
            y = 0.05;
            w = 0.85;
            h = (1 / 25);
        };*/
};
class controls
{
        class Prof_Text: life_RscListNBox
        {
            idc = 7731;
            colorBackground[] = {0, 0, 0, 0};
            text="";
			columns[] = {0,0.645,0.885,0.2};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
            style = "0x03";
            sizeEx = 0.04;
            //onLBSelChanged = "[_this] spawn noaim_fnc_grabSkills";
            x = -0.282; y = 0.24;
            w = 1.47; h = 0.65; //w 0.85
        };
        class CloseBTN: Life_RscButtonMenu
        {
            idc = -1;
			tooltip = "Schliessen";
			//text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.895;
			y = 0.905;
			w = (4.9 / 40);
			h = (2 / 40);
        };
		
		class Prof1_Text: Life_RscStructuredText
		{
			idc = 7732;
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;
		};
		class Prof2_Text: Life_RscStructuredText
		{
			idc = 7733;
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;
		};
		class Prof3_Text: Life_RscStructuredText
		{
			idc = 7734;
			x = 22 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;
		};
};
};