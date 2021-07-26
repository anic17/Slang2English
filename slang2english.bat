@echo off
setlocal EnableDelayedExpansion

if "%~1" neq "" (
    set "slang_text=%~1"
)

set /a c_sl=0, c_fe=0

for %%A in (imo tbh idc idk idfk ig ik ikr lol lmfao lmao yh y ye yo tf wtf k cya tho ur r u w8 m8 l8 r8 gn gf bf smth tmrw smh p2w skid yall kys alr aight c wbu btw im youre atm 's boi jk fck fcking fu ftw) do (
    set "slang[!c_sl!]=%%A"
    set /a c_sl+=1
)

for %%A in (
    "in my opinion" "to be honest" "I don't care" "I don't know" "I don't fucking know" "I guess" "I know" "I know, right."
    "Laughing out loud" "Laughing my fucking ass off" "Laughing my ass off" "hello" "why" "yes" "hey"
    "the fuck" "what the fuck" "ok" "see ya" "though" "your" "are" "you" "wait" "mate" "late" "rate"
    "good night" "girlfriend" "boyfriend" "something" "tomorrow" "shake my head" "pay to win" "script kiddie"
    "you all" "kill yourself" "alright" "alright" "see" "what about you" "by the way" "I'm" "you're" "at the moment" "is" "boy" "just kidding"
    "fuck" "fucking" "fuck you" "for the win"
    ) do (
    set "fe[!c_fe!]=%%~A"
    set /a c_fe+=1
)

if "%~1"=="" (
set /p "slang_text=Slang input > "
)


set "slang_text= !slang_text! "

for /l %%B in (0,1,!c_fe!) do (
for /F "tokens=1,2 delims=`" %%C in ("!slang[%%B]!`!fe[%%B]!") do set "slang_text=!slang_text: %%C = %%D !"
)

set "slang_text=!slang_text: i = I !"
set slang_text=%slang_text:~1%
echo.%slang_text:~0,-1%

if "%~1"=="" (
	pause>nul
)
exit /b