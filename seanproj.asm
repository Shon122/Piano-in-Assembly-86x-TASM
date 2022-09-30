IDEAL
MODEL small
STACK 100h
P386

DATASEG
;-------------------------------------------------------------------------------------------------
;Piano_mode vars

    teder dw 0               ;stores the value of the note and then being used in sounder
    temp dw 4            ;Rythm of delay and duration of sounds
    show_how dw 0    ;check if the "how to play" screen was allready shown

;-------------------------------------------------------------------------------------------------
;BMP vars

    imgPiano db 'piano.bmp',0                ;piano image
    imgMenu db 'menu.bmp',0               ;menu image
    imgSongs db 'songs.bmp',0              ;songs image
    imgAboutMe db 'aboutme.bmp',0        ;about me image
    imgHowToPlay db 'howtp.bmp',0          ;how to play image
    imgHomePage db 'homepage.bmp',0             ;home page image

    filehandle dw ?
    Header db 54 dup (0)
    Palette db 256*4 dup (0)
    ScrLine db 320 dup (0)
    ErrorMsg db 'error', 13, 10 ,'$'

;-------------------------------------------------------------------------------------------------
;Graphic vars
    
    x dw 100                 ;The location of (x,y) on screen
    y dw 100                 ;The location of (x,y) on screen
    wentleft dw 0              ;Counts how much y has gone right
    color db 0          ;Defines the color of the drawing (0-255)
    wentDown dw 0 ;Counts how much y has gone down
    original dw 0       ;Saves the original location of x
    width1 dw 30        ;width of the square
    height1 dw 30       ;height of the square
    menuPlace dw 3  ;saves the current place of the user in the menu tab

;-------------------------------------------------------------------------------------------------

CODESEG
start:
mov ax, @data
mov ds, ax
jmp Main

;sounds only for Normal Piano Mode \/\/\/\/\/\/
PROC PlayDo

    mov ax, 11000
    mov [teder], ax
    call sounder

    ;printing
    ;upper square
    mov [width1], 18
    mov [height1], 97
    mov [x],74
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 32
    mov [height1], 52
    mov [x],74
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov [temp], 3
    call delay
    mov [color],255 ;move color to background color(0-black),(255-white)

    ;printing
    ;upper square
    mov [width1], 18
    mov [height1], 97
    mov [x],74
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 32
    mov [height1], 52
    mov [x],74
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov [color],177

    call get_key             ;go get another keypress
    ret

ENDP playdo
PROC PlayDo2

    mov ax, 10500
    mov [teder], ax
    call sounder              ;go generate the tone

    ;printing
    ;upper square
    mov [width1], 22
    mov [height1], 97
    mov [x],92
    mov [y], 50
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov [temp], 3
    call delay
    mov [color],0 ;move color to background color(0-black),(255-white)


    ;printing
    ;upper square
    mov [width1], 22
    mov [height1], 97
    mov [x],92
    mov [y], 50
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov [color],177


    call get_key             ;go get another keypress
    ret

ENDP playDo2
PROC PlayRe

    mov ax, 10000
    mov [teder], ax
    call sounder

    ;printing
    ;upper square
    mov [width1], 23
    mov [height1], 97
    mov [x],114
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 32
    mov [height1], 52
    mov [x],110
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov [temp], 3
    call delay
    mov [color],255 ;move color to background color(0-black),(255-white)

    ;printing
    ;upper square
    mov [width1], 23
    mov [height1], 97
    mov [x],114
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 32
    mov [height1], 52
    mov [x],110
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov [color],177


    call get_key              ;go get another keypress
    ret

endp playRe
PROC PlayRe2

    mov ax, 9500
    mov [teder], ax
    call sounder              ;go generate the tone

    ;printing
    ;upper square
    mov [width1], 22
    mov [height1], 97
    mov [x],137
    mov [y], 50
    call DrawSquare
    ;^^^^^^^^^^^^^^^^^^^

    mov [temp], 3
    call delay
    mov [color],0 ;move color to background color(0-black),(255-white)
    ;printing
    ;upper square
    mov [width1], 22
    mov [height1], 97
    mov [x],137
    mov [y], 50
    call DrawSquare
    ;^^^^^^^^^^^^^^^^^^^

    mov [color],177


    call get_key             ;go get another keypress
    ret

ENDP playRe2
PROC PlayMi

    mov ax, 9000
    mov [teder], ax
    call sounder    

    ;printing
    ;upper square
    mov [width1], 18
    mov [height1], 97
    mov [x],159
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 31
    mov [height1], 52
    mov [x],146
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov [temp], 3
    call delay
    mov [color],255 ;move color to background color(0-black),(255-white)
    ;printing
    ;upper square
    mov [width1], 18
    mov [height1], 97
    mov [x],159
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 31
    mov [height1], 52
    mov [x],146
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov [color],177


    call get_key            ;go get another keypress
    ret

ENDP playMi
PROC PlayFa

    mov ax, 8500
    mov [teder], ax
    call sounder

    ;printing
    ;upper square
    mov [width1], 18
    mov [height1], 97
    mov [x],181
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 31
    mov [height1], 52
    mov [x],181
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^

    mov [temp], 3
    call delay
    mov [color],255 ;move color to background color(0-black),(255-white)

    ;printing
    ;upper square
    mov [width1], 18
    mov [height1], 97
    mov [x],181
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 31
    mov [height1], 52
    mov [x],181
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^

    mov [color],177

    call get_key            ;go get another keypress
    ret

ENDP playFa
PROC PlayFa2

    mov ax, 8000
    mov [teder], ax
    call sounder

    ;printing
    ;upper square
    mov [width1], 22
    mov [height1], 97
    mov [x],199
    mov [y], 50
    call DrawSquare
    ;^^^^^^^^^^^^^^^^^^^^

    mov [temp], 3
    call delay
    mov [color],0 ;move color to background color(0-black),(255-white)

    ;printing
    ;upper square
    mov [width1], 22
    mov [height1], 97
    mov [x],199
    mov [y], 50
    call DrawSquare
    ;^^^^^^^^^^^^^^^^^^^^

    mov [color],177


    call get_key            ;go get another keypress
    ret

ENDP playFa2
PROC PlaySol

    mov ax,  7500
    mov [teder], ax
    call sounder           ;go generate the tone

    ;printing
    ;upper square
    mov [width1], 18
    mov [height1], 97
    mov [x],221
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 31
    mov [height1], 52
    mov [x],216
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov [temp], 3
    call delay
    mov [color],255 ;move color to background color(0-black),(255-white)

    ;printing
    ;upper square
    mov [width1], 18
    mov [height1], 97
    mov [x],221
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 31
    mov [height1], 52
    mov [x],216
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov [color],177


    call get_key             ;go get another keypress
    ret

ENDP playSol
PROC PlaySol2

    mov ax, 7000
    mov [teder], ax
    call sounder

    ;printing
    ;upper square
    mov [width1], 22
    mov [height1], 97
    mov [x],239
    mov [y], 50
    call DrawSquare
    ;^^^^^^^^^^^^^^

    mov [temp], 3
    call delay
    mov [color],0 ;move color to background color(0-black),(255-white)

    ;printing
    ;upper square
    mov [width1], 22
    mov [height1], 97
    mov [x],239
    mov [y], 50
    call DrawSquare
    ;^^^^^^^^^^^^^^

    mov [color],177


    call get_key            ;go get another keypress
    ret

ENDP playSol2
PROC PlayLa

    mov ax, 6500
    mov [teder], ax
    call sounder

    ;printing
    ;upper square
    mov [width1], 18
    mov [height1], 97
    mov [x],261
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 32
    mov [height1], 52
    mov [x],251
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov [temp], 3
    call delay
    mov [color],255 ;move color to background color(0-black),(255-white)

    ;printing
    ;upper square
    mov [width1], 18
    mov [height1], 97
    mov [x],261
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 32
    mov [height1], 52
    mov [x],251
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov [color],177


    call get_key            ;go get another keypress
    ret

ENDP playLa
PROC PlayLa2

    mov ax, 6000
    mov [teder], ax
    call sounder

    ;printing
    ;upper square
    mov [width1], 22
    mov [height1], 97
    mov [x],279
    mov [y], 50
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov [temp], 3
    call delay
    mov [color],0 ;move color to background color(0-black),(255-white)

    ;printing
    ;upper square
    mov [width1], 22
    mov [height1], 97
    mov [x],279
    mov [y], 50
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov [color],177


    call get_key            ;go get another keypress
    ret

ENDP playLa2
PROC PlaySi

    mov ax,  5500
    mov [teder], ax
    call sounder

    ;printing
    ;upper square
    mov [width1], 18
    mov [height1], 97
    mov [x],301
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 32
    mov [height1], 52
    mov [x],287
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov [temp], 3
    call delay
    mov [color],255 ;move color to background color(0-black),(255-white)

    ;printing
    ;upper square
    mov [width1], 18
    mov [height1], 97
    mov [x],301
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 32
    mov [height1], 52
    mov [x],287
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov [color],177


    call get_key            ;go get another keypress
    ret

ENDP playSi
;sounds only for Normal Piano Mode ^^^^^^^^^^^^^


;sounds only for songs mode \/\/\/\/\/\/
PROC SongLowLa

    ;printing
    ;upper square
    mov [width1], 17
    mov [height1], 97
    mov [x],13
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 36
    mov [height1], 52
    mov [x],-1
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov ax, 12500
    mov [teder], ax
    call sounder
    call checkpress

    mov [color],255 ;move color to background color(0-black),(255-white)

    ;printing
    ;upper square
    mov [width1], 17
    mov [height1], 97
    mov [x],13
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 36
    mov [height1], 52
    mov [x],-1
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^^^^^^^
    mov [color],177
    ret

ENDP SongLowLa
PROC SongLowLa2

    ;printing
    ;upper square
    mov [width1], 23
    mov [height1], 97
    mov [x],30
    mov [y], 50
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov ax, 12000
    mov [teder], ax
    call sounder
    call checkpress

    mov [color],0
    ;printing
    ;upper square
    mov [width1], 23
    mov [height1], 97
    mov [x],30
    mov [y], 50
    call DrawSquare
    ;^^^^^^^^^^^^^^^^
    mov [color],177

    ret

ENDP SongLowLa2
PROC SongLowSi

    ;printing
    ;upper square
    mov [width1], 17
    mov [height1], 97
    mov [x],53
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 31
    mov [height1], 52
    mov [x],39
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov ax, 11500
    mov [teder], ax
    call sounder
    call checkpress

    mov [color],255 ;move color to background color(0-black),(255-white)
    ;printing
    ;upper square
    mov [width1], 17
    mov [height1], 97
    mov [x],53
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 31
    mov [height1], 52
    mov [x],39
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^^^^^^^
    mov [color],177
    ret

ENDP SongLowSi
PROC SongDo

    ;printing
    ;upper square
    mov [width1], 18
    mov [height1], 97
    mov [x],74
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 32
    mov [height1], 52
    mov [x],74
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^^^^^^^

    mov ax, 11000
    mov [teder], ax
    call sounder
    call checkpress          

    mov [color],255 ;move color to background color(0-black),(255-white)
    ;printing
    ;upper square
    mov [width1], 18
    mov [height1], 97
    mov [x],74
    mov [y], 50
    call DrawSquare
    ;bottom square
    mov [width1], 32
    mov [height1], 52
    mov [x],74
    mov [y], 147
    call DrawSquare
    ;^^^^^^^^^^^^^^^^
    mov [color],177
    ret

ENDP SongDo
PROC SongDo2

;printing
;upper square
mov [width1], 22
mov [height1], 97
mov [x],92
mov [y], 50
call DrawSquare
;^^^^^^^^^^^^^^^^

mov ax, 10500
mov [teder], ax
call sounder
call checkpress              ;go generate the tone

mov [color],0
;printing
;upper square
mov [width1], 22
mov [height1], 97
mov [x],92
mov [y], 50
call DrawSquare
;^^^^^^^^^^^^^^^^

mov [color],177

ret
ENDP SongDo2
PROC SongRe
;printing
;upper square
mov [width1], 23
mov [height1], 97
mov [x],114
mov [y], 50
call DrawSquare
;bottom square
mov [width1], 32
mov [height1], 52
mov [x],110
mov [y], 147
call DrawSquare
;^^^^^^^^^^^^^^^^

mov ax, 10000
mov [teder], ax
call sounder
call checkpress

mov [color],255
;printing
;upper square
mov [width1], 23
mov [height1], 97
mov [x],114
mov [y], 50
call DrawSquare
;bottom square
mov [width1], 32
mov [height1], 52
mov [x],110
mov [y], 147
call DrawSquare
;^^^^^^^^^^^^^^^^

mov [color],177

ret
ENDP SongRe
PROC SongRe2
;printing
;upper square
mov [width1], 22
mov [height1], 97
mov [x],137
mov [y], 50
call DrawSquare
;^^^^^^^^^^^^^^^^^^^
mov ax, 9500
mov [teder], ax
call sounder
call checkpress             


mov [color],0 ;move color to background color(0-black),(255-white)
;printing
;upper square
mov [width1], 22
mov [height1], 97
mov [x],137
mov [y], 50
call DrawSquare
;^^^^^^^^^^^^^^^^^^^
mov [color],177

ret
ENDP SongRe2
PROC SongMi

;printing
;upper square
mov [width1], 18
mov [height1], 97
mov [x],159
mov [y], 50
call DrawSquare
;bottom square
mov [width1], 31
mov [height1], 52
mov [x],146
mov [y], 147
call DrawSquare
;^^^^^^^^^^^^^^^^

mov ax, 9000
mov [teder], ax
call sounder
call checkpress            ;go generate the tone

mov [color],255 ;move color to background color(0-black),(255-white)
;printing
;upper square
mov [width1], 18
mov [height1], 97
mov [x],159
mov [y], 50
call DrawSquare
;bottom square
mov [width1], 31
mov [height1], 52
mov [x],146
mov [y], 147
call DrawSquare
;^^^^^^^^^^^^^^^^

mov [color],177

ret
ENDP SongMi
PROC SongFa

;printing
;upper square
mov [width1], 18
mov [height1], 97
mov [x],181
mov [y], 50
call DrawSquare
;bottom square
mov [width1], 31
mov [height1], 52
mov [x],181
mov [y], 147
call DrawSquare
;^^^^^^^^^^

mov ax, 8500
mov [teder], ax
call sounder
call checkpress


mov [color],255 ;move color to background color(0-black),(255-white)

;printing
;upper square
mov [width1], 18
mov [height1], 97
mov [x],181
mov [y], 50
call DrawSquare
;bottom square
mov [width1], 31
mov [height1], 52
mov [x],181
mov [y], 147
call DrawSquare
;^^^^^^^^^^

mov [color],177


ret
ENDP SongFa
PROC SongFa2

;printing
;upper square
mov [width1], 22
mov [height1], 97
mov [x],199
mov [y], 50
call DrawSquare
;^^^^^^^^^^^^^^^^^^^^

mov ax, 8000
mov [teder], ax
call sounder
call checkpress

mov [color],0 ;move color to background color(0-black),(255-white)

;printing
;upper square
mov [width1], 22
mov [height1], 97
mov [x],199
mov [y], 50
call DrawSquare
;^^^^^^^^^^^^^^^^^^^^

mov [color],177


ret
ENDP SongFa2
PROC SongSol

;printing
;upper square
mov [width1], 18
mov [height1], 97
mov [x],221
mov [y], 50
call DrawSquare
;bottom square
mov [width1], 31
mov [height1], 52
mov [x],216
mov [y], 147
call DrawSquare
;^^^^^^^^^^^^^^^^

mov ax, 7500
mov [teder], ax
call sounder
call checkpress           ;go generate the tone

mov [color],255 ;move color to background color(0-black),(255-white)

;printing
;upper square
mov [width1], 18
mov [height1], 97
mov [x],221
mov [y], 50
call DrawSquare
;bottom square
mov [width1], 31
mov [height1], 52
mov [x],216
mov [y], 147
call DrawSquare
;^^^^^^^^^^^^^^^^

mov [color],177

ret
ENDP SongSol
PROC SongSol2

;printing
;upper square
mov [width1], 22
mov [height1], 97
mov [x],239
mov [y], 50
call DrawSquare
;^^^^^^^^^^^^^^

mov ax, 7000
mov [teder], ax
call sounder
call checkpress

mov [color],0 ;move color to background color(0-black),(255-white)

;printing
;upper square
mov [width1], 22
mov [height1], 97
mov [x],239
mov [y], 50
call DrawSquare
;^^^^^^^^^^^^^^

mov [color],177
ret
ENDP SongSol2
PROC SongLa

;printing
;upper square
mov [width1], 18
mov [height1], 97
mov [x],261
mov [y], 50
call DrawSquare
;bottom square
mov [width1], 32
mov [height1], 52
mov [x],251
mov [y], 147
call DrawSquare
;^^^^^^^^^^^^^^^^

mov ax, 6500
mov [teder], ax
call sounder
call checkpress

mov [color],255 ;move color to background color(0-black),(255-white)

;printing
;upper square
mov [width1], 18
mov [height1], 97
mov [x],261
mov [y], 50
call DrawSquare
;bottom square
mov [width1], 32
mov [height1], 52
mov [x],251
mov [y], 147
call DrawSquare
;^^^^^^^^^^^^^^^^

mov [color],177

ret
ENDP SongLa
PROC SongLa2

;printing
;upper square
mov [width1], 22
mov [height1], 97
mov [x],279
mov [y], 50
call DrawSquare
;^^^^^^^^^^^^^^^^

mov ax, 6000
mov [teder], ax
call sounder
call checkpress

mov [color],0 ;move color to background color(0-black),(255-white)

;printing
;upper square
mov [width1], 22
mov [height1], 97
mov [x],279
mov [y], 50
call DrawSquare
;^^^^^^^^^^^^^^^^

mov [color],177

ret
ENDP SongLa2
PROC SongSi

;printing
;upper square
mov [width1], 18
mov [height1], 97
mov [x],301
mov [y], 50
call DrawSquare
;bottom square
mov [width1], 32
mov [height1], 52
mov [x],287
mov [y], 147
call DrawSquare
;^^^^^^^^^^^^^^^^

mov ax, 5500
mov [teder], ax
call sounder

mov [color],255 ;move color to background color(0-black),(255-white)

;printing
;upper square
mov [width1], 18
mov [height1], 97
mov [x],301
mov [y], 50
call DrawSquare
;bottom square
mov [width1], 32
mov [height1], 52
mov [x],287
mov [y], 147
call DrawSquare
;^^^^^^^^^^^^^^^^

mov [color],177

ret
ENDP SongSi
;sounds only for songs mode ^^^^^^^^^^^^^^^


;Other Helpful Procs \/\/\/\/\/\/\/\/\/\/\/\/\/
PROC Sounder

    mov al,10110110b         ;load control הכנה לטעון
    out 43h,al             ;send a new countdown value
    mov ax,[teder]              ;tone frequency
    out 42h,al    ;send LSB
    mov al,ah    ;move MSB to AL
    out 42h,al    ;save it
    in al,61h               ;get port 61 state
    or al,00000011b           ;turn on speaker
    out 61h,al    ;speaker on now
    call delay    ;pause
    and al,11111100b            ;clear speaker enable
    out 61h,al    ;speaker off now

ret      
ENDP sounder
PROC Delay

    mov ah,00h    ;function 0 - get system timer tick
    int 01Ah             ;call ROM BIOS time-of-day services
    add dx,[temp]            ;add our delay value to DX
    mov bx,dx    ;store result in BX
    pozz:
    int 01Ah            ;call ROM BIOS time-of-day services
    cmp dx,bx    ;has the delay duration passed?
    jl pozz            ;no, so go check again

ret    
ENDP Delay
PROC CheckUnder1

    cmp [menuplace] ,1
    jl mov_to_up
    call Screen_Enter_Sound
ret
    mov_to_up:
    mov [menuplace],3
    call Screen_Enter_Sound
ret
ENDP checkunder1
PROC CheckAbove3

    cmp [menuplace] ,3
    jg mov_to_down
    call Screen_Enter_Sound
    ret

    mov_to_down:
    mov [menuplace],1
    call Screen_Enter_Sound
    ret

ENDP checkabove3
PROC Screen_Enter_Sound

    mov [temp],  2
    mov ax, 4000
    mov [teder], ax
    call sounder
    ret

ENDP Screen_Enter_Sound
PROC CheckPress

    mov ah,1
    int 16h
    jnz piano_mode

    ret
ENDP CheckPress
;Other Helpful Procs ^^^^^^^^^^^^^^^


;Drawing Procs \/\/\/\/\/\/\/\/\/\/\/\/\/
PROC DrawUpperMenu
    
    mov [color], 55
    ;printing
    ;upper square
    mov [width1], 122
    mov [height1], 4
    mov [x],97
    mov [y], 64
    call DrawSquare
    ;bottom square
    mov [width1], 122
    mov [height1], 4
    mov [x],97
    mov [y], 98
    call DrawSquare
    ;right square
    mov [width1], 4
    mov [height1], 35
    mov [x],97
    mov [y], 64
    call DrawSquare

    ;left square
    mov [width1], 4
    mov [height1], 35
    mov [x],215
    mov [y], 64
    call DrawSquare
    mov [color], 55

    jmp start_menu
    ret

ENDP drawUpperMenu
PROC DrawMiddleMenu
    
    mov [color], 55
    ;printing
    ;upper square
    mov [width1], 122
    mov [height1], 4
    mov [x],97
    mov [y], 110
    call DrawSquare
    ;bottom square
    mov [width1], 122
    mov [height1], 4
    mov [x],97
    mov [y], 149
    call DrawSquare
    ;right square
    mov [width1], 4
    mov [height1], 42
    mov [x],97
    mov [y], 110
    call DrawSquare

    ;left square
    mov [width1], 4
    mov [height1], 43
    mov [x],217
    mov [y], 110
    call DrawSquare
    mov [color], 55

    jmp start_menu
    ret

ENDP drawMiddleMenu
PROC DrawBottomMenu

    mov [color], 55
    ;printing
    ;upper square
    mov [width1], 58
    mov [height1], 4
    mov [x],129
    mov [y], 157
    call DrawSquare
    ;bottom square
    mov [width1], 60
    mov [height1], 4
    mov [x],129
    mov [y], 191
    call DrawSquare
    ;right square
    mov [width1], 4
    mov [height1], 36
    mov [x],129
    mov [y], 157
    call DrawSquare

    ;left square
    mov [width1], 4
    mov [height1], 36
    mov [x],185
    mov [y], 157
    call DrawSquare
    mov [color], 55

    jmp start_menu
    ret

ENDP drawBottomMenu
PROC DeleteAllMenu
;deletes all the menu places could be drawn 
mov [color],0
    ;printing
    ;upper square
    mov [width1], 122
    mov [height1], 4
    mov [x],97
    mov [y], 64
    call DrawSquare
    ;bottom square
    mov [width1], 122
    mov [height1], 4
    mov [x],97
    mov [y], 98
    call DrawSquare
    ;right square
    mov [width1], 4
    mov [height1], 35
    mov [x],97
    mov [y], 64
    call DrawSquare

    ;left square
    mov [width1], 4
    mov [height1], 35
    mov [x],215
    mov [y], 64
    call DrawSquare
    
   ;printing
    ;upper square
    mov [width1], 122
    mov [height1], 4
    mov [x],97
    mov [y], 110
    call DrawSquare
    ;bottom square
    mov [width1], 122
    mov [height1], 4
    mov [x],97
    mov [y], 149
    call DrawSquare
    ;right square
    mov [width1], 4
    mov [height1], 42
    mov [x],97
    mov [y], 110
    call DrawSquare

    ;left square
    mov [width1], 4
    mov [height1], 43
    mov [x],217
    mov [y], 110
    call DrawSquare
;printing
    ;upper square
    mov [width1], 58
    mov [height1], 4
    mov [x],129
    mov [y], 157
    call DrawSquare
    ;bottom square
    mov [width1], 60
    mov [height1], 4
    mov [x],129
    mov [y], 191
    call DrawSquare
    ;right square
    mov [width1], 4
    mov [height1], 36
    mov [x],129
    mov [y], 157
    call DrawSquare

    ;left square
    mov [width1], 4
    mov [height1], 36
    mov [x],185
    mov [y], 157
    call DrawSquare

mov [color], 55
ret
ENDP DeleteAllMenu
PROC DrawSquare

    ; Graphic mode
    ; mov ax, 13h
    ; int 10h
    ;-----------------------------
    mov ax, [x]  ;saves the original x
    mov [original],ax ;saves the original x
    mov [wentdown], 0
    ;print
    SECONDAGAIN:
    inc [wentdown]
    inc [y]
    mov [wentLeft],0
    mov ax, [original] ;moves original x to current x
    mov [x],ax   ;moves original x to current x
    ;lowering the Y until its at the bottom (50 for example)
    AGAIN:
    inc [x]
    inc [wentLeft]
    mov bh,0h
    mov cx,[x]
    mov dx,[y]
    mov al,[color]
    mov ah,0ch
    int 10h
    mov ax, [width1]
    cmp [wentLeft] ,ax ;check if reached the wanted width
    JL AGAIN
    mov ax, [height1]
    cmp [wentdown],ax  ;check if reached the wanted height
    JL SECONDAGAIN
    ret

ENDP DrawSquare
PROC DrawMenuPos
  
    cmp [menuplace],1
    je drawBottomMenu
    cmp [menuplace],2
    je drawMiddleMenu
    cmp [menuplace],3
    je drawUpperMenu
    
ret
ENDP drawMenuPos
;Drawing Procs ^^^^^^^^^^^^^^^


;songs \/\/\/\/\/\/\/\/\/\/\/\/\/
PROC Fur_elise

    mov dx, offset imgpiano
    call Show_image
    
    mov [temp], 4
    call SongMi
    call SongRe2
    call SongMi
    call SongRe2
    call SongMi
    call SonglowSi
    call SongRe
    call SongDo
    call SonglowLa
    call delay
    call delay
    call SongDo
    call SongMi
    call SonglowLa
    call SonglowSi
    call delay
    call delay
    call SongMi
    call SongSol2
    call SonglowSi
    call SongDo
    call delay
    call delay
    call SongMi
    call SongRe2
    call SongMi
    call SongRe2
    call SongMi
    call SonglowSi
    call SongRe
    call SongDo
    call SonglowLa
    call delay
    call delay
    call SongDo
    call SongMi
    call SonglowLa
    call SonglowSi
    call delay
    call delay
    call SongMi
    call SongDo
    call SonglowSi
    call SonglowLa
    call delay
    call delay
    call SonglowSi
    call SongDo
    call SongRe
    call SongMi
    call delay
    call delay
    call SongSol
    call SongFa
    call SongMi
    call SongRe
    call delay
    call delay
    call SongFa
    call SongMi
    call SongRe
    call SongDo
    call delay
    call delay
    call SongMi
    call SongRe
    call SongDo
    call SonglowSi
    jmp piano_mode
    ret

ENDP fur_elise
PROC Tetris_song

    mov dx, offset imgpiano
    call Show_image

    mov [temp], 4
    call SongMi
    call delay
    call SonglowSi
    call SongDo
    call SongRe
    call delay
    call SongDo
    call SonglowSi
    call SonglowLa
    call delay
    call SonglowLa
    call SongDo
    call SongMi
    call delay
    call SongRe
    call SongDo
    call SonglowSi
    call delay
    call SonglowSi 
    call SongDo
    call SongRe
    call delay
    call SongMi
    mov[temp], 2
    call delay
    mov [temp], 4
    call  SongDo
    mov [temp], 3
    call delay
    mov [temp], 4
    call SonglowLa
    mov [temp], 2
    call delay
    mov [temp], 4
    call SonglowLa
    call delay
    call delay
    call SongRe
    mov [temp], 5
    call delay
    mov [temp], 3
    call SongFa
    mov [temp], 2
    call delay
    mov [temp], 4
    call SonglowLa
    call delay
    call SongSol
    call SongFa
    call SongMi
    mov [temp], 6
    call delay
    mov [temp], 4
    call  SongDo
    call SongMi
    mov [temp], 2
    call delay
    mov [temp], 4
    call SongRe
    call SongDo
    call SonglowSi
    call delay
    call SonglowSi
    call SongDo
    call SongRe
    call delay
    call SongMi
    mov [temp], 2
    call delay
    mov [temp], 4
    call  SongDo
    call delay
    call SonglowLa
    mov [temp], 2
    call delay
    mov [temp], 4
    call SonglowLa
    mov [temp], 4
    jmp piano_mode
    ret

 ENDP tetris_song
PROC Poland_song

    mov dx, offset imgpiano
    call Show_image

    mov [temp],  4
    call SongLa2
    call SongRe2
    mov [temp], 0
    call delay
    mov [temp],  4
    call SongRe2
    call delay
    call SongRe2
    call SongFa
    call SongFa2
    call SongRe2
    mov [temp],  0
    call delay
    mov [temp],  4
    call SongRe2
    call delay
    call SongFa2
    call SongFa
    call SongDo2
    mov [temp],  0
    call delay
    mov [temp],  4
    call SongDo2
    call SongFa
    call SongFa2
    call SongRe2
    mov [temp],  0
    call delay
    mov [temp],  4
    call SongRe2
    call delay
    call SongLa2
    call SongRe2
    mov [temp],  0
    call delay
    mov [temp],  4
    call SongRe2
    call delay
    call SongFa
    call SongFa2
    call SongRe2
    mov [temp],  0
    call delay
    mov [temp],  4
    call SongRe2
    call delay
    call SongFa2
    call SongLa2
    call SongSol2
    call SongFa2
    call SongFa
    call SongFa2
    call SongRe2
    mov [temp],  0
    call delay
    mov [temp],  4
    call SongRe2
    call SongFa2
    call SongLa2
    mov [temp],  0
    call delay
    mov [temp],  4
    call SongLa2
    call SongSol2
    call SongFa2
    call SongFa
    call SongDo2
    mov [temp],  0
    call delay
    mov [temp],  4
    call SongDo2
    call delay
    call SongFa
    call SongSol2
    mov [temp],  0
    call delay
    mov [temp],  4
    call SongSol2
    call SongFa2
    call SongFa
    call SongFa2
    call SongRe2
    mov [temp],  0
    call delay
    mov [temp], 4    
    call SongRe2


    mov [temp], 4
    jmp piano_mode
    ret

 ENDP
PROC Survivor_song

    mov dx, offset imgpiano
    call Show_image

    mov [temp], 7
    call SongSol
    call SongLa2
    call SongSol
    call delay
    call delay
    call SongFa
    call SongRe2
    call SongSol
    call SongFa
    call SongRe2
    call delay
    call delay
    call SongFa
    mov [temp], 1
    call delay  
    mov [temp], 7
    call  SongFa
    mov [temp], 1
    call delay  
    mov [temp], 7
    call SongFa
    call delay
    call SongFa
    call SongSol
    call SongFa
    call SongRe2
    mov [temp], 1
    call delay  
    mov [temp], 7
    call SongRe2
    call delay
    call delay
    call SongSol
    call SongLa2
    call SongDo
    call delay
    call SongSol
    call SongFa
    call SongRe2
    call delay
    call SongDo
    call SongRe2
    call SongFa
    mov [temp], 1
    call delay  
    mov [temp], 6
    call SongFa
    call SongRe2
    call SongFa
    call SongRe2
    call SongFa
    call SongRe2
    call SongSol



    mov [temp], 4
    jmp piano_mode
    ret

ENDP survivor_song
;songs ^^^^^^^^^^^^^^^^


;BMP \/\/\/\/\/\/\/\/\/\/\/\/\/
PROC CloseBmpFile 

    mov ah,3Eh
    mov bx, [FileHandle]
    int 21h
    ret
ENDP CloseBmpFile
PROC OpenFile

    ; Open file
    mov ah, 3Dh
    xor al, al
    ; mov dx, offset imgpiano
    int 21h
    jc openerror
    mov [filehandle], ax
    ret
    openerror:
    mov dx, offset ErrorMsg
    mov ah, 9h
    int 21h
    ret

ENDP OpenFile
PROC ReadHeader

    ; Read BMP file header, 54 bytes
    mov ah,3fh
    mov bx, [filehandle]
    mov cx,54
    mov dx,offset Header
    int 21h
    ret

ENDP ReadHeader
PROC ReadPalette

    ; Read BMP file color palette, 256 colors * 4 bytes (400h)
    mov ah,3fh
    mov cx,400h
    mov dx,offset Palette
    int 21h
    ret

ENDP ReadPalette
PROC CopyPal

    ; Copy the colors palette to the video memory
    ; The number of the first color should be sent to port 3C8h
    ; The palette is sent to port 3C9h
    mov si,offset Palette
    mov cx,256
    mov dx,3C8h
    mov al,0
    ; Copy starting color to port 3C8h
    out dx,al
    ; Copy palette itself to port 3C9h
    inc dx
    PalLoop:
    ; Note: Colors in a BMP file are saved as BGR values rather than RGB .
    mov al,[si+2] ; Get red value .
    shr al,2 ; Max. is 255, but video palette maximal
    ; value is 63. Therefore dividing by 4.
    out dx,al ; Send it .
    mov al,[si+1] ; Get green value .
    shr al,2
    out dx,al ; Send it .
    mov al,[si] ; Get blue value .
    shr al,2
    out dx,al ; Send it .
    add si,4 ; Point to next color .
    ; (There is a null chr. after every color.)
    loop PalLoop
    ret

ENDP CopyPal
PROC CopyBitmap

    ; BMP graphics are saved upside-down .
    ; Read the graphic line by line (200 lines in VGA format),
    ; displaying the lines from bottom to top.
    mov ax, 0A000h
    mov es, ax
    mov cx,200
    PrintBMPLoop:
    push cx
    ; di = cx*320, point to the correct screen line
    mov di,cx
    shl cx,6
    shl di,8
    add di,cx
    ; Read one line
    mov ah,3fh
    mov cx,320
    mov dx,offset ScrLine
    int 21h
    ; Copy one line into video memory
    cld ; Clear direction flag, for movsb
    mov cx,320
    mov si,offset ScrLine

    rep movsb ; Copy line to the screen
    ;rep movsb is same as the following code:
    ;mov es:di, ds:si
    ;inc si
    ;inc di
    ;dec cx
    ;loop until cx=0
    pop cx
    loop PrintBMPLoop
    ret

ENDP CopyBitmap
PROC Show_image

    ; Graphic mode
    mov ax, 13h
    int 10h
    ; Process BMP file
    call OpenFile
    call ReadHeader
    call ReadPalette
    call CopyPal
    call CopyBitmap
    call CloseBmpFile
    ; Wait for key press
    ; mov ah,1
    ; int 21h
    ; Back to text mode
    ; mov ah, 0
    ; mov al, 2
    ; int 10h
    ret

ENDP Show_image
;BMP ^^^^^^^^^^^^^^^^


;do go to last
; re dont work
; last go to re


;Screens \/\/\/\/\/\/\/\/\/\/\/\/\/
PROC Get_key

    mov [temp], 3
    mov [color],177

    GettingKey:
    mov ah,0              ;function 0 - wait for keypress
    int 16h              ;call ROM BIOS keyboard services
    ;after allowing the user to press keyboard
    ;now check which key

    cmp ah,1               ;ESC key pressed?
    je menu           ;yes, go to menu

    cmp ah, 45 ;x (2d in hex\45 inc dec)
    je songs


    cmp ah,16
    je playSi

    cmp ah,17
    je playDo2

    cmp ah,18
    je  playRe

    cmp ah,19
    je  playRe2

    cmp ah,20
    je playMi

    cmp ah,21
    je playFa

    cmp ah,22
    je  playFa2

    cmp ah,23
    je playSol

    cmp ah,24
    je playSol2

    cmp ah,25
    je playLa

    cmp ah,26
    je playLa2

    cmp ah,27
    je playSi

    jmp GettingKey
    endOFpiano:
    ;here just reset values
    mov [color],177
    mov [temp], 4
    ret

ENDP get_key
PROC Piano_mode

    ;shows how to play
    cmp [show_how], 0
    jne start_pianomode
    mov dx, offset imghowtoplay
    call Show_image
    mov [temp], 110
    call delay
    inc [show_how]
    ;^^^^
    start_pianoMode:
    ;shows normal piano game img
    mov [temp], 4
    mov dx, offset imgpiano
    call Show_image

    ;prints left side red bars on unused keys
    ;black background
    mov [x],-1
    mov [y],50
    mov [width1],71
    mov [height1],149
    mov [color],0
    call DrawSquare

    ;red bars
    mov [x],-1
    mov [y],50
    mov [width1],71
    mov [height1],5
    mov [color],1
    Red_Loop:
     mov [x],-1
    call DrawSquare
    add [y],8
    cmp [y],199
    jle Red_Loop
   ;^^^^

    ;starts the game
    call get_key
    ret

ENDP Piano_mode
PROC Songs

    mov [color],177
    mov [temp], 3

    
    mov dx, offset imgsongs
    call Show_image ;shows image of songs list

    Start_songs:
    mov ah,0              ;function 0 - wait for keypress
    int 16h              ;call ROM BIOS keyboard services


    cmp ah,1               ;ESC key pressed?
    je menu           ;yes, go to menu

    cmp ah, 45 ;x
    je piano_mode

    cmp ah, 30 ;A
    je fur_elise

    cmp ah, 48 ;B
    je tetris_song

    cmp ah, 46 ;C
    je survivor_song

    cmp ah, 32 ;D
    je Poland_song

    jmp Start_songs ;get another input if the user didnt press one of the intended buttons

    ;here just reset values
    mov [color],177
    mov [temp], 3
    ret

ENDP songs
PROC Home_page

    
    mov dx, offset imghomepage
    call Show_image
    
    start_home_page:
    mov ah,0              ;function 0 - wait for keypress
    int 16h              ;call ROM BIOS keyboard services
    ;after allowing the user to press keyboard
    ;now check which key

    cmp ah,1               ;ESC key pressed?
    je menu           ;yes, go to menu

    cmp ah,33  ;F key            
    je piano_mode        

    jmp start_home_page
    ret

ENDP Home_page
PROC About_Me

    mov [color],177
    mov [temp], 3

    
    mov dx, offset imgaboutme
    call Show_image
    
    start_aboutMe:

    mov ah,0              ;function 0 - wait for keypress
    int 16h              ;call ROM BIOS keyboard services

    cmp ah,1               ;ESC key pressed?
    je menu           ;yes, go to menu


    jmp start_aboutme
    ;here just reset values
    mov [color],177
    mov [temp], 3

    ret

ENDP About_Me
PROC Menu
;firstly when joining menu we need to reset and show the menu image
    jmp resetMenu


;moving to the selected screen depending on which position the user is in the menu currently
    goto_choice:
    cmp [menuplace], 3
    je about_me
    cmp [menuplace], 2
    je piano_mode
    cmp [menuplace], 1
    je exit
;================

;change position on screen when pressing down arrow
    go_down:
    call DeleteAllMenu

    dec [menuplace]
    call checkunder1
    call drawMenuPos
    jmp start_menu
;================

;change position on screen when pressing down arrow
    go_up:
    call DeleteAllMenu

    inc [menuplace]
    call checkabove3
    call drawMenuPos
    jmp start_menu
;================


    resetMenu:
    mov [color], 55 ;yellow
    mov [temp], 3
    mov [menuplace],3
    
    mov dx, offset imgmenu
    call Show_image
    call drawUpperMenu
   
    start_menu:
    mov ah,0              ;function 0 - wait for keypress
    int 16h              ;call ROM BIOS keyboard services


    cmp ah,80 ;arrow down
    je go_down

    cmp ah,72 ;arrow up
    je go_up

    cmp ah, 28 ;Enter
    je goto_choice

    jmp start_menu

    mov [color],177
    mov [temp], 3

ret
ENDP menu
;Screens ^^^^^^^^^^^^^^^^


Main:
call Home_page

exit:
mov ax, 4C00h
int 21h
END start