/*
	File: fn_handleVehDamage.sqf
	Autor: MarkusSR1984
	
	Description: Verarbeitet den Schaden von Fahrzeugen, Verhindert Schaden am Tank und Reduziert den Kollisionsschaden
		
*/
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_selection = _this select 1;
_damage_handle = _this select 2;
_source = _this select 3;
_ammo = _this select 4;
_scale = 1;
if (_vehicle == ObjNull) exitwith {};
if !(alive _vehicle) exitWith {};
 if (_selection != "?" && _selection != "") then
{
	_oldDamage = if (_selection == "") then { damage _vehicle } else { _vehicle getHit _selection };

	if (!isNil "_oldDamage") then
	{	
		if ((_selection == "fuel_hit" || _selection == "palivo") &&  vehicleAntiExplode) then
		{
			_damage_handle = 0; // Keinen Schaden am Tank zulassen
		}
		else
		{
			if (_ammo == "" && vehicleDamageHandler) then // Reduce collision damage
			{
				 switch (true) do
				{
					case (_selection select [0,5] == "wheel"): { _scale = 0.2; };
					default                                    { _scale = 0.5; };
				};
				_damage_handle = ((_damage_handle - _oldDamage) * _scale) + _oldDamage;
			};
		};
	};
}
else
{
_damage_handle = 0;

};	
_damage_handle; // Rückgabewert			