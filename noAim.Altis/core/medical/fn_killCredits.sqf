_onScreenTime = 8;

sleep 5; //Wait in seconds before the credits start after player is in-game
 
_role1 = "Du bist gestorben!";
_role1names = ["Doch ein Notarzt hilft gerne"];
_role2 = "Rufe einen Notarzt";
_role2names = ["Doch deine Wartezeit für ein neues Leben steigt"];
_role3 = "Wenn du keinen Notarzt brauchst";
_role3names = ["Beginnt dein neues Leben"];

{
	sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.65' color='#BFBFBF' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.80' color='#FFFFFF' align='right'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.9);
	[
	_finalText,
	[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
	[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
	_onScreenTime,
	0.5
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);
} forEach [
[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names]
];