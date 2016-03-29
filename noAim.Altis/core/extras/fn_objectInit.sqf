/*
	File: fn_npcInit.sqf
	Author: MarkusSR1984
*/
_varCount = count _this;
_classname = _this select 0; 
_position = _this select 1;
_direction = _this select 2;
_pitch = 0;
_bank = 0;
_initCode = "";
	
switch (_varCount) do
{
	case 4:
	{
		_pitch = 0;
		_bank = 0;
		_initCode = (_this select 3);
					
	};
	case 6:
	{
		_pitch = _this select 3;
		_bank = _this select 4;
		_followterrain = _this select 5;
		_initCode = ""
	};
	case 7:
	{
		_pitch = _this select 3;
		_bank = _this select 4;
		_followterrain = _this select 5;
		_initCode = (_this select 6);
	};
};

_object = _classname createVehicleLocal [0,0,9999];	
_object call compile format["%1",_initCode];
_object setDamage 0;
_object setPosATL _position;
_object setDir _direction;

_aroundX = _pitch;
_aroundY = _bank;
_aroundZ = (360 - (_direction) - 360); 
_dirX = 0; 
_dirY = 1; 
_dirZ = 0; 
_upX = 0; 
_upY = 0; 
_upZ = 1; 

if (_aroundX != 0) then 
{ 
    _dirY = cos _aroundX; 
    _dirZ = sin _aroundX; 
    _upY = -sin _aroundX; 
    _upZ = cos _aroundX; 
}; 

if (_aroundY != 0) then 
{ 
    _dirX = _dirZ * sin _aroundY; 
    _dirZ = _dirZ * cos _aroundY; 
    _upX = _upZ * sin _aroundY; 
    _upZ = _upZ * cos _aroundY; 
}; 

if (_aroundZ != 0) then 
{ 
    _dirXTemp = _dirX; 
    _dirX = (_dirXTemp* cos _aroundZ) - (_dirY * sin _aroundZ); 
    _dirY = (_dirY * cos _aroundZ) + (_dirXTemp * sin _aroundZ);        
    _upXTemp = _upX; 
    _upX = (_upXTemp * cos _aroundZ) - (_upY * sin _aroundZ); 
    _upY = (_upY * cos _aroundZ) + (_upXTemp * sin _aroundZ); 		
};

_dir = [_dirX,_dirY,_dirZ]; 
_up = [_upX,_upY,_upZ]; 
_object setVectorDirAndUp [_dir,_up];