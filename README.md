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

\<key\> and \<target\> should be replaced with values from data/keys.lua and data/locks.lua.

\<count\> should be replaced with a number [0, 6].  If you specific an amount and don't have the required accolades nothing will be bought.
