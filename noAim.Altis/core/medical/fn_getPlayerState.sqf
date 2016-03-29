#include "..\..\macros.hpp"
/*
    Author: H4SHK3KS
    File: fn_getPlayerState.sqf
*/
private["_curTarget","_injury","_injuredList1","_injuredList2","_injuredList3"];
_curTarget = life_pInact_curTarget;
if(player distance _curTarget > 5) exitWith {};

_injuredList1 = ["Verstauchung","offene Wunde","Schürfwunde","Schleudertrauma","Fieber","Bluterguss"];
_injuredList2 = ["gebrochenes Bein","Gehirnerschütterung","Wundbrand","Bluthochdruck"];
_injuredList3 = ["innere Blutungen","abgeschnittener Arm","eingeschlagenes Auge","Kieferbruch"];

_damage = damage _curTarget;
if(_damage < 0.02) exitWith {hint "Die Person ist nicht verletzt!"};

switch(true) do {
	case (_damage < 0.6 && _damage > 0.3): {_injury = _injuredList2 select floor random count _injuredList2;};
	case (_damage >= 0.6): {_injury = _injuredList3 select floor random count _injuredList3;};
	default {_injury = _injuredList1 select floor random count _injuredList1;};
};
hint parseText format["<t color='#FF0000'><t size='1'>%1</t></t><br/><t color='#E74C3C'>Gesundheitsstatus: </t>%2 %<br/><t color='#E74C3C'>Verletzung: </t>%3"
,name _curTarget,(1 - _damage) * 100,_injury];