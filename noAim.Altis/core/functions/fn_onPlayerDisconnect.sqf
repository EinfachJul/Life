/*
	Author: Vampire
	Deletes Weapon Holders within 5m of the disconnecting player.
*/
_id = _this select 0; 
_pname = _this select 1; 
_puid  = _this select 2;

call cleanNearItems;

cleanNearItems = {	
	if (_pname != "__SERVER__") then {
		
		_player = objNull;
		{
			if (getPlayerUID _x == _puid) exitWith
			{
				_player = _x;
			};
		} forEach playableUnits; 
		
		if (!(isNull _player)) then {
			_player removeWeapon (primaryWeapon _player);
			_player removeWeapon (handGunWeapon _player);

			{
				deleteVehicle _x
			} forEach nearestObjects [_player, ["GroundWeaponHolder"], 5];
		};
	};
};