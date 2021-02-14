#include <sourcemod>
#include <sdktools>
#include <sdkhooks>

#define PLUGIN_VERSION "3.2-fix2"

public Plugin myinfo =
{
	name = "[CSS] Bunnyhopping",
	author = "sh0tx",
	description = "autobhop based off of abner's plugin.",
	version = PLUGIN_VERSION,
	url = "https://sourcemod.net/"
}

public void OnPluginStart()
{       
	CreateConVar("sm_bhop_version", PLUGIN_VERSION, "Plugin version", FCVAR_NOTIFY | FCVAR_REPLICATED);
}

public Action PreThink(int client)
{
	if (IsValidClient(client) && IsPlayerAlive(client))
	{
		SetEntPropFloat(client, Prop_Send, "m_flStamina", 0.0); 
	}
	return Plugin_Continue;
}

public Action OnPlayerRunCmd(int client, int &buttons, int &impulse, float vel[3], float angles[3], int &weapon)
{
	if (IsPlayerAlive(client) && buttons & IN_JUMP)
		if (!(GetEntityMoveType(client) & MOVETYPE_LADDER) && !(GetEntityFlags(client) & FL_ONGROUND))
			buttons &= ~IN_JUMP;

	return Plugin_Continue;
}

stock bool IsValidClient(int client)
{
	if(client <= 0 ) return false;
	if(client > MaxClients) return false;
	if(!IsClientConnected(client)) return false;
	return IsClientInGame(client);
}
