if ((joinmode==0) && playerSide != civilian) exitWith {hint "Komm in deiner Freizeit wieder ;)"; closeDialog 0;};
if(player getVariable "restrained") exitWith {hintSilent "Sie sind gefesselt und koennen nicht am Paintball teilnehmen!"};
if(life_is_arrested) exitWith {hintSilent "Sie koennen nicht an einem Paintballgame teilnehmen, da Sie momentan im Gefaengnis sitzen!"};
if (joinmode==0) then {
    _PUID = getPlayerUID player;
    _spielerGeld = life_znorak;
	if (life_znorak >= 2000) then {
		hint "Eine Anfrage wurde an den Server gesendet, bitte warte einen Moment";
		//[[_PUID,_spielerGeld],"TON_fnc_paintball",false,false] spawn noaim_fnc_LAST;
		[_PUID,_spielerGeld] remoteExec ["TON_fnc_paintball",2];
		stagelight
		//[] call noaim_fnc_saveGear;
		joinmode = 1;
		}else{
		hint "Du hast keine 2000 € dabei!";
	};
} else {
    hint "Du bist der Lobby bereits beigetreten, versuche es spaeter noch einmal!";
};