@ECHO off

:: Variáveis principais.
SET origem=%CD%
SET destino=%CD%
SET pastas=e





:menu
CLS
TITLE Copiadora de arquivos   I   MENU PRINCIPAL
COLOR f
ECHO.
ECHO     Origem dos  arquivos:   [%origem%]
ECHO     Destino dos arquivos:   [%destino%]
ECHO.
ECHO     Saia a qualquer momento com [Ctrl+C] ou use a espacos vazios como INPUT, e de [ENTER].
:: Força um erro que faz o programa parar a execução...
ECHO.
ECHO         - Digite [1] para alterar a origem e o destino.
ECHO         - Digite [2] para salvar algumas informacoes da origem.
ECHO             - Digite [A] para ver os diretorios e arquivos da origem.
ECHO             - Digite [B] para ver as subpastas em arvore da origem.
ECHO             - Digite [C] para ver as subpastas e arquivos em arvore da origem.
ECHO         - Digite [3] para tomar acao rapidamente (inclui pastas vazias).
ECHO         - Digite [4] para selecionar quais arquivos e pastas serao selecionados.
ECHO.

:: --- input ---
:: Essa linha evita erros em que a variável está vazia.
SET userUM=Default
SET /p userUM="|   O que deseja fazer?   |  %TIME:~0, -3%   > "


IF %userUM% EQU 1 ( GOTO origemDestino )
IF %userUM% EQU 2 ( GOTO salvarInformacoes )

IF %userUM% EQU A ( SET userUM=a )
IF %userUM% EQU B ( SET userUM=b )
IF %userUM% EQU C ( SET userUM=c )
IF %userUM% EQU a ( GOTO diretoriosArquivos )
IF %userUM% EQU b ( GOTO diretoriosArquivos )
IF %userUM% EQU c ( GOTO diretoriosArquivos )

IF %userUM% EQU 3 ( GOTO defaultCopy )
IF %userUM% EQU 4 ( ECHO 4 )

:: ELSE...
COLOR C
COLOR F
GOTO menu





:origemDestino
CLS
TITLE Copiadora de arquivos   I   ALTERAR A ORIGEM E O DESTINO
ECHO.
ECHO     Origem dos  arquivos: [%origem%]
ECHO     Destino dos arquivos: [%destino%]
ECHO.
ECHO         Deixe o campo vazio caso nao queira alterar nada.
ECHO.

:: --- input ---
SET /p origem="|   Redefinir a  origem   |  %TIME:~0, -3%   > "
SET /p destino="|   Redefinir o destino   |  %TIME:~0, -3%   > "

GOTO menu





:salvarInformacoes
CLS
COLOR a
TITLE Copiadora de arquivos   I   SALVAR INFORMACOES DA ORIGEM
ECHO.

:: --- input ---
SET nameUM=%random%.txt
SET /p nameUM="|   Nome do arquivo   |  %TIME:~0, -3%   > "

DIR %origem% >%nameUM%
ECHO ------------------------------------------------------------------------------- >>%nameUM%
TREE /f %origem% >>%nameUM%

ECHO Informacoes salvas no arquivo %nameUM% com sucesso!
ECHO.

PAUSE
GOTO menu





:diretoriosArquivos
CLS
COLOR e
TITLE Copiadora de arquivos   I   MOSTRAR CONTEUDO DA ORIGEM

ECHO.
ECHO -------------------------------------------------------------------------------
IF %userUM% EQU a (
	DIR %origem%
) ELSE (
	IF %userUM% EQU b (
		TREE %origem%
	) ELSE (
		TREE /f %origem%
	)
)
ECHO ------------------------------------ Precione qualquer tecla para continuar ---

PAUSE >nul
GOTO menu





:defaultCopy
CLS
COLOR a
TITLE Copiadora de arquivos   I   COPIA PADRAO
ROBOCOPY %origem% %destino%/cp%random% * /%pastas%
ECHO ------------------------------------ Precione qualquer tecla para continuar ---
PAUSE >nul
GOTO menu