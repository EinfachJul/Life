private["_display","_text","_deathcorpse","_btn","_name"];
disableSerialization;
_display = findDisplay 13525;
_text = _display displayCtrl 13529;
_deathcorpse = lbData[13526,(lbCurSel 13526)];

_deathcorpse = call compile format["%1", _deathcorpse];
if(isNil "_deathcorpse") exitwith {};
if(isNull _deathcorpse) exitWith {};

_btn = _deathcorpse getvariable["fwoffline",false];

if(_btn) then {
	ctrlShow[13528,true]; ctrlShow[13527,false];
	_name = _deathcorpse getvariable["fwname",-1];
	_text ctrlSetStructuredText parseText format["<t size='1'><br/>Feuerwehr ist auf dem weg:<br/>%1 </t>",_name];
} else{
	_text ctrlSetStructuredText parseText format[""];
	ctrlShow[13528,false]; ctrlShow[13527,true];
};