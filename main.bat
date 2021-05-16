@ECHO off

:: Variáveis principais.
SET origem=%CD%
SET destino=%CD%
SET pastas=e
SET arquivos=*
SET nome=cp%random%




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

IF %userUM% EQU 3 ( GOTO copy )
IF %userUM% EQU 4 ( GOTO customCopy )

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





:copy
CLS
COLOR a
TITLE Copiadora de arquivos   I   COPIA PADRAO
ROBOCOPY %origem% %destino%/%nome% %arquivos% /%pastas%
ECHO ------------------------------------ Precione qualquer tecla para continuar ---
PAUSE >nul
GOTO menu





:customCopy
CLS
TITLE Copiadora de arquivos   I   COPIA CUSTOMIZADA
COLOR e
ECHO.
ECHO     Origem dos  arquivos:   [%origem%]
ECHO     Destino dos arquivos:   [%destino%]
ECHO.


:: --- input ---
SET userDOIS=s
SET /p userDOIS="|   [S/n] Deseja copar as pastas vazias?   |  %TIME:~0, -3%   > "

IF %userDOIS% EQU S ( SET userDOIS=s )
IF %userDOIS% EQU N ( SET userDOIS=n )

IF %userDOIS% EQU s (
	ECHO [Configurado para COPIAR as pastas vazias!]
) ELSE (
	ECHO [Configurado para NAO COPIAR as pastas vazias!]
	SET pastas=s
)


ECHO.
ECHO         - Digite [1] para selecionar TUDO.
ECHO         - Digite [2] para selecionar Imagens (png, jpg, jpeg, gif, ico, svg, bmp).
ECHO         - Digite [3] para selecionar Videos (mp4, avi, mkv, vmv, vma, mpg, mpeg, asf).
ECHO         - Digite [4] para selecionar Musicas (mp3, wav, flaac, acc).
ECHO         - Digite [5] para selecionar Textos (txt, md, docx, pdf, doc, docm).
ECHO         - Digite [6] para selecionar arquivos Office (doc, docx, docm, xlsx, xlsm, xltx, pptx, pppsx, potx, accdb, mdb).
ECHO             - Digite [A] para selecionar arquivos do Word (doc, docx, docm).
ECHO             - Digite [B] para selecionar arquivos do Exel (xlsx, xlsm, xltx).
ECHO             - Digite [C] para selecionar arquivos do Power Point (pptx, ppsx, potx).
ECHO             - Digite [D] para selecionar arquivos do Acess (accdb, mdb).
ECHO         - Digite [7] para selecionar arquivos Web (html, htm, php, js, aspx, css, cpp, py).
ECHO         - Digite [8] para selecionar arquivos de Design (psd, indd, pdf, svg, cdr, ai, aep, aepx, ppj).
ECHO         - Digite [9] para selecionar arquivos do Sistema (dll, reg, jar, bat, vbs).
ECHO         - Digite [10] para selecionar Campactados (zip, rar, tar, 7z).
ECHO         - Digite [11] para PERSONALIZAR o tipo de arquivo.
ECHO.

:: --- input ---
SET userTRES=Default
SET /p userTRES="|   Deixe vazio para voltar ao menu...   |  %TIME:~0, -3%   > "


PAUSE >nul
GOTO menu





