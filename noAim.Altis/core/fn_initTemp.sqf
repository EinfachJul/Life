
_functions = [ [[],noaim_fnc_tempChannel] ];
{
    (_x select 0) spawn (_x select 1);
    sleep 0.5; //NOWX
} forEach _functions;

diag_log "Executed fsm";