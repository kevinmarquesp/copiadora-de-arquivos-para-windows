@ECHO off
COLOR F

:: Variáveis principais.
SET origem=%CD%
SET destino=%CD%





:menu
CLS
TITLE Copiadora de arquivos   I   MENU PRINCIPAL
ECHO.
ECHO     Origem dos arquivos:    [%origem%]
ECHO     Destino dos arquivos:   [%destino%]
ECHO.
ECHO     Saia a qualquer momento com [Ctrl+C] ou use a espacos vazios como INPUT, e de [ENTER].
:: Força um erro que faz o programa parar a execução...
ECHO.
ECHO         - Digite [1] para alterar a origem e o destino.
ECHO         - Digite [2] para ver os diretorios e arquivos da origem.
ECHO             - Digite [A] para ver as subpastas em arvore da origem.
ECHO             - Digite [B] para ver as subpastas e arquivos em arvore da origem.
ECHO         - Digite [3] para tomar acao rapidamente (inclui pastas vazias).
ECHO         - Digite [4] para selecionar quais arquivos e pastas serao selecionados.
ECHO.

:: Essa linha evita erros em que a variável está vazia.
SET userUM=Default
SET /p userUM="|   O que deseja fazer?   |  %TIME:~0, -3%   > "


IF %userUM% EQU 1 ( GOTO origemDestino )
IF %userUM% EQU 2 ( ECHO 2 )

IF %userUM% EQU A ( ECHO a )
IF %userUM% EQU a ( ECHO a )
IF %userUM% EQU B ( ECHO b )
IF %userUM% EQU b ( ECHO b )

IF %userUM% EQU 3 ( ECHO 3 )
IF %userUM% EQU 4 ( ECHO 4 )

:: ELSE...
COLOR C
COLOR F
GOTO menu




:origemDestino
ECHO Hello world
PAUSE >nul




:: Finalização do programa. Apenas para maior controle...
echo [precione qualquer tecla para sair]
pause >nul