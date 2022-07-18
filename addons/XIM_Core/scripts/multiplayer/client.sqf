
// ======================================== FUNCTIONS ========================================

XIM_fncPlayNext = // submits the provided unit's group to the server plus the unit's combat state, which triggers the publicVariable event handler
{
	params["_oPlayer",["_bXIMUseTimeOut",true]]; // defines the parameter _aPlayerMachineIDs in position zero
	XIM_aPlayNext = []; // defines XIM_aStateChange, which is an empty array
	XIM_aPlayNext pushBack group _oPlayer; // adds the player's group to XIM_aStateChange at position zero
	XIM_aPlayNext pushBack _oPlayer;
	XIM_aPlayNext pushBack _bXIMUseTimeOut; // Don't use timeout when user skips, instead it will call statechange on server for nice fadeout/in
	publicVariableServer "XIM_aPlayNext"; // sends the XIM_aStateChange variable to the server via its namespace
};

XIM_fncStopMusic =  // stops music playing on all clients in the group
{
	[""] remoteExecCall ["playMusic", group player, false]; // stops music playing on all clients in the group
	group player setVariable ["XIM_bMusicStopped", true]; // set the XIM_bMusicStopped variable to true in the group's namespace
};

XIM_fncStartMusic = // starts playing music for all clients in the group
{
	group player setVariable ["XIM_bMusicStopped", false]; // set the XIM_bMusicStopped variable to true in the group's namespace
	[player] call XIM_fncPlayNext;
};

// ======================================== EVENT HANDLERS ========================================

addMusicEventHandler ["MusicStart", {
	
	if !(XIM_bSystemEnabled) exitWith {}; 	//if mission has disabled XIM, they probably don't want the 'Now Playing' UI to pop up when Zeus/other script starts a song 
											//then again, the 'Now Playing' UI is kinda cool and Zeus/other might want it on. Consider removing this line and just adding a disclaimer to
											//'XIM_bSystemEnabled' in the CBA options that they also need to disable XIM_bNowPlayingEnabled if they want to hide the 'Now Playing' UI too.
	
	if (XIM_bNowPlayingEnabled) then
	{
		private _trackname = getText (configFile >> "CfgMusic" >> _this select 0 >> "name");
		private _artistname = getText (configFile >> "CfgMusic" >> _this select 0 >> "artist");
		[parseText format["Now playing<br/><t font='PuristaBold' size='1.6'>%1</t><br/><t font='PuristaBold' size='0.8'>%2</t>", _trackname,_artistname], true, nil, 5, 1, 0] spawn BIS_fnc_textTiles;
	};
}];

addMusicEventHandler ["MusicStop", // once the currently playing track has finished playing
{
	if ((leader (group player)) == player) then
	{
		[player] call XIM_fncPlayNext;
	};
}];