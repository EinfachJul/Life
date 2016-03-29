/*
	@Author: Tonic
*/
private ["_vehicle","_lightRed","_lightBlue","_lightleft","_lightright","_leftRed","_brightness","_attach"];

_vehicle = _this select 0;

if (isNil "_vehicle" || isNull _vehicle || !(_vehicle getVariable "lights")) exitWith {};

switch (typeOf _vehicle) do {
	case "C_Hatchback_01_F": {_attach = [[-0.6, 2, -0.95], [0.6, 2, -0.95]];};
    case "C_Hatchback_01_sport_F": {_attach = [[-0.6, 2, -0.95], [0.6, 2, -0.95]];};
	case "C_Offroad_01_F": {_attach = [[-0.37, 0.0, 0.56], [0.37, 0.0, 0.56]];};
	case "C_SUV_01_F": {_attach = [[-0.4, 2.3, -0.55], [0.4, 2.3, -0.52]];};
	case "B_MRAP_01_F": {_attach = [[-1, -2.8, 0.55], [1, -2.8, 0.55]];};
	case "C_Kart_01_F": {_attach = [[-0.5, -0.8, -0.5], [-0.5, -0.8, -0.5]];};
	case "B_Quadbike_01_F": {_attach = [[-0.5, -0.8, -0.5], [-0.5, -0.8, -0.5]];};
	case "I_MRAP_03_F": {_attach = [[-0.37, -1.9, 0.7], [-0.37, -1.9, 0.7]];};
	case "I_G_Offroad_01_armed_F": {_attach = [[-0.37, 0.0, 0.56], [0.37, 0.0, 0.56]];};
	case "B_Heli_Light_01_F": {_attach = [[-0.37, 0.0, 0.56], [-0.37, 0.0, 0.56]];};
	case "I_Heli_light_03_unarmed_F": {_attach = [[1.23, 4.7, -1.42], [1.23, 4.7, -1.42]];};
	case "O_Heli_Light_02_unarmed_F": {_attach = [[1.23, 4.7, -1.42], [1.23, 4.7, -1.42]];};
	case "I_Heli_Transport_02_F": {_attach = [[1.3, 6.3, -2.65], [1.3, 6.3, -2.65]];};
	case "B_Heli_Transport_01_F": {_attach = [[-0.5, 0.0, 0.96], [-0.5, 0.0, 0.96]];};
};

_lightRed = [0.1, 0.1, 1];
_lightBlue = [0.1, 0.1, 1];

_lightleft = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;
_lightleft setLightColor _lightRed;
_lightleft setLightBrightness 0;
_lightleft lightAttachObject [_vehicle, _attach select 0];
_lightleft setLightAttenuation [0.181, 0, 1000, 130];
_lightleft setLightIntensity 25;
_lightleft setLightFlareSize 0.58;
_lightleft setLightFlareMaxDistance 150;
_lightleft setLightUseFlare true;
_lightleft setLightDayLight true;

_lightright = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;
_lightright setLightColor _lightBlue;
_lightright setLightBrightness 0;
_lightright lightAttachObject [_vehicle, _attach select 1];
_lightright setLightAttenuation [0.181, 0, 1000, 130];
_lightright setLightIntensity 20;
_lightright setLightFlareSize 0.38;
_lightright setLightFlareMaxDistance 150;
_lightright setLightUseFlare true;
_lightright setLightDayLight true;

if (sunOrMoon < 1) then {
	_brightness = 10;
} else {
	_brightness = 50;
};

_leftRed = true;  
while {(alive _vehicle)} do { 
	if (!(_vehicle getVariable "lights")) exitWith {};
	if (_leftRed) then {  
		_leftRed = false;  
		_lightright setLightBrightness 0;  
		sleep 0.1;
		_lightleft setLightBrightness _brightness;  
	} else {  
		_leftRed = true;  
		_lightleft setLightBrightness 0;  
		sleep 0.1;
		_lightright setLightBrightness _brightness;  
	};
	sleep 0.22;
};  
deleteVehicle _lightleft;
deleteVehicle _lightright;