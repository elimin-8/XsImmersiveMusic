// put cba debug setting stuff here

if (isMultiplayer) then // if client is in multiplayer
{	
	if (isServer) then // runs on the dedicated server, or player host, either way it runs on machine id 2
	{
		[
            "XIM_bSystemEnabled", // the name of the variable which the output from the slider is assigned to
            "CHECKBOX", // interactive slider setting type
            ["Enable the entire system", "Untick this box to disable music playing for missions where a Zeus/other script handles music."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "Core"], // category the setting is in
            [true], // default value of true
            1, // enables synchronising the variable across clients. It is better to keep this synchronized as this is a major setting even though some players might not want to use it — they can simply set their music volume to 0.
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;
        
        [
            "XIM_bNowPlayingEnabled", // the name of the variable which the output from the slider is assigned to
            "CHECKBOX", // interactive slider setting type
            ["Enable 'Now Playing' UI", "Enable or disable the UI which displays the song currently playing when it starts."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "UI elements"], // category the setting is in
            [true], // default value of true
            0, // disables synchronising the variable across clients, as it is not needed
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;
        
        [
            "XIM_iCombatRange", // the name of the variable which the output from the slider is assigned to
            "SLIDER", // interactive slider setting type
            ["AI detection range", "The maximum range that AI can be from the player to instigate combat."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "Combat variables"], // category the setting is in, plus a subcategory
            [500, 2000, 500, 0], // minimum of 500, maximum of 2000, default of 500, no decimals
            1, // synchronises the variable across clients
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;

        [
            "XIM_iCombatRefreshTime", // the name of the variable which the output from the slider is assigned to
            "SLIDER", // interactive slider setting type
            ["Combat refresh time", "How often to check if the player is still in combat (in seconds)."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "Combat variables"], // category the setting is in
            [1, 300, 120, 0], // minimum of 1, maximum of 300, default of 120, no decimals
            1, // synchronises the variable across clients
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;

        [
            "XIM_bCombatMusicEnabled", // the name of the variable which the output from the slider is assigned to
            "CHECKBOX", // interactive checkbox setting type
            ["Enable combat music", "Enable or disable combat music playing."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "Music types"], // category the setting is in
            [true], // default value of true
            1, // synchronises the variable across clients
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;

        [
            "XIM_bStealthMusicEnabled", // the name of the variable which the output from the slider is assigned to
            "CHECKBOX", // interactive checkbox setting type
            ["Enable stealth music", "Enable or disable stealth music playing."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "Music types"], // category the setting is in
            [true], // default value of true
            1, // synchronises the variable across clients
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;

        [
            "XIM_bCalmMusicEnabled", // the name of the variable which the output from the slider is assigned to
            "CHECKBOX", // interactive checkbox setting type
            ["Enable calm music", "Enable or disable calm music playing."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "Music types"], // category the setting is in
            [true], // default value of true
            1, // synchronises the variable across clients
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;

        [
            "XIM_bMusicDelayEnabled", // the name of the variable which the output from the slider is assigned to
            "CHECKBOX", // interactive checkbox setting type
            ["Enable music delay", "Enable or disable music delay."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "Music delay"], // category the setting is in
            [false], // default value of true
            1, // synchronises the variable across clients
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;

        [
            "XIM_iMinMusicDelay", // the name of the variable which the output from the slider is assigned to
            "SLIDER", // interactive slider setting type
            ["Minimum music delay", "Set the minimum possible delay for the next track to play."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "Music delay"], // category the setting is in
            [10, 600, 10, 0], // minimum of 10, maximum of 600, default of 10, no decimals
            1, // synchronises the variable across clients
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;

        [
            "XIM_iMaxMusicDelay", // the name of the variable which the output from the slider is assigned to
            "SLIDER", // interactive slider setting type
            ["Maximum music delay", "Set the maximum possible delay for the next track to play."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "Music delay"], // category the setting is in
            [XIM_iMinMusicDelay, 600, 30, 0], // minimum of the minimum music delay, maximum of 600, default of 30, no decimals
            1, // synchronises the variable across clients
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;

		execVM "\XIM_Core\scripts\multiplayer\server.sqf"; // executes server.sqf
	};

    if (hasInterface) then // if the system has a "real player", false for dedicated and headless clients
	{
        [
            "XIM_bSystemEnabled", // the name of the variable which the output from the slider is assigned to
            "CHECKBOX", // interactive slider setting type
            ["Enable the entire system", "Untick this box to disable music playing for missions where a Zeus/other script handles music."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "Core"], // category the setting is in
            [true], // default value of true
            1, // enables synchronising the variable across clients. It is better to keep this synchronized as this is a major setting even though some players might not want to use it — they can simply set their music volume to 0.
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;
        
        [
            "XIM_bNowPlayingEnabled", // the name of the variable which the output from the slider is assigned to
            "CHECKBOX", // interactive slider setting type
            ["Enable 'Now Playing' UI", "Enable or disable the UI which displays the song currently playing when it starts."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "UI elements"], // category the setting is in
            [true], // default value of true
            0, // disables synchronising the variable across clients, as it is not needed
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;

        [
            "XIM_iCombatRange", // the name of the variable which the output from the slider is assigned to
            "SLIDER", // interactive slider setting type
            ["AI detection range", "The maximum range that AI can be from the player to instigate combat."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "Combat variables"], // category the setting is in, plus a subcategory
            [500, 2000, 500, 0], // minimum of 500, maximum of 2000, default of 500, no decimals
            1, // synchronises the variable across clients
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;

        [
            "XIM_iCombatRefreshTime", // the name of the variable which the output from the slider is assigned to
            "SLIDER", // interactive slider setting type
            ["Combat refresh time", "How often to check if the player is still in combat (in seconds)."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "Combat variables"], // category the setting is in
            [1, 300, 120, 0], // minimum of 1, maximum of 300, default of 120, no decimals
            1, // synchronises the variable across clients
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;

        [
            "XIM_bCombatMusicEnabled", // the name of the variable which the output from the slider is assigned to
            "CHECKBOX", // interactive checkbox setting type
            ["Enable combat music", "Enable or disable combat music playing."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "Music types"], // category the setting is in
            [true], // default value of true
            1, // synchronises the variable across clients
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;

        [
            "XIM_bStealthMusicEnabled", // the name of the variable which the output from the slider is assigned to
            "CHECKBOX", // interactive checkbox setting type
            ["Enable stealth music", "Enable or disable stealth music playing."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "Music types"], // category the setting is in
            [true], // default value of true
            1, // synchronises the variable across clients
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;

        [
            "XIM_bCalmMusicEnabled", // the name of the variable which the output from the slider is assigned to
            "CHECKBOX", // interactive checkbox setting type
            ["Enable calm music", "Enable or disable calm music playing."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "Music types"], // category the setting is in
            [true], // default value of true
            1, // synchronises the variable across clients
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;

        [
            "XIM_bMusicDelayEnabled", // the name of the variable which the output from the slider is assigned to
            "CHECKBOX", // interactive checkbox setting type
            ["Enable music delay", "Enable or disable music delay."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "Music delay"], // category the setting is in
            [false], // default value of true
            1, // synchronises the variable across clients
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;

        [
            "XIM_iMinMusicDelay", // the name of the variable which the output from the slider is assigned to
            "SLIDER", // interactive slider setting type
            ["Minimum music delay", "Set the minimum possible delay for the next track to play."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "Music delay"], // category the setting is in
            [10, 600, 10, 0], // minimum of 10, maximum of 600, default of 10, no decimals
            1, // synchronises the variable across clients
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;

        [
            "XIM_iMaxMusicDelay", // the name of the variable which the output from the slider is assigned to
            "SLIDER", // interactive slider setting type
            ["Maximum music delay", "Set the maximum possible delay for the next track to play."], // name and tooltip for the setting
            ["XIM - X's Immersive Music", "Music delay"], // category the setting is in
            [XIM_iMinMusicDelay, 600, 30, 0], // minimum of the minimum music delay, maximum of 600, default of 30, no decimals
            1, // synchronises the variable across clients
            {} // executes nothing when the setting is changed, as it is not necessary
        ] call cba_settings_fnc_init;


		execVM "\XIM_Core\scripts\multiplayer\client.sqf"; // executes client.sqf
	};
} 
else // if client is in singleplayer
{
    [
        "XIM_bSystemEnabled", // the name of the variable which the output from the slider is assigned to
        "CHECKBOX", // interactive slider setting type
        ["Enable the entire system", "Untick this box to disable music playing for missions where a Zeus or another script handles music."], // name and tooltip for the setting
        ["XIM - X's Immersive Music", "Core"], // category the setting is in
        [true], // default value of true
        1, // enables synchronising the variable across clients. It is better to keep this synchronized as this is a major setting even though some players might not want to use it — they can simply set their music volume to 0.
        {} // executes nothing when the setting is changed, as it is not necessary
    ] call cba_settings_fnc_init;
        
    [
        "XIM_iCombatRange", // the name of the variable which the output from the slider is assigned to
        "SLIDER", // interactive slider setting type
        ["AI detection range", "The maximum range that AI can be from the player to instigate combat."], // name and tooltip for the setting
        ["XIM - X's Immersive Music", "Combat variables"], // category the setting is in, plus a subcategory
        [500, 2000, 500, 0], // minimum of 500, maximum of 2000, default of 500, no decimals
        0, // disables synchronising the variable across clients, as it is not needed
        {} // executes nothing when the setting is changed, as it is not necessary
    ] call cba_settings_fnc_init;

    [
        "XIM_iCombatRefreshTime", // the name of the variable which the output from the slider is assigned to
        "SLIDER", // interactive slider setting type
        ["Combat refresh time", "How often to check if the player is still in combat (in seconds)."], // name and tooltip for the setting
        ["XIM - X's Immersive Music", "Combat variables"], // category the setting is in
        [1, 300, 120, 0], // minimum of 1, maximum of 300, default of 500, no decimals
        0, // disables synchronising the variable across clients, as it is not needed
        {} // executes nothing when the setting is changed, as it is not necessary
    ] call cba_settings_fnc_init;

    [
        "XIM_bCombatMusicEnabled", // the name of the variable which the output from the slider is assigned to
        "CHECKBOX", // interactive slider setting type
        ["Enable combat music", "Enable or disable combat music playing."], // name and tooltip for the setting
        ["XIM - X's Immersive Music", "Music types"], // category the setting is in
        [true], // default value of true
        0, // disables synchronising the variable across clients, as it is not needed
        {} // executes nothing when the setting is changed, as it is not necessary
    ] call cba_settings_fnc_init;

    [
        "XIM_bStealthMusicEnabled", // the name of the variable which the output from the slider is assigned to
        "CHECKBOX", // interactive slider setting type
        ["Enable stealth music", "Enable or disable stealth music playing."], // name and tooltip for the setting
        ["XIM - X's Immersive Music", "Music types"], // category the setting is in
        [true], // default value of true
        0, // disables synchronising the variable across clients, as it is not needed
        {} // executes nothing when the setting is changed, as it is not necessary
    ] call cba_settings_fnc_init;

    [
        "XIM_bCalmMusicEnabled", // the name of the variable which the output from the slider is assigned to
        "CHECKBOX", // interactive slider setting type
        ["Enable calm music", "Enable or disable calm music playing."], // name and tooltip for the setting
        ["XIM - X's Immersive Music", "Music types"], // category the setting is in
        [true], // default value of true
        0, // disables synchronising the variable across clients, as it is not needed
        {} // executes nothing when the setting is changed, as it is not necessary
    ] call cba_settings_fnc_init;

    [
        "XIM_bNowPlayingEnabled", // the name of the variable which the output from the slider is assigned to
        "CHECKBOX", // interactive slider setting type
        ["Enable 'Now Playing' UI", "Enable or disable the UI which displays the song currently playing when it starts."], // name and tooltip for the setting
        ["XIM - X's Immersive Music", "UI elements"], // category the setting is in
        [true], // default value of true
        0, // disables synchronising the variable across clients, as it is not needed
        {} // executes nothing when the setting is changed, as it is not necessary
    ] call cba_settings_fnc_init;

    [
        "XIM_bMusicDelayEnabled", // the name of the variable which the output from the slider is assigned to
        "CHECKBOX", // interactive checkbox setting type
        ["Enable music delay", "Enable or disable music delay."], // name and tooltip for the setting
        ["XIM - X's Immersive Music", "Music delay"], // category the setting is in
        [false], // default value of true
        0, // disables synchronising the variable across clients, as it is not needed
        {} // executes nothing when the setting is changed, as it is not necessary
    ] call cba_settings_fnc_init;

    [
        "XIM_iMinMusicDelay", // the name of the variable which the output from the slider is assigned to
        "SLIDER", // interactive slider setting type
        ["Minimum music delay", "Set the minimum possible delay for the next track to play."], // name and tooltip for the setting
        ["XIM - X's Immersive Music", "Music delay"], // category the setting is in
        [10, 600, 10, 0], // minimum of 10, maximum of 600, default of 10, no decimals
        0, // disables synchronising the variable across clients, as it is not needed
        {} // executes nothing when the setting is changed, as it is not necessary
    ] call cba_settings_fnc_init;

    [
        "XIM_iMaxMusicDelay", // the name of the variable which the output from the slider is assigned to
        "SLIDER", // interactive slider setting type
        ["Maximum music delay", "Set the maximum possible delay for the next track to play."], // name and tooltip for the setting
        ["XIM - X's Immersive Music", "Music delay"], // category the setting is in
        [XIM_iMinMusicDelay, 600, 30, 0], // minimum of the minimum music delay, maximum of 600, default of 30, no decimals
        0, // disables synchronising the variable across clients, as it is not needed
        {} // executes nothing when the setting is changed, as it is not necessary
    ] call cba_settings_fnc_init;

	execVM "\XIM_Core\scripts\singleplayer\client.sqf"; // executes client.sqf
};
