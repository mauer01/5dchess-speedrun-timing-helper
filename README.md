# 5D Chess With Multiverse Time Travel speedrun timing helper

the c part is penteracts 5d pgn recorder which I customized its output so its now checking every millisecond for changes in the gamestate and has some other customizations in the output,
most notably it doesnt create files anymore and just sends the gamestate as soon as the game ends.

The AutoIT part is reading that Output and triggers the custom key.

If you wanna compile everything yourself you need to rename the programm.exe of the pgn recorder into "5dpgn recorder specialised for all variants and puzzle speedrun.exe" 
or change the pgnrecorder name in the autoit script so it will find and start the correct programm.

## Usage

Download the latest release keep the 2 programms together and start the Speedrun timing helper.exe 
once you setup your split software (e.g. WSplit) you just need to press start press your keybind once to start the Split software 
and once you won the programm will instantly press the button you assigned for you (standart is F1)

## Disclaimer
While it should be stable for the most part, this program may still cause crashes/desyncs or other unexpected/unwanted behaviour, hence why the developers of this project cannot be held liable for any damage caused.

## credits

full credits to the base branches of penteract and GHXX
