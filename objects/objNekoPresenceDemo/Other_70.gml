/// @description Capture async events from NekoPresence.

var ev_type = async_load[? "event_type"];

if (ev_type == "DiscordReady")
{
	ready = true;
	np_setpresence_timestamps(date_current_datetime(), 0, false);
	np_setpresence_more("Small image text", "Large image text", false);
	
	//np_setpresence() should ALWAYS come the last!!
	np_setpresence("Dener jogando LOL é cringe", "ficando cringe", "blockits_logo", "");
}