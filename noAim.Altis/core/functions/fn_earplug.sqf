/*	
Author: Midnight	
File Description:	Turns on Headset / ear plugs on	

if(life_headSet)
	then {
	1 fadeSound 1;
	hint "Ohrstecker raus.";
	life_headSet = false;
} else {
	1 fadeSound 0.1;
	hint "Ohrstecker rein.";		
	life_headSet = true;
};*/

if(allowEarplug) then {
	1 fadesound 1;
	playSound "earplug";
	//1 fadesound life_earplugVolume;
	hintSilent localize "STR_NOTF_Earplug_off";
	hintSilent parseText format ["%1 <img size='2'  image='icons\mute.paa'/>"];
	allowEarplug = false;
} else {
	1 fadesound 0.05;
	//1 fadesound life_earplugVolume;
	hintSilent localize "STR_NOTF_Earplug_on";
	hintSilent parseText format ["%1 <img size='2'  image='icons\de_mute.paa'/>"];
	allowEarplug = true;
};