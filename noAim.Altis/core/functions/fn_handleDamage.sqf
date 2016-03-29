/*
	Author: Bryan "Tonic" Boardwine
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep","_currdamage"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;
_currdamage = damage player;
_oldDamage = damage _unit;


//Internal Debugging.
if(!isNil "TON_Debug") then {
	systemChat format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];
};

//Handle the tazer first (Top-Priority).
if(!isNull _source && _source != _unit) then 
{
		_curWep = currentWeapon _source;
			
		if(_projectile in ["B_9x21_Ball"] && _curWep in ["hgun_P07_snds_F","hgun_P07_F","SMG_02_F"]) then {
			if(side _source == west && playerSide != west) then {
				private["_distance","_isVehicle","_isQuad"];
				//_distance = if(_projectile == "B_556x45_dual") then {100} else {35};
				_distance = if(_projectile == "B_9x21_Ball") then {50} else {35};
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","C_Kart_01_F","C_Kart_01_green_F","C_Kart_01_orange_F","C_Kart_01_white_F","C_Kart_01_yellow_F","C_Kart_01_black_F","B_Quadbike_01_F"]) then {true} else {false}} else {false};
				//_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
				
				//_damage = false;
				_damage = _currdamage;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !(_unit getVariable["restrained",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn noaim_fnc_tazed;
						} else {
							[_unit,_source] spawn noaim_fnc_tazed;
						};
					};
				};
			};
			
			if(playerSide == west && side _source == west) then {
				//_damage = false;
				private["_distance","_isVehicle","_isQuad"];
				_distance = if(_projectile == "B_9x21_Ball") then {15} else {15};
				_isVehicle = if(vehicle player != player) then {true} else {false};
				
				_damage = _currdamage;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !(_unit getVariable["restrained",false])) then {
						[_unit,_source] spawn noaim_fnc_tazed;
					};
				};
			};
		};
		
		if(_projectile in ["B_45ACP_Ball"] && _curWep in ["SMG_01_Holo_F"]) then {
			if(side _source == west && playerSide != west) then {
				private["_isVehicle"];
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_damage = _currdamage;
				_damage = false;
				_damageHandle = false;
				if(!(_isVehicle && !life_istazed)) then {
					[player,"Rubber Bullet",true] spawn noaim_fnc_Softair;
				};
			};
			
			if(playerSide == west && side _source == west) then {
				private["_isVehicle"];
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_damage = _currdamage;
				_damage = false;
				_damageHandle = false;
				if(!(_isVehicle && !life_istazed)) then {
					[player,"Rubber Bullet",true] spawn noaim_fnc_Softair;
				};
			};
		};
};

if (vehicle _unit == _unit) then
{
	if ( _source isKindOf "Air" OR _source isKindOf "Car" OR _source isKindOf "Boat" ) then
	{
		//diag_log "_Source is Vehicle, Not a player driving a vehicle"
		_damage = false;
		//[[player,"amovppnemstpsraswrfldnon"],"noaim_fnc_animSync",true,false] spawn noaim_fnc_DONE;
		[player,"amovppnemstpsraswrfldnon"] remoteExec ["noaim_fnc_animSync",-2];
	}
	else
	{
		_isVehicle = vehicle _source;
		if (_isVehicle isKindOf "Air" OR _isVehicle isKindOf "Car" OR _isVehicle isKindOf "Boat") then
		{
			_damage = _currdamage;
			[player,"amovppnemstpsraswrfldnon"] remoteExec ["noaim_fnc_animSync",-2];
			//[[player,"amovppnemstpsraswrfldnon"],"noaim_fnc_animSync",true,false] spawn noaim_fnc_DONE;
		};
	};
};
/* Anti VDM
if(vehicle _source isKindOf "LandVehicle") then {
	if(_source != _unit AND {alive _unit} AND {isPlayer _source}) then {
		_damage = 0.001;
	};
};*/

[] call noaim_fnc_status_bar;
_damage;