/*
	Author: HellsGateGaming.com
	Creates an intro on the bottom-right hand corner of the screen.
*/
//Start erst nach Spawn
waitUntil{ !isNull(findDisplay 38500)};
waitUntil{ isNull(findDisplay 38500)};

//_sound = ["welcomesnd","welcomesnd2","welcomesnd3","welcomesnd4"] call bis_fnc_selectRandom;
//playSound _sound;

if(life_firstSpawn) then {
	_sound = ["welcomesnd"] call bis_fnc_selectRandom;
	playSound _sound;
};

_onScreenTime = 2;

sleep 50; //Wait in seconds before the credits start after player is in-game
 
_role1 = "Willkommen auf dem Altis Life Server von";
_role1names = ["noAim"];
_role2 = "Besuche uns auf dem Teamspeak:";
_role2names = ["TS: 188.138.25.37"];
_role3 = "Unser Forum:";
_role3names = ["http://www.noaimlife.de"];
_role4 = "Beachtet immer die Regeln!";
_role4names = ["Diese findet ihr auf der Map"];
_role5 = "Neuerungen:";
_role5names = ["Findet ihr im Changelog"];
_role6 = "Beachtet immer die Regeln";
_role6names = ["So machts allen am meisten Spass!"];
_role7 = "Noch Fragen?";
_role7names = ["Dann komm ins TS oder frag im Forum"];

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
[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names],
[_role6, _role6names],
[_role7, _role7names]
];