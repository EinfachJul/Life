#include "..\..\macros.hpp"
/*
Author: Bryan "Tonic" Boardwine
Loads the cops out with the default gear.
*/
private["_handle"];
_handle = [] spawn noaim_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
player addUniform "U_B_CombatUniform_mcam";
player addVest "V_BandollierB_blk";
player addHeadgear "H_Beret_blk";
player addWeapon "hgun_P07_snds_F";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio"; 

[] call noaim_fnc_updateClothing;
[] call noaim_fnc_saveGear;