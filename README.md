# Piano-in-Assembly-86x-TASM
A single octave piano built in assembly 86x (TASM), includes playable notes and songs.

![homepage](https://github.com/Shon122/Piano-in-Assembly-86x-TASM/blob/main/homepage.bmp) ![howtp](https://github.com/Shon122/Piano-in-Assembly-86x-TASM/blob/main/howtp.bmp)
![menu](https://github.com/Shon122/Piano-in-Assembly-86x-TASM/blob/main/menu.bmp)
![songs](https://github.com/Shon122/Piano-in-Assembly-86x-TASM/blob/main/songs.bmp)
![piano](https://github.com/Shon122/Piano-in-Assembly-86x-TASM/blob/main/piano.bmp)
![aboutme](https://github.com/Shon122/Piano-in-Assembly-86x-TASM/blob/main/aboutme.bmp)


## Install

- Install [TASM](https://shreyasjejurkar.com/2017/03/27/how-to-install-and-configure-tasm-on-windows-7810/)
and put it under C:\

- Install [DOSBox](https://www.dosbox.com/download.php?main=1)
- Clone this repository to C:\tasm\bin\
- Open up DOSBox and run the game using this commands
```
 
Mount c: c:/
c:
cd tasm
cd bin
cycles=max
tasm /zi seanproj.asm
tlink /v seanproj.obj
seanproj
 
 ``` 
