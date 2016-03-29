#define COLOR_HALF_BLACK { 0, 0, 0, 0.5 }

class playerHUD
	{
	idd=-1;
	movingEnable=0;
  	fadein=0;
	duration = 99999999999999999999999999999999999999999999;
  	fadeout=0;
	name="playerHUD";
	onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
	objects[]={};
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class foodHIcon : life_RscPicture 
		{
			idc = 23531;
			text = "icons\food.paa";
			x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.575;
			w = 0.05; h = 0.06;
			colorBackground[] = COLOR_HALF_BLACK;
		};
		
		class waterHIcon : life_RscPicture 
		{
			idc = 23532;
			text = "icons\water.paa";
			x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.510;
			w = 0.05; h = 0.06;
			colorBackground[] = COLOR_HALF_BLACK;
		};
		
		class healthHIcon : life_RscPicture
		{
			idc = 23533;
			text = "icons\health.paa";
			x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.445;
			w = 0.05; h = 0.06;
			colorBackground[] = COLOR_HALF_BLACK;
		};

		class bountyHIcon : life_RscPicture
		{
			idc = 23521;
			text = "icons\weight.paa";
			x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.380;
			w = 0.05; h = 0.06;
			colorBackground[] = COLOR_HALF_BLACK;
		};
	};
	
	class controls
	{
		class statusBarText 
		{
			idc = 1000;
			x = safezoneX + safezoneW - 1;
			y = safezoneY + safezoneH - 0.03;
			w = 1.00;
			h = 0.04;
			shadow = 2;
			colorBackground[] = { 1, 0.3, 0, 0.0 };
			font = "PuristaSemibold";
			size = 0.03;
			type = 13;
			style = 1;
			text = "";
			class Attributes 
			{
				align="right";
				color = "#FFFFFF";
			};
		};
		
		class foodtext
		{
			type=0;
			idc=23500;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.03;
			size=1;
			font="PuristaSemibold";
			colorBackground[] = COLOR_HALF_BLACK;
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};
		
		class watertext
		{
			type=0;
			idc=23510;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.03;
			size=1;
			font="PuristaSemibold";
			colorBackground[] = COLOR_HALF_BLACK;
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};
		
		class healthtext
		{
			type=0;
			idc=23515;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.03;
			size=1;
			font="PuristaSemibold";
			colorBackground[] = COLOR_HALF_BLACK;
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class bountytext
		{
			type=0;
			idc=23520;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.03;
			size=1;
			font="PuristaSemibold";
			colorBackground[] = COLOR_HALF_BLACK;
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		#define BaseTextID 3000
		#define BottomY 0.956 * safezoneH + safezoneY
		#define SeperationValue 0.04

		class BaseText : Life_RscStructuredText
		{
			idc = -1;
			type = 13;
			style = 0;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			font = "PuristaLight";
			text = "";
			size = 0.04;
			x = 0.667246 * safezoneW + safezoneX;
			y = 0.976 * safezoneH + safezoneY;
			w = 0.201542 * safezoneW;
			h = 0.024 * safezoneH;
		};
	};   
};