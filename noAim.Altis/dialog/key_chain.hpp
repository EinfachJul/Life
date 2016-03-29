class Life_key_management {
	idd = 2700;
	name= "life_key_chain";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn noaim_fnc_keyMenu;";
	
	class controlsBackground {
		class nAtabletK : Life_RscPicture {
			idc = 3003;
			text = "textures\panel\tab-keys.paa";
			//x -1.00 = links | 1.00 = rechts
			//y -1.00 = oben| 1.00 = unten
			x = -0.444999;
			y = -0.00433818;
			w = 1.80;
			h = 1.20;
		};
		
		class Life_RscTitleBackground:Life_RscText {
		//	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
		//	colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		class KeyChainList : Life_RscListBox 
		{
			idc = 2701;
			text = "";
			sizeEx = 0.035;	
			x = 0.18; //0.22
			y = 0.315;
			w = 0.65; //0.45
			h = 0.370;
		};

		class CloseButtonKey : Life_RscButtonInvisible {
			idc = -1;
			//text = "$STR_Global_Close";
			tooltip = "Schliessen";
			onButtonClick = "closeDialog 0;";
			x = 0.895;
			y = 0.905;
			w = (4.9 / 40);
			h = (2 / 40);
		};
		
		class NearPlayers : Life_RscCombo {
			idc = 2702;
			x = 0.365; y = 0.715;
			w = 0.275; h = 0.03;
		
		};
		
		class DropKey : Life_RscButtonInvisible {
			idc = -1;
			tooltip = "Wegwerfen";
			//text = "$STR_Keys_DropKey";
			onButtonClick = "[] call noaim_fnc_keyDrop";
			x = 0.50;//0.505
			y = 0.90;//0.895
			w = (9.05 / 40);
			h = (1 / 25);
		};
		
		class GiveKey : Life_RscButtonInvisible {
			idc = 2703;
			//text = "$STR_Keys_GiveKey";
			tooltip = "Geben";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call noaim_fnc_keyGive";
			x = 0.275;
			y = 0.78;
			w = (18.35 / 40);
			h = (1.3 / 25);
		};
	};
};