@ECHO OFF
set font_zip=https://github.com/be5invis/Sarasa-Gothic/releases/download/v0.38.0/sarasa-gothic-ttf-0.38.0.7z
set template_zip=https://github.com/lxgw/advanced-cjk-font-magisk-module-template/releases/download/v3.3.220605/FontTemplateA-Magisk204.zip
::checking
ECHO Time:%date%
ECHO Checking the required folder...
if not exist output\ ( mkdir output\ ) else ( del /F /S /Q output\ & rmdir /S /Q output\ & mkdir output\ )
if exist Sarasa-Gothic-Font-Magisk-Module.zip del /F /S /Q Sarasa-Gothic-Font-Magisk-Module.zip
if exist fonts\ del /F /S /Q fonts\ & rmdir /S /Q fonts\
::integrating files
ECHO.
wget.exe -O "font.7z" %font_zip%
wget.exe -O "Template.zip" %template_zip%
7z.exe x font.7z sarasa-gothic-sc-*.ttf -r -o.\fonts
7z.exe x Template.zip -r -o.\output
xcopy fonts\sarasa-gothic-sc-*.ttf output\system\fonts /E /Q /C /Y

ren output\system\fonts\sarasa-gothic-sc-extralight.ttf fonten2.ttf
ren output\system\fonts\sarasa-gothic-sc-light.ttf fonten3.ttf
ren output\system\fonts\sarasa-gothic-sc-regular.ttf fonten4.ttf
copy output\system\fonts\fonten4.ttf /Y output\system\fonts\fonten5.ttf
ren output\system\fonts\sarasa-gothic-sc-semibold.ttf fonten6.ttf
ren output\system\fonts\sarasa-gothic-sc-bold.ttf fonten7.ttf

ren output\system\fonts\sarasa-gothic-sc-extralightitalic.ttf fontei2.ttf
ren output\system\fonts\sarasa-gothic-sc-lightitalic.ttf fontei3.ttf
ren output\system\fonts\sarasa-gothic-sc-italic.ttf fontei4.ttf
copy output\system\fonts\fontei4.ttf /Y output\system\fonts\fontei5.ttf
ren output\system\fonts\sarasa-gothic-sc-semibolditalic.ttf fontei6.ttf
ren output\system\fonts\sarasa-gothic-sc-bolditalic.ttf fontei7.ttf

del /F /S /Q output\module.prop
xcopy module.prop output\
ECHO.
ECHO Compressing the generated files...
7z.exe a Sarasa-Gothic-Font-Magisk-Module.zip .\output\*
::done
ECHO.
ECHO End of script running.
