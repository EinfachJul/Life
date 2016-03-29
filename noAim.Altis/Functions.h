class Socket_Reciever
{
	tag = "SAX";
	class SQL_Socket
	{
		file = "core\session";
		class requestReceived {};
		class dataQuery {};
		class insertPlayerInfo {};
		class updateRequest {};
		class syncData {};
		class updatePartial {};
	};
};

class NA_Addons
{
	tag = "NA";
	class A3W_fpsFix // sortiert
	{
		file = "core\addons\fpsFix";
		class loopSpread {};
		class vehicleManager {};
		class vehicleManagerEventCode {};
		class vehicleManagerInit {};
	};
};

class Life_Client_Core
{
	tag = "noaim";
	
	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class initCiv {};
		class initCop {};
		class initMedic {};
		class initAlac {};
		class initTemp {};
		class initObjects {};
	};

	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		class revivePlayer {};
		class revived {};
		class medicMarkers {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
		class medicSirenLights {};
		class medicLights {};
		class medicSiren {};
		class medicSiren2 {};
		class medicSiren3 {};
		class medicEnter {};
		class medicOpener {};
		class medShowId {}; // 25-07-2015
		class getPlayerState {};
		class healPlayer {};
		class medicservice {};
		class feuerwehr {};
	};
	
	class Actions
	{
		file = "core\actions";
		class buyLicense {};
		class healHospital {};
		class pushVehicle {};
		class repairTruck {};
		class serviceChopper {};
		class catchFish {};
		//class catchTurtle {};
		class dpFinish {};
		class dropFishingNet {};
		class gather {};
		class getDPMission {};
		class postBail {};
		class processAction {};
		class arrestAction {};
		class escortAction {};
		class impoundAction {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class unrestrainAction {};
		class searchAction {};
		class searchVehAction {};
		class pickupItem {};
		class pickupMoney {};
		class ticketAction {};
		class packupSpikes {};
		class storeVehicle {};
		class robAction {};
		class captureHideout {};
		class drugtestAction {};
		class extinguishJoint {};
		class surrender {};
		class robShops {};
		class robsmartphoneAction {};
		class processMultipleItems {};
		class tempSack {};
		class takeOrgans {};
		class craftAction {};
		class activateNitro {};
		class impoundPermAction {};
		class nonLethal {};
	};
	
	class Nightclub
	{
		file = "core\nightclub";
		class nclights {};
		class ncLightsOn {};
		class ncstage {};
		class ncsmoke {};
		class ncflash {};
		class ncFlashOn {};
		class ncnomusic {};
		class ncmusic {};
	};
	
	class Housing
	{
		file = "core\housing";
		class buyHouse {};
		class getBuildingPositions {};
		class houseMenu {};
		class lightHouse {};
		class lightHouseAction {};
		class sellHouse {};
		class initHouses {};
		class copBreakDoor {};
		class raidHouse {};
		class lockupHouse {};
		class copHouseOwner {};
		class lockHouse {};
	};
	
	class Config
	{
		file = "core\config";
		class updateClothing {};
		class licensePrice {};
		class vehicleColorCfg {};
		class vehicleColorStr {};
		class vehicleListCfg {};
		class licenseType {};
		class eatFood {};
		class drinkTrink {};
		class varHandle {};
		class varToStr {};
		class impoundPrice {};
		class itemWeight {};
		class taxRate {};
		class virt_shops {};
		class vehShopLicenses {};
		class vehicleAnimate {};
		class weaponShopCfg {};
		class vehicleWeightCfg {};
		class houseConfig {};
		class seizeCfg {};
		class resourceCfg {};
		class profType {};
		class profTypeDesc {};
		class vehicleColorCraftCfg {};
		
		//Clothing Store Configs
		class clothing_cop {};
		class clothing_gsg9 {};
		class clothing_bruce {};
		class clothing_reb {};
		class clothing_maf {};
		class clothing_dive {};
		class clothing_kart {};
		class clothing_donator {};
		class clothing_medic {};
		//class clothing_alac {};
		
		class craftCfg {};
	};
	
	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class pardon {};
		class giveItem {};
		class giveMoney {};
		class p_openMenu {};
		class p_updateMenu {};
		class removeItem {};
		class useItem {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class s_onSliderChange {};
		class updateViewDistance {};
		class settingsMenu {};
		class settingsInit {};
		class cellphone2 {};
		class AAN {};
		class wantedAddP {};
		class smartphone {};
		class handy {};
		class newMsg {};
		class showMsg {};
		class craft {};
		class craft_update {};
		class craft_updateFilter {};
	};
	
	class Functions
	{
		file = "core\functions";
		class setRating {};
		class calWeightDiff {};
		class fetchCfgDetails {};
		class handleInv {};
		class hudSetup {};
		class tazeSound {};
		class animSync {};
		class simDisable {};
		class keyHandler {};
		class mkeyHandler {};
		class dropItems {};
		class handleDamage {};
		class numberText {};
		class handleItem {};
		class accType {};
		class receiveItem {};
		class giveDiff {};
		class receiveMoney {};
		class playerTags {};
		class clearVehicleAmmo {};
		class pullOutVeh {};
		class nearUnits {};
		class actionKeyHandler {};
		class actionPickup {};
		class playerCount {};
		class fetchDeadGear {};
		class loadDeadGear {};
		class isnumeric {};
		class escInterupt {};
		class onTakeItem {};
		class fetchVehInfo {};
		class pushObject {};
		class onFired {};
		class revealObjects {};
		class nearestDoor {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isUIDActive {};
		class saveGear {};
		class loadGear {};
		class stripDownPlayer {};
		class fatigueReset {};
		class random {};
		class randomRound {};
		class globalSound {};
		class globalSoundClient {};
		class schutzSirene {};
		class emptyFuel {};
		class addsubstract {};
		class status_bar {};
		class cocheIntro {};
		class rdere {};
		class earplug {};
		class profSetUp {};
		class addexp {};
		class welcomeHint {}; //Maxi 2/6/2015 Adds a new dialog box when you join the server
		class civSeizeGear {};
		class playSound {};
		class bankfast {};
		class handleMoney {};
		class sidechat {};
		class goOff {};
		class ryn_message {};
		class searchPosEmpty {};
		class clientGangLeft {};
	};
	
	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class MP {};
		class MPexec {};
		class netSetVar {};
		class corpse {};
		class jumpFnc {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
		class say3D {};
	};
	
	class Civilian
	{
		file = "core\civilian";
		class jailMe {};
		class jail {};
		//class jailHungry {};
		class tazed {};
		class civLoadout {};
		class knockedOut {};
		class knockoutAction {};
		class robReceive {};
		class robPerson {};
		class removeLicenses {};
		class demoChargeTimer {};
		class hasOrgan {};
		class civIDShown {}; // 25-07-2015
		class civShowId {}; // 25-07-2015
        //class Lights {}; //GoKart Lights
		class startBlinker {};
		class startBlinkertwo {};
		class leftl {};
		class rightl {};
		class cookMeat {};
		class Softair {};
		class warnBlinker {};
	};
	
	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class openInventory {};
		class lockVehicle {};
		class vehicleOwners {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vehInventory {};
		class vehicleWeight {};
		class deviceMine {};
		class addVehicle2Chain {};
		class trackMarkers {};
		class updateVehTrunk {};
		class refuelVehicle {};
		class fixtrunk {};
		class vehiclecolor3DRefresh {};
	};
		
	class Cop
	{
		file = "core\cop";
		class copMarkers {};
		class copLights {};
		class copLoadout {};
		class vehInvSearch {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
		class Zrestrain {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class copSiren {};
		class spikeStripEffect {};
		class radar {};
		class questionDealer {};
		class sirenLights {};
		class licenseCheck {};
		class licensesRead {};
		class repairDoor {};
		class doorAnimate {};
		class copOpener {};
		class copSiren2 {};
		class copSiren3 {};
		class seizePlayerWeapon {};
		class seizePlayerWeaponAction {};
		class seizeObjects {};
		class copEnter {};
		class ticketPaid {};
		class showArrestDialog {};
		class arrestDialog_Arrest {};
		class wantedGrab {};
		class copShowId {};
		class requestBackup {};
		class copCrush {};
	};
	
	class Extras
	{
		file = "core\extras";	
		class objectInit {};
		class npcInit {};
		class jagen{};
		class hVehDamage {};
		class colortune {};
		class runtime {};
		class isUIDActive {}; // FIX 5
	};
	
	class emp
	{
		file = "core\emp";
		class openEmpMenu {};
		class isEmpOperator {};
		class scanVehicles {};
		class warnVehicle {};
		class empVehicle {};
		class vehicleWarned {};
		class vehicleEmpd {};
	};
	
	class loadoutz
	{
		file = "core\loadoutz";
		class reb_loadout_gunner {};
		class reb_loadout_base {};
		class reb_loadout_sniper {};
		class reb_loadout_assault {};
		class cop_loadout_sniper {};
		class cop_loadout_assault {};
		class gsg9_loadout_sniper {};
		class gsg9_loadout_assault {};
		class civ_loadout_diver {};
		class cop_loadout_diver {};
		//class gsg9_loadout_assault {};
	};
	
	class placeables
	{
		file = "core\placeables";
		class packupMauer {};
		class packupCone {};
		class packupSchranke {};
		class packupBarriere {};
		class schranke {};
		class mauer {};
		class roadcone {};
		class barrierlight {};
	};
	
	class info
	{
		file = "core\info";
		class infos {};
		class regeln {};
		class bussgeld {};
	};
	
	class Gangs
	{
		file = "core\gangs";
		class initGang {};
		class createGang {};
		class gangCreated {};
		class gangMenu {};
		class gangKick {};
		class gangLeave {};
		class gangNewLeader {};
		class gangUpgrade {};
		class gangInvitePlayer {};
		class gangInvite {};
		class gangDisband {};
		class gangDisbanded {};
		class gangMarkers {};
	};
	
	class Interactions
	{
		file = "core\interactions";
		class copInteractionMenu {};
		class vInteractionMenu {};
		class civInteractionMenu {};
		//class alacInteractionMenu {};
		class medInteractionMenu {};
		class bInteractionMenu {};
	};
	
	class Paintball
	{
		file = "core\paintball";
		class pb_response {};
	};
	
	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleCargoShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShop3DPreview {};
		class vehicleShopBuy {};
		class vehicleShopEnd3DPreview {};
		class vehicleShopInit3DPreview {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class licenses {};
		class sellLicense {};
		class getVehicleSellPrice {};
	};
	
	class Items
	{
		file = "core\items";
		class lockpick {};
		class handcuffkey {};
		class spikeStrip {};
		class jerryRefuel {};
		class flashbang {};
		class blastingCharge {};
		class defuseKit {};
		class storageBox {};
		class tracker {};
		class useAlkohol {};
		class useHeroin {};
		class useKokain {};
		class useKokain2{};
		class useMarihuana {};
		class useHaschisch {};
		class useSpirituosen {};
		class weedSmoke {};
		class boltcutter {};
		class pickaxeUse {};
		class CarAlarmSound {};
		class usetobacco {};
		class saegeUse {};
		class handcovesUse {};
		//class netzUse{}; item: netz
		class siebUse{};
		class shovelUse {};
		class wrench {};
		class placeObject {};
		class pickupObject {};
	};
	
	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
		class bankDeposit {};
		class bankWithdraw {};
		class bankTransfer {};
		class garageLBChange {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class safeFix {};
		class vehicleGarage {};
		class gangDeposit {};
		class calldialog {};
		class sendChannel {};
		class feuerwehrcall {};
	};

	class Temp
	{
		file = "core\temp";
		class tempInit {ext = ".fsm";};
		class tempChannel {ext = ".fsm";};
		class tempWeatherReset {ext = ".fsm";};
		class animations {};
		//class removeragents {ext = ".fsm";};
	};
	
	class Feuerwehr
	{
		file = "core\feuerwehr";
		class fw_call {};
		class fw_ticket_action {};
		class fw_ticket_give {};
		class fw_ticket_paid {};
		class fw_ticket_pay {};
		class fw_ticket_prompt {};
	};
	
	class Market
	{
		file = "core\market";
		class openMarketView;
		class refreshMarketView;
		class marketShortView;
		class marketGetBuyPrice;
		class marketGetSellPrice;
		//class marketconfiguration;
		class marketReset;
		class marketChange;
		class marketGetRow;
		class marketGetPriceRow;
		class marketSetPriceRow;
		class marketBuy;
		class marketSell;
	};
	
	class Taxi
	{
		file = "core\taxi";
		class taxi_call {};
		class taxi_respond {};
		class taxi_acceptCall {};
		class finishRide {};
		class openTaxiMenu {};
	};

	class Casino
	{
		file = "core\casino";
		class slotOpen {};
		class slotPlay {};
		class slotReward {};
		class blackjackInit {};
		class blackjackBet {};
		class blackjackHit {};
		class blackjackStay {};
	};
	
	class Foamy_Slavery
	{
		file = "core\slavery";
		class getoutofSlavery {};
		class sellHostage {};
		class sellHostageAction {};
	};
	
	class Banditz
	{
		file = "core\banditz";
		class Bandlicenses {};
		class Randlicenses {};
		class Mandlicenses {};
	};
	
	class Tuning
	{
		file = "core\tuning";
		class nitro {};
		class wheel {};
	};
};