@echo off

REM DCS_BASE - Where your DCS installtion is located
set DCS_BASE=D:\Games\DCS World OpenBeta

REM OUT_BASE - Where you want the generated .cmc command files to be saved
set OUT_BASE=%USERPROFILE%\Documents\CH Control Manager\Maps\OpenBeta

REM USER_DIFFS_BASE - The root folder from which to define paths to custom keybind files
set USER_DIFFS_BASE=%USERPROFILE%\Saved Games\DCS.openbeta\Config\Input

set LUA="%DCS_BASE%\bin\luae.exe"

REM The lua2cmc script can accepts a minimum of 2 parameters:
REM lua2cmc <Output file to save> <Input key mapping file>
REM You can also specify more than one input key mapping file, for example the UH-1H has a second file for Gunner binds
REM Finally you can specify the path to a diff.lua file in your user profile folder to include custom key binds in the output

REM The below commands match my available modules and setup. They will need to be changed for each user, but hopefully 
REM you can just adjust the variables above to cover most things. You might need to add or remove commands depending on
REM which modules you own.
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_A-10C.cmc" "%DCS_BASE%\Mods\aircraft\A-10C\Input\A-10C\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_UH-1H.cmc" "%DCS_BASE%\Mods\aircraft\UH-1H\Input\UH-1H\keyboard\default.lua" "%DCS_BASE%\Mods\aircraft\UH-1H\Input\UH-1H_Gunner\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_MI-8MTV2.cmc" "%DCS_BASE%\Mods\aircraft\MI-8MTV2\Input\MI-8MTV2\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_SU-25T.cmc" "%DCS_BASE%\Mods\aircraft\SU-25T\Input\SU-25T\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_A-10A.cmc" "%DCS_BASE%\Mods\aircraft\Flaming Cliffs\Input\A-10A\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_F-15C.cmc" "%DCS_BASE%\Mods\aircraft\Flaming Cliffs\Input\F-15C\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_MiG-29.cmc" "%DCS_BASE%\Mods\aircraft\Flaming Cliffs\Input\MIG-29\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_MiG-29C.cmc" "%DCS_BASE%\Mods\aircraft\Flaming Cliffs\Input\MIG-29C\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_MiG-29G.cmc" "%DCS_BASE%\Mods\aircraft\Flaming Cliffs\Input\MIG-29G\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_SU-25.cmc" "%DCS_BASE%\Mods\aircraft\Flaming Cliffs\Input\SU-25\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_SU-27.cmc" "%DCS_BASE%\Mods\aircraft\Flaming Cliffs\Input\SU-27\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_SU-33.cmc" "%DCS_BASE%\Mods\aircraft\Flaming Cliffs\Input\SU-33\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_TF-51D.cmc" "%DCS_BASE%\Mods\aircraft\TF-51D\Input\TF-51D\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_F-86F.cmc" "%DCS_BASE%\Mods\aircraft\F-86\Input\F-86F\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_MiG-21bis.cmc" "%DCS_BASE%\Mods\aircraft\Mig-21BIS\Input\MiG-21\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_P-51D.cmc" "%DCS_BASE%\Mods\aircraft\P-51D\Input\P-51D\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_FW-190D9.cmc" "%DCS_BASE%\Mods\aircraft\FW-190D9\Input\FW-190D9\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_Bf-109K4.cmc" "%DCS_BASE%\Mods\aircraft\Bf-109K-4\Input\Bf-109K-4\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_Ka-50.cmc" "%DCS_BASE%\Mods\aircraft\Ka-50\Input\ka-50\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_MiG-15bis.cmc" "%DCS_BASE%\Mods\aircraft\MiG-15bis\Input\MiG-15bis\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_L-39C.cmc" "%DCS_BASE%\Mods\aircraft\L-39C\Input\L-39C\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_L-39ZA.cmc" "%DCS_BASE%\Mods\aircraft\L-39C\Input\L-39ZA\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_SA342.cmc" "%DCS_BASE%\Mods\aircraft\SA342\Input\keyboard\default.lua" "%USER_DIFFS_BASE%\SA342\keyboard\Keyboard.diff.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_M-2000C.cmc" "%DCS_BASE%\Mods\aircraft\M-2000C\Input\M-2000C\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_AV8BNA.cmc" "%DCS_BASE%\Mods\aircraft\AV8BNA\Input\AV8BNA\keyboard\default.lua" "%DCS_BASE%\Config\Input\UiLayer\keyboard\default.lua" "%USER_DIFFS_BASE%\AV8BNA\keyboard\Keyboard.diff.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_FA-18C.cmc" "%DCS_BASE%\Mods\aircraft\FA-18C\Input\FA-18C\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_SpitfireLFMkIX.cmc" "%DCS_BASE%\Mods\aircraft\SpitfireLFMkIX\Input\SpitfireLFMkIX\keyboard\default.lua" "%USER_DIFFS_BASE%\SpitfireLFMkIX\keyboard\Keyboard.diff.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_AJS37.cmc" "%DCS_BASE%\Mods\aircraft\AJS37\Input\keyboard\default.lua" "%USER_DIFFS_BASE%\AJS37\keyboard\Keyboard.diff.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_F14B.cmc" "%DCS_BASE%\Mods\aircraft\F14\Input\F-14B\keyboard\default.lua" "%DCS_BASE%\Mods\aircraft\F14\Input\F-14B-Pilot\keyboard\default.lua" "%DCS_BASE%\Mods\aircraft\F14\Input\F-14B-RIO\keyboard\default.lua" "%USER_DIFFS_BASE%\F-14B-Pilot\keyboard\Keyboard.diff.lua"  "%USER_DIFFS_BASE%\F-14B-RIO\keyboard\Keyboard.diff.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_A-10C_2.cmc" "%DCS_BASE%\Mods\aircraft\A-10C_2\Input\A-10C_2\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_T45.cmc" "%USERPROFILE%\Saved Games\DCS.openbeta\Mods\aircraft\VNAO_T45\Input\keyboard\default.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_MI-24P.cmc" "%DCS_BASE%\Mods\aircraft\MI-24P\Input\Mi_24P_pilot\keyboard\default.lua" "%DCS_BASE%\Mods\aircraft\MI-24P\Input\Mi_24P_AI_Menu\keyboard\default.lua" "%DCS_BASE%\Mods\aircraft\MI-24P\Input\Mi_24P_op\keyboard\default.lua" "%DCS_BASE%\Mods\aircraft\MI-24P\Input\Mi_24P_AimingStation\keyboard\default.lua" "%USER_DIFFS_BASE%\Mi-24P\keyboard\Keyboard.diff.lua" "%USER_DIFFS_BASE%\Mi-24P_operator\keyboard\Keyboard.diff.lua" "%USER_DIFFS_BASE%\Mi-24P_pilot\keyboard\Keyboard.diff.lua"
%LUA% lua2cmc.lua "%OUT_BASE%\DCS_World_AH-64D.cmc" "%DCS_BASE%\Mods\aircraft\AH-64D\Input\AH-64D_PLT\keyboard\default.lua" "%DCS_BASE%\Mods\aircraft\AH-64D\Input\AH-64D_AI_Menu\keyboard\default.lua" "%DCS_BASE%\Mods\aircraft\AH-64D\Input\AH-64D_CPG\keyboard\default.lua" "%USER_DIFFS_BASE%\AH-64D_BLK_II_PLT\keyboard\Keyboard.diff.lua" "%USER_DIFFS_BASE%\AH-64D_BLK_II_CPG\keyboard\Keyboard.diff.lua"

pause