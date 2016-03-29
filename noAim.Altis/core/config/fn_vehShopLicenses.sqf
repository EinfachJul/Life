/*
	Author: Bryan "Tonic" Boardwine
	Checks what shop it is and sometimes the vehicle to determine whether or not they have the license.
	
	Returns:
	TRUE if they have the license or are allowed to get that specific vehicle without having that license.
	FALSE if they don't have the license or are not allowed to obtain that vehicle.
*/
private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

switch (life_veh_shop select 0) do
{
	case "kart_shop": {_ret = license_civ_gokart;};
	case "civ_car": {_ret = license_civ_driver;};
	case "civ_ship": {_ret = license_civ_boat;};
	case "civ_air": {_ret = license_civ_air;};
	case "civ_airXL": {_ret = license_civ_air;};
	case "civ_airXD": {_ret = license_civ_air;};
	case "civ_truck":	{_ret = license_civ_truck;};
	case "reb_car": {_ret = license_civ_rebel;};
	case "reb_air": {_ret = license_civ_rebel;};
	case "maf_car": {_ret = license_civ_mafia;};
	case "maf_air": {_ret = license_civ_mafia;};
	case "clan_veh": {_ret = license_civ_clanbase;};
	case "taxi_car": {_ret = license_civ_taxi;};
	case "donator_hq": {_ret = license_civ_donator;};
	case "civ_logistika": {_ret = license_civ_logistika;};
	case "container": {_ret = true;};
	case "fwehr_car": {_ret = license_fwehr_car;};
	case "fwehr_air": {_ret = license_fwehr_air;};
	case "fwehr_ship": {_ret = true;};
	case "cop_car": {_ret = true;};
	case "cop_air": {_ret = true;};
	case "cop_ship": {_ret = true;};
	case "gsg9_car": {_ret = license_cop_gsg9;};
	case "gsg9_air": {_ret = license_cop_gsg9;};
};

_ret;