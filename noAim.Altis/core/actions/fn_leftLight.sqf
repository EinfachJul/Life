
Private ["_vehicle","_lightRed","_lightBlue","lightleft","_leftRed"];
if ((llinuse) in ["true"]) then 
{
deleteVehicle lightleft;
llinuse = "false";
}
else
{
	if(typeOf vehicle player == "C_Offroad_01_F") then {
	//if(typeOf vehicle player in ["C_Offroad_01_F","B_MRAP_01_F"]){
		lrinuse = "false";
		llinuse = "true";
		deleteVehicle lightright;
		_vehicle = vehicle player;
		_lightRed = [20, 20, 0.1];
		lightleft = "#lightpoint" createVehicle getpos _vehicle;
		lightleft setLightDayLight true;
		lightleft setLightColor _lightRed; 
		lightleft setLightBrightness 0.2;  
		lightleft setLightAmbient [2,2,0.1]; 
		lightleft lightAttachObject [_vehicle, [-0.9,-3,-0.4]];
		lightleft setLightAttenuation [0.181, 0, 1000, 130]; 
		lightleft setLightIntensity 20;
		lightleft setLightFlareSize 0.38;
		lightleft setLightFlareMaxDistance 300;
		lightleft setLightUseFlare true;

		_leftRed = true;  
		while{ (alive _vehicle)} do  
		{  
			if(!(_vehicle getVariable "lights")) exitWith {};
		  if(_leftRed) then  
		 {  
			_leftRed = false;  
		sleep 0.05;
		lightleft setLightBrightness 8;  
		 }  
		 else  
		 {  
			_leftRed = true;  
		lightleft setLightBrightness 0.0;  
		sleep 0.05;
		 };  
		  sleep 0.2;  
		};  
		deleteVehicle lightleft;
		llinuse = false;
		lrinuse = false;
	}; 
};
	
	