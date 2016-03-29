/*
	Author: Bryan "Tonic" Boardwine
	Used for stripping certain licenses off of civilians as punishment.
*/
private["_state"];
_state = [_this,0,1,[0]] call BIS_fnc_param;

switch (_state) do
{
	//Death while being wanted
	case 0:
	{
		license_civ_driver = false;
		license_civ_heroin = false;
		license_civ_marijuana = false;
		license_civ_cocaine = false;
	};
	
	//Jail licenses
	case 1:
	{
		license_civ_gun = false;
		license_civ_driver = false;
		license_civ_jadgschein = false;
		//license_civ_truck = false;
		license_civ_kidney = false;
		license_civ_anwalt = false;
	};
	
	//Remove motor vehicle licenses
	case 2:
	{
		if(license_civ_driver) then {
			license_civ_driver = false;
			hint localize "STR_Civ_LicenseRemove_1";
		};
	};
	
	//Killing someone while owning a gun license
	case 3:
	{
		if(license_civ_gun) then {
			license_civ_gun = false;
			license_civ_jadgschein = false;
			hint localize "STR_Civ_LicenseRemove_2";
		};
	};
	//===================================== 28.11.2015
	//Remove motor vehicle licenses
	case 4:
	{
		if(license_civ_driver OR license_civ_truck) then {
			license_civ_driver = false;
			license_civ_truck = false;
			hint localize "STR_Civ_LicenseRemove_4";
		};
	};
	
	//Remove motor vehicle licenses
	case 5:
	{
		if(license_civ_air) then {
			license_civ_air = false;
			hint localize "STR_Civ_LicenseRemove_5";
		};
	};
	//Remove motor vehicle licenses
	case 6:
	{
		if(license_civ_boat) then {
			license_civ_boat = false;
			hint localize "STR_Civ_LicenseRemove_6";
		};
	};
	//===================================== 28.11.2015
};