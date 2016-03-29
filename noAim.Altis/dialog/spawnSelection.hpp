class life_spawn_selection
{
	idd = 38500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class Hintergrund: Life_RscPicture
		{
			idc = 38511;
			text = "textures\panel\spawn_panel.paa";
			
			x = -0.314999;
			y = -0.01433818;
			w = 1.4;
			h = 1.0;
		};
		
		class Title : Life_RscTitle //Linker
		{
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "$STR_Spawn_Title";
			x = 0.015; //0.025
			y = 0.125; //0.06
			w = 0.2625; 
			h = 0.04;
		};
		
		class SpawnPointTitle : Title
		{
			idc = 38501;
			//style = 1;
			text = "";
			x = 0.2625;  //0.2125
			y = 0.125;
			w = 0.55; 
			h = 0.04;
		};
		
		class MapView : Life_RscMapControl 
		{
			idc = 38502;
			colorBackground[] = {0.47,0.45,0,0.1};
			x = 0.4125; //0.4025 /
			y = 0.18; //
			w = 0.37; //
			h = 0.42;
			maxSatelliteAlpha = 0.75;//
			alphaFadeStartScale = 1.15;//
			alphaFadeEndScale = 1.29;//
		};
	};
	
	class controls
	{	
		class SpawnPointList: Life_RscListNBox
		{
			idc = 38510;
			text = "";
			sizeEx = 0.041;
			coloumns[] = {0,0,0.9};
			colorBackground[] = {0.47,0.45,0,0.1};
			colorPicture[] = {1,1,1,1};
			colorPictureSelected[] = {1,1,1,1};
			colorPictureDisabled[] = {1,1,1,1};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			x = -0.03; //-0.01
			y = 0.19; //
			w = 0.2925;//0.2625
			h = 0.62;
			onLBSelChanged = "_this call noaim_fnc_spawnPointSelected;";
		};
		
		class spawnButton : Life_RscButtonInvisible
		{
			idc = -1;
			//colorBackground[] = {0,0.72,1,0.5};
			//text = "$STR_Spawn_Spawn";
			align = "center";
			onButtonClick = "[] call noaim_fnc_spawnConfirm";
			x = 0.40; //0.32
			y = 0.62; //0.60
			w = 0.40; //
			h = 0.07; 
		};
	};
};