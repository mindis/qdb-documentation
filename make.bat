@ECHO OFF

REM Command file for Sphinx documentation

if "%SPHINXBUILD%" == "" (
	set SPHINXBUILD=sphinx-build
)
set BUILDDIR=build
set ALLSPHINXOPTS=-d %BUILDDIR%/doctrees %SPHINXOPTS%
if NOT "%PAPER%" == "" (
	set ALLSPHINXOPTS=-D latex_paper_size=%PAPER% %ALLSPHINXOPTS%
)

if "%1" == "" goto help

if "%1" == "help" (
	:help
	echo.Please use `make ^<target^>` where ^<target^> is one of
	echo.  html       to make standalone HTML files
	echo.  dirhtml    to make HTML files named index.html in directories
	echo.  singlehtml to make a single large HTML file
	echo.  pickle     to make pickle files
	echo.  json       to make JSON files
	echo.  htmlhelp   to make HTML files and a HTML help project
	echo.  qthelp     to make HTML files and a qthelp project
	echo.  devhelp    to make HTML files and a Devhelp project
	echo.  epub       to make an epub
	echo.  latex      to make LaTeX files, you can set PAPER=a4 or PAPER=letter
	echo.  text       to make text files
	echo.  man        to make manual pages
	echo.  changes    to make an overview over all changed/added/deprecated items
	echo.  linkcheck  to check all external links for integrity
	echo.  doctest    to run all doctests embedded in the documentation if enabled
	goto end
)

if "%1" == "clean" (
	for /d %%i in (%BUILDDIR%\*) do rmdir /q /s %%i
	del /q /s %BUILDDIR%\*
	goto end
)

if "%1" == "html" (
	for /f "usebackq" %%V in (`dir "source\*" /b ^| findstr /i "^[0-9]\.[0-9]*"`) do (
		%SPHINXBUILD% -b html %ALLSPHINXOPTS% source\%%V %BUILDDIR%/html/%%V
		
		if errorlevel 1 exit /b 1
	)
	echo.
	echo.Build finished. The HTML pages are in %BUILDDIR%/html/VERSION.
	goto end
)

if "%1" == "dirhtml" (
	for /f "usebackq" %%V in (`dir "source\*" /b ^| findstr /i "^[0-9]\.[0-9]*"`) do (
		%SPHINXBUILD% -b dirhtml %ALLSPHINXOPTS% source\%%V %BUILDDIR%/dirhtml/%%V
		
		if errorlevel 1 exit /b 1
	)
	echo.
	echo.Build finished. The HTML pages are in %BUILDDIR%/dirhtml/VERSION.
	goto end
)

if "%1" == "singlehtml" (
	for /f "usebackq" %%V in (`dir "source\*" /b ^| findstr /i "^[0-9]\.[0-9]*"`) do (
		%SPHINXBUILD% -b singlehtml %ALLSPHINXOPTS% source\%%V %BUILDDIR%/singlehtml/%%V
		
		if errorlevel 1 exit /b 1
	)
	echo.
	echo.Build finished. The HTML pages are in %BUILDDIR%/singlehtml/VERSION.
	goto end
)

if "%1" == "pickle" (
	for /f "usebackq" %%V in (`dir "source\*" /b ^| findstr /i "^[0-9]\.[0-9]*"`) do (
		%SPHINXBUILD% -b pickle %ALLSPHINXOPTS% source\%%V %BUILDDIR%/pickle/%%V
		
		if errorlevel 1 exit /b 1
	)
	echo.
	echo.Build finished; now you can process the pickle files.
	goto end
)

if "%1" == "json" (
	for /f "usebackq" %%V in (`dir "source\*" /b ^| findstr /i "^[0-9]\.[0-9]*"`) do (
		%SPHINXBUILD% -b json %ALLSPHINXOPTS% source\%%V %BUILDDIR%/json/%%V
		
		if errorlevel 1 exit /b 1
	)
	echo.
	echo.Build finished; now you can process the JSON files.
	goto end
)

if "%1" == "htmlhelp" (
	for /f "usebackq" %%V in (`dir "source\*" /b ^| findstr /i "^[0-9]\.[0-9]*"`) do (
		%SPHINXBUILD% -b htmlhelp %ALLSPHINXOPTS% source\%%V %BUILDDIR%/htmlhelp/%%V
		
		if errorlevel 1 exit /b 1
	)
	echo.
	echo.Build finished; now you can run HTML Help Workshop with the ^
.hhp project file in %BUILDDIR%/htmlhelp.
	goto end
)

if "%1" == "qthelp" (
	for /f "usebackq" %%V in (`dir "source\*" /b ^| findstr /i "^[0-9]\.[0-9]*"`) do (
		%SPHINXBUILD% -b qthelp %ALLSPHINXOPTS% source\%%V %BUILDDIR%/qthelp/%%V
		
		if errorlevel 1 exit /b 1
	)
	echo.
	echo.Build finished; now you can run "qcollectiongenerator" with the ^
.qhcp project file in %BUILDDIR%/qthelp/VERSION, like this:
	echo.^> qcollectiongenerator %BUILDDIR%\qthelp\1.0\wrpme.qhcp
	echo.To view the help file:
	echo.^> assistant -collectionFile %BUILDDIR%\qthelp\VERSION\wrpme.ghc
	goto end
)

if "%1" == "devhelp" (
	for /f "usebackq" %%V in (`dir "source\*" /b ^| findstr /i "^[0-9]\.[0-9]*"`) do (
		%SPHINXBUILD% -b devhelp %ALLSPHINXOPTS% source\%%V %BUILDDIR%/devhelp/%%V
		
		if errorlevel 1 exit /b 1
	)
	echo.
	echo.Build finished.
	goto end
)

if "%1" == "epub" (
	for /f "usebackq" %%V in (`dir "source\*" /b ^| findstr /i "^[0-9]\.[0-9]*"`) do (
		%SPHINXBUILD% -b epub %ALLSPHINXOPTS% source\%%V %BUILDDIR%/epub/%%V
		
		if errorlevel 1 exit /b 1
	)
	echo.
	echo.Build finished. The epub file is in %BUILDDIR%/epub.
	goto end
)

if "%1" == "latex" (
	for /f "usebackq" %%V in (`dir "source\*" /b ^| findstr /i "^[0-9]\.[0-9]*"`) do (
		%SPHINXBUILD% -b latex %ALLSPHINXOPTS% source\%%V %BUILDDIR%/latex/%%V
		
		if errorlevel 1 exit /b 1
	)
	echo.
	echo.Build finished; the LaTeX files are in %BUILDDIR%/latex.
	goto end
)

if "%1" == "text" (
	for /f "usebackq" %%V in (`dir "source\*" /b ^| findstr /i "^[0-9]\.[0-9]*"`) do (
		%SPHINXBUILD% -b text %ALLSPHINXOPTS% source\%%V %BUILDDIR%/text/%%V
		
		if errorlevel 1 exit /b 1
	)
	echo.
	echo.Build finished. The text files are in %BUILDDIR%/text.
	goto end
)

if "%1" == "man" (
	for /f "usebackq" %%V in (`dir "source\*" /b ^| findstr /i "^[0-9]\.[0-9]*"`) do (
		%SPHINXBUILD% -b man %ALLSPHINXOPTS% source\%%V %BUILDDIR%/man/%%V
		
		if errorlevel 1 exit /b 1
	)
	echo.
	echo.Build finished. The manual pages are in %BUILDDIR%/man.
	goto end
)

if "%1" == "changes" (
	for /f "usebackq" %%V in (`dir "source\*" /b ^| findstr /i "^[0-9]\.[0-9]*"`) do (
		%SPHINXBUILD% -b changes %ALLSPHINXOPTS% source\%%V %BUILDDIR%/changes/%%V
		
		if errorlevel 1 exit /b 1
	)
	echo.
	echo.The overview file is in %BUILDDIR%/changes.
	goto end
)

if "%1" == "linkcheck" (
	for /f "usebackq" %%V in (`dir "source\*" /b ^| findstr /i "^[0-9]\.[0-9]*"`) do (
		%SPHINXBUILD% -b linkcheck %ALLSPHINXOPTS% source\%%V %BUILDDIR%/linkcheck/%%V
		
		if errorlevel 1 exit /b 1
	)
	echo.
	echo.Link check complete; look for any errors in the above output ^
or in %BUILDDIR%/linkcheck/output.txt.
	goto end
)

if "%1" == "doctest" (
	for /f "usebackq" %%V in (`dir "source\*" /b ^| findstr /i "^[0-9]\.[0-9]*"`) do (
		%SPHINXBUILD% -b doctest %ALLSPHINXOPTS% source\%%V %BUILDDIR%/doctest/%%V
		
		if errorlevel 1 exit /b 1
	)
	echo.
	echo.Testing of doctests in the sources finished, look at the ^
results in %BUILDDIR%/doctest/output.txt.
	goto end
)

:end
