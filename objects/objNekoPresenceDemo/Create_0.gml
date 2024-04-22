#macro DISCORD_APP_ID "1116903545011187733"

ready = false;

if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty))
{
	show_error("NekoPresence init fail.", true);
}