/*
	Author: Bryan "Tonic" Boardwine
	Pays the ticket.
*/
if(isnil {life_ticket_val} OR isNil {life_ticket_cop}) exitWith {};
if(life_znorak < life_ticket_val) exitWith
{
	if(life_zgazzy < life_ticket_val) exitWith 
	{
		hint localize "STR_Cop_Ticket_NotEnough";
		//[[1,"STR_Cop_Ticket_NotEnoughNOTF",true,[profileName]],"noaim_fnc_broadcast",life_ticket_cop,false] spawn noaim_fnc_TRY;
		[1,"STR_Cop_Ticket_NotEnoughNOTF",true,[profileName]] remoteExecCall ["noaim_fnc_broadcast",life_ticket_cop];
		closeDialog 0;
	};
	hint format[localize "STR_Cop_Ticket_Paid",[life_ticket_val] call noaim_fnc_numberText];
	life_zgazzy = life_zgazzy - life_ticket_val;
	life_ticket_paid = true;
	//[[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[life_ticket_val] call noaim_fnc_numberText]],"noaim_fnc_broadcast",west,false] spawn noaim_fnc_TRY;
	[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[life_ticket_val] call noaim_fnc_numberText]] remoteExecCall ["noaim_fnc_broadcast",west];
	
	//[[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]],"noaim_fnc_broadcast",life_ticket_cop,false] spawn noaim_fnc_TRY;
	[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]] remoteExecCall ["noaim_fnc_broadcast",life_ticket_cop];
	
	//[[life_ticket_val,player,life_ticket_cop],"noaim_fnc_ticketPaid",life_ticket_cop,false] spawn noaim_fnc_TRY;
	[life_ticket_val,player,life_ticket_cop] remoteExec ["noaim_fnc_ticketPaid",life_ticket_cop];
	
	[1] call SAX_fnc_updatePartial;
	//[[getPlayerUID player],"noaim_fnc_wantedRemove",false,false] spawn noaim_fnc_TRY;
	[getPlayerUID player] remoteExec ["noaim_fnc_wantedRemove",2];
	// [getPlayerUID player] remoteExec ["noaim_fnc_wantedRemove",2]; REMOTE
	closeDialog 0;
};

life_znorak = life_znorak - life_ticket_val;
life_ticket_paid = true;

//[[getPlayerUID player],"noaim_fnc_wantedRemove",false,false] spawn noaim_fnc_TRY;
[getPlayerUID player] remoteExec ["noaim_fnc_wantedRemove",2];
//[[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[life_ticket_val] call noaim_fnc_numberText]],"noaim_fnc_broadcast",west,false] spawn noaim_fnc_TRY;
[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[life_ticket_val] call noaim_fnc_numberText]] remoteExecCall ["noaim_fnc_broadcast",west];

[0] call SAX_fnc_updatePartial;
closeDialog 0;
//[[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]],"noaim_fnc_broadcast",life_ticket_cop,false] spawn noaim_fnc_TRY;
[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]] remoteExecCall ["noaim_fnc_broadcast",life_ticket_cop];
//[[life_ticket_val,player,life_ticket_cop],"noaim_fnc_ticketPaid",life_ticket_cop,false] spawn noaim_fnc_TRY;
[life_ticket_val,player,life_ticket_cop] remoteExec ["noaim_fnc_ticketPaid",life_ticket_cop];