# FFXIKeys
A small windower addon to automate trading Special Gobbiedial Keys for rewards

Action                | Addon Command
--------------------- | -----------------------------
Load                  | //lua l ffxikeys
Unload                | //lua u ffxikeys
Use                   | //keys unlock \<key\> \<target\>
Buy                   | //keys buy \<key\> \<target\> \<count\>
Stop                  | //keys stop
Toggle Printing Links | //keys printlinks
Toggle Opening Links  | //keys openlinks

Ease of Use Additions

Action                | Addon Command
--------------------- | -----------------------------
Use                   | //usekeys
Buy                   | //buykeys \<count\>

\<key\> and \<target\> should be replaced with values from data/keys.lua and data/locks.lua.

\<count\> should be replaced with a number [0, 6].  This addon does not check your accolades.  It is up to you to verify your accolades amount before buying keys.
