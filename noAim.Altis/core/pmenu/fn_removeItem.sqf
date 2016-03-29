/*
	Author: Bryan "Tonic" Boardwine
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos","_ind"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;
if(_data == "") exitWith {hint "Sie haben nichts ausgewaehlt was entfernt werden soll.";};
if(!([_value] call TON_fnc_isnumber)) exitWith {hint "Sie haben kein Nummer eingegeben."};
if(parseNumber(_value) <= 0) exitWith {hint "Sie muessen eine summe angeben zum entfernen."};
_ind = [_data,life_illegal_items] call TON_fnc_index;
if(_ind != -1 && ([west,getPos player,100] call noaim_fnc_nearUnits)) exitWith {titleText["Dies ist ein Illegaler Gegenstand, und Polizisten sind in der naehe daher koennen Sie diesen Gegenstand hier nicht loswerden.","PLAIN"]};
if(player != vehicle player) exitWith {titleText["Sie koennen einen Gegenstand in einem Fahrzeug nicht loswerden, ausser Sie lagern dies im Kofferraum.","PLAIN"]};
if(!([false,_data,(parseNumber _value)] call noaim_fnc_handleInv)) exitWith {hint "Sie konnten diese menge an Gegenstaenden nicht entfernen, sind Sie sicher das Sie ueber soviele Gegenstaende verfuegen?"};
_type = [_data,0] call noaim_fnc_varHandle;
_type = [_type] call noaim_fnc_varToStr;
hint format["Sie haben erfolgreich %1 %2 von ihrem Inventar entfernt.",(parseNumber _value), _type];
	
[] call noaim_fnc_p_updateMenu;