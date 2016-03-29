Private ["_vehicle","_lightRed","_lightBlue","lightright","_leftRed"];
if ((lrinuse) in ["true"]) then 
{
	deleteVehicle lightright;
	lrinuse = "false";
}
else
{
	if(typeOf vehicle player == "C_Offroad_01_F") then {

		lrinuse = "true";
		llinuse = "false";
		deleteVehicle lightleft;
		_vehicle = vehicle player;
		_lightRed = [20, 20, 0.1];
		lightright = "#lightpoint" createVehicle getpos _vehicle;
		lightright setLightDayLight true;
		lightright setLightColor _lightRed; 
		lightright setLightBrightness 0.2;  
		lightright setLightAmbient [2,2,0.1]; 
		lightright lightAttachObject [_vehicle, [0.82,-3,-0.4]];
		lightright setLightAttenuation [0.181, 0, 1000, 130]; 
		lightright setLightIntensity 20;
		lightright setLightFlareSize 0.38;
		lightright setLightFlareMaxDistance 300;
		lightright setLightUseFlare true;

		_leftRed = true;  
		while{ (alive _vehicle)} do  
		{  
			if(!(_vehicle getVariable "lights")) exitWith {};
			if(_leftRed) then  
			{  
				_leftRed = false;  
				sleep 0.05;
				lightright setLightBrightness 8;  
			}  
			else  
			{  
				_leftRed = true;
				lightright setLightBrightness 0.0;  
				sleep 0.05;
			};  
			sleep 0.2;  
		};  
		deleteVehicle lightright;
		llinuse = false;
		lrinuse = false;
	};
};   