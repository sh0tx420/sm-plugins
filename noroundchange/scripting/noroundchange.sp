#include <sourcemod>

public Plugin:myinfo =
{
    name = "[CSS] No Round Change",
    author = "sh0tx",
    description = "Disables the round from changing.",
    version = "1.0",
    url = "https://sourcemod.net/"
};

public OnPluginStart()
{
    new Handle:mp_roundtime = FindConVar("mp_roundtime");
    SetConVarBounds(mp_roundtime, ConVarBound_Upper, false);
    CloseHandle(mp_roundtime);
}