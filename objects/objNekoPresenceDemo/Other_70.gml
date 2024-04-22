var ev_type = async_load[? "event_type"];

if (ev_type == "DiscordReady")
{
	ready = true;
	np_setpresence_timestamps(date_current_datetime(), 0, false);
	np_setpresence_more("Small image text", "Large image text", false);
	
	np_setpresence("Dener jogando LOL é quase tão ruim quanto terem me derrubado quando eu era uma araucária", "Blockits", "blockits_logo", "");
}