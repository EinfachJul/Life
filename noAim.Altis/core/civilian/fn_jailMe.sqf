/*
	Author Bryan "Tonic" Boardwine
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown","_time"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,15,[0]] call BIS_fnc_param; //##80

_time = time + (_time * 60); //x Minutes

if(count _ret > 0) then { life_bail_amount = (_ret select 3); } else { life_bail_amount = 20000; /*_time = time + (10 * 60); */};
_esc = false;
_bail = false;

if(_time <= 0) then { _time = time + (15 * 60); hintC "Bitte einem Admin melden: JAIL_FALLBACK_15, die Zeit ist Null!"; };

[_bad,_time] spawn
{
	life_canpay_bail = false;
	if(_this select 0) then
	{
		sleep ( (_this select 1) * 0.5 );
	}
	else
	{
		sleep ( (_this select 1) * 0.2 );
	};
	life_canpay_bail = nil;
};

while {true} do
{
	if((round(_time - time)) > 0) then
	{
		_countDown = if(round (_time - time) > 60) then {format["%1 minute(s)",round(round(_time - time) / 60)]} else {format["%1 second(s)",round(_time - time)]};
		if(isNil "life_canpay_bail") then
		{
			hintSilent format[localize "STR_Jail_JailDisplay",_countDown,[life_bail_amount] call noaim_fnc_numberText];
		}
		else
		{
			hintSilent format[localize "STR_Jail_JailDisplayNoBail",_countDown];
		};
		
	};
	
	if(player distance (getMarkerPos "damdi_marker") > 70) exitWith
	{
		_esc = true;
	};
	
	if(life_bail_paid) exitWith
	{
		_bail = true;
	};
	
	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith
	{
	
	};
	sleep 1;
};


switch (true) do
{
	case (_bail) :
	{
		life_is_arrested = false;
		life_bail_paid = false;
		hint localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "yanki_release");
		//[[getPlayerUID player],"noaim_fnc_wantedRemove",false,false] spawn noaim_fnc_DONE;
		[getPlayerUID player] remoteExec ["noaim_fnc_wantedRemove",2];
		[5] call SAX_fnc_updatePartial;
	};
	
	case (_esc) :
	{
		life_is_arrested = false;
		hint localize "STR_Jail_EscapeSelf";
		[0,format["%1 has escaped from jail!", profileName]] remoteExecCall ["noaim_fnc_broadcast",nil];
		//[[0,format["%1 has escaped from jail!",profileName]],"noaim_fnc_broadcast",nil,false] spawn noaim_fnc_TRY;
		//[[getPlayerUID player,profileName,"901"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_DONE;
		[getPlayerUID player,name player,"901"] remoteExec ["noaim_fnc_wantedAdd",2];
		[5] call SAX_fnc_updatePartial;
	};
	
	case (alive player && !_esc && !_bail) :
	{
		life_is_arrested = false;
		hint localize "STR_yanki_released";
		[getPlayerUID player] remoteExec ["noaim_fnc_wantedRemove",2];
		//[[getPlayerUID player],"noaim_fnc_wantedRemove",false,false] spawn noaim_fnc_DONE;
		player setPos (getMarkerPos "yanki_release");
		[5] call SAX_fnc_updatePartial;
	};
};