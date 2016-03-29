#include <macro.h>
/*/////////////////////////////////////////|//////////
//_______________________////////////////__|__////////
/|Made for ZoXXen.com    |/////////////____|____//////
/|Author:GamerDF         |///////////______|______////
/|Description: too lazy  |/////////////____|____//////
/|_______________________|///////////////  |  ////////
*////////////////////////////////////////~~|~~////////

private["_index","_data","_status"];
_index = [_this,0,0] call BIS_fnc_param;

disableSerialization;
waitUntil {!isNull findDisplay 6421};
_display = findDisplay 6421;
_cMessageList = _display displayCtrl 6422;
_cMessageShow = _display displayCtrl 6428;
_cMessageHeader = _display displayCtrl 6429;

_data = call compile (_cMessageList lnbData[_index,0]);

_status = "[OFFLINE]";
{
    if(getPlayerUID _x == _data select 0) then
    {
        _status = "[ONLINE]";
        life_smartphoneTarget = _x;
        ctrlEnable[6425,true];
		ctrlEnable[6426,true];
    };
}forEach playableUnits;

_cMessageHeader ctrlSetText format["%1 %2 schrieb:",_data select 3,_status];
_cMessageShow ctrlSetText format["%1",_data select 2];
