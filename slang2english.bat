@echo off
setlocal EnableDelayedExpansion

:: If no arguments are given, prompt for input

if "%~1" neq "" (
    set "slang_text=%~1"
) else (
	set /p "slang_text=Slang input > "
)

set /a c_sl=0, c_fe=0

:: Load the list of abbreviated words
for %%A in (imo tbh idc idk idfk ig ik ikr lol lmfao lmao yh y ye yo tf wtf k cya tho ur r u w8 m8 l8 l8r r8 gn
            gf bf smth tmrw smh p2w skid yall kys alr aight c wbu btw im your atm 's boi jk fck fcking fu
            ftw rn gg wp ty tysm thx iirc irl bs stfu wassup gm bm ily doe wb ru acc cuz bc asap aka brb gr8 ppl 
	    np omg pls tldr tldw cu) do (
    set "slang[!c_sl!]=%%A"
    set /a c_sl+=1
)


:: Load the list of correct words/sentences with same index as the other
for %%A in (
    "in my opinion" "to be honest" "I don't care" "I don't know" "I don't fucking know" "I guess" "I know" "I know, right"
    "Laughing out loud" "Laughing my fucking ass off" "Laughing my ass off" "hello" "why" "yes" "hey"
    "the fuck" "what the fuck" "ok" "see ya" "though" "your" "are" "you" "wait" "mate" "late" "later" "rate"
    "good night" "girlfriend" "boyfriend" "something" "tomorrow" "shake my head" "pay to win" "script kiddie"
    "you all" "kill yourself" "alright" "alright" "see" "what about you" "by the way" "I'm" "you're" "at the moment" "is" "boy" "just kidding"
    "fuck" "fucking" "fuck you" "for the win" "right now" "good game" "well played" "thank you" "thank you so much" "thanks" 
    "if I remember correctly" "in real life" "bullshit" "shut the fuck up" "what's up" "good morning" "bad manners" "I love you"
    "though" "welcome back" "are you" "account" "because" "because" "as soon as possible" "also known as" "be right back" "great" "people" "no problem" "oh my god" "please" "too long, didn't read" "too long, didn't watch" "see you"
    ) do (
    set "fe[!c_fe!]=%%~A"
    set /a c_fe+=1
)

:: Add a temp space at the beginning
set "slang_text= !slang_text! "

:: Replace every occurrence only if it has spaces, dots or interrogation signs
for /l %%B in (0,1,!c_fe!) do (
for /F "tokens=1,2 delims=`" %%C in ("!slang[%%B]!`!fe[%%B]!") do set "slang_text=!slang_text: %%C = %%D !"
for /F "tokens=1,2 delims=`" %%C in ("!slang[%%B]!`!fe[%%B]!") do set "slang_text=!slang_text: %%C?= %%D?!"
for /F "tokens=1,2 delims=`" %%C in ("!slang[%%B]!`!fe[%%B]!") do set "slang_text=!slang_text: %%C.= %%D.!"

)

:: Replace lowercase 'i' with uppercase one
set "slang_text=!slang_text: i = I !"

:: Remove the first temp space
set slang_text=%slang_text:~1%

:: Print the result
echo.%slang_text:~0,-1%

if "%~1"=="" (
	pause>nul
)
exit /b