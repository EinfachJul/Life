/*
	File: fn_rightl.sqf
	Author: Dino
	
	Description:
	Adds car indicators!
*/
Private ["_vehicle","_lightRed","_lightBlue","_lightleft","_lightright","_leftRed"];
_vehicle = _this select 0;
	
if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "lights")) exitWith {};
_lightRed = [20, 20, 0.1];
_lightBlue = [20, 20, 0.1];

_lightleft = "#lightpoint" createVehicle getpos _vehicle;   
sleep 0.2;
_lightleft setLightColor _lightRed; 
_lightleft setLightBrightness 0.2;  
_lightleft setLightAmbient [0.1,0.1,1];

switch (typeOf _vehicle) do
{
	case "C_Offroad_01_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.84,-3,-0.4]];
	};
	
	case "C_SUV_01_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.76,-2.8,-0.2]];
	};
	
	case "C_Hatchback_01_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.65,-2.25,-0.25]];
	};
	
	case "C_Van_01_transport_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.98,-3.45,-0.65]];
	};
	
	case "C_Van_01_box_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.98,-3.45,-0.65]];
	};
	
	case "I_MRAP_03_F":
	{
		_lightleft lightAttachObject [_vehicle, [1.05,-3.2,0.03]];
	};
	//*********************** NEW
	case "I_Truck_02_box_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.98,-3.45,-0.65]];
	};
	
	case "I_Truck_02_covered_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.98,-3.45,-0.65]];
	};
	
	case "I_Truck_02_transport_F":
	{
		_lightleft lightAttachObject [_vehicle, [1.18,-5.1,-0.62]];
	};
	
	case "O_Truck_03_fuel_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.98,-3.45,-0.65]];
	};
	
	case "O_Truck_03_transport_F":
	{
		_lightleft lightAttachObject [_vehicle, [1.18,-5.1,-0.62]];
	};

	case "O_Truck_03_covered_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.98,-3.45,-0.65]];
	};
	
	case "O_Truck_03_device_F":
	{
		_lightleft lightAttachObject [_vehicle, [1.18,-5.1,-0.62]];
	};
	
	case "O_Truck_03_ammo_F":
	{
		_lightleft lightAttachObject [_vehicle, [1.18,-5.1,-0.62]];
	};
	
	case "O_Truck_02_fuel_F":
	{
		_lightleft lightAttachObject [_vehicle, [1.18,-5.1,-0.62]];
	};
	
	case "C_Kart_01_Blu_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.65,-2.25,-0.25]];
	};
	
	case "C_Kart_01_Fuel_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.65,-2.25,-0.25]];
	};
	
	case "C_Kart_01_Red_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.65,-2.25,-0.25]];
	};
	
	case "C_Kart_01_Vrana_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.65,-2.25,-0.25]];
	};
	
	case "C_Kart_01_black_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.65,-2.25,-0.25]];
	};
	
	case "C_Kart_01_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.65,-2.25,-0.25]];
	};
	
	case "C_Van_01_fuel_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.98,-3.45,-0.65]];
	};
	
	case "B_QuadBike_01_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.65,-2.25,-0.25]];
	};
	
	case "C_Hatchback_01_sport_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.65,-2.25,-0.25]];
	};
	
	case "C_Offroad_01_repair_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.84,-3,-0.4]];
	};
	
	case "B_MRAP_01_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.98,-3.45,-0.65]];
	};
	
	case "O_MRAP_02_F":
	{
		_lightleft lightAttachObject [_vehicle, [1.05,-3.2,0.03]];
	};
	
	case "B_MRAP_01_hmg_F":
	{
		_lightleft lightAttachObject [_vehicle, [1.05,-3.2,0.03]];
	};
	
	case "B_G_Offroad_01_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.84,-3,-0.4]];
	};
	
	case "B_G_Offroad_01_armed_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.84,-3,-0.4]];
	};
	
	case "I_G_Offroad_01_armed_F":
	{
		_lightleft lightAttachObject [_vehicle, [0.84,-3,-0.4]];
	};
	//*********************** NEW END
	case "B_Truck_01_transport_F":
	{
		_lightleft lightAttachObject [_vehicle, [1.18,-5.1,-0.62]];
	};
	
	case "B_Truck_01_covered_F":
	{
		_lightleft lightAttachObject [_vehicle, [1.18,-5.1,-0.62]];
	};
	
	case "B_Truck_01_fuel_F":
	{
		_lightleft lightAttachObject [_vehicle, [1.18,-5.1,-0.62]];
	};
	
	case "B_Truck_01_ammo_F":
	{
		_lightleft lightAttachObject [_vehicle, [1.18,-5.1,-0.62]];
	};
	
	case "B_Truck_01_Repair_F":
	{
		_lightleft lightAttachObject [_vehicle, [1.18,-5.1,-0.62]];
	};
	
	case "B_Truck_01_mover_F":
	{
		_lightleft lightAttachObject [_vehicle, [1.18,-5.1,-0.62]];
	};
	
	case "B_Truck_01_box_F":
	{
		_lightleft lightAttachObject [_vehicle, [1.18,-5.1,-0.62]];
	};
};

_lightleft setLightAttenuation [0.141, 0, 1000, 15]; 
_lightleft setLightIntensity 20;
_lightleft setLightFlareSize 0.12;
_lightleft setLightFlareMaxDistance 50;
_lightleft setLightUseFlare true;

_lightleft setLightDayLight true;

_leftRed = true;  
while{ (alive _vehicle)} do  
{  
	if(!(_vehicle getVariable "lights")) exitWith {};
	if(_leftRed) then  
	{  
		_leftRed = false;  
		sleep 0.1;
		_lightleft setLightBrightness 2;  
	}  
	else  
	{  
		_leftRed = true;  
		_lightleft setLightBrightness 0.0;  
		sleep 0.1;
	};  
	sleep (_this select 1);  
};  
deleteVehicle _lightleft;