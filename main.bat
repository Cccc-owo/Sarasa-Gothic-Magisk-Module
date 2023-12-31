@ECHO OFF
set font_zip=https://github.com/be5invis/Sarasa-Gothic/releases/download/v1.0.2/Sarasa-TTF-Unhinted-1.0.2.7z
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
7z.exe x font.7z SarasaUiSC-*.ttf -r -o.\fonts
7z.exe x Template.zip -r -o.\output
xcopy fonts\SarasaUiSC-*.ttf output\system\fonts /E /Q /C /Y

ren output\system\fonts\SarasaUiSC-ExtraLight.ttf fontchw2.ttf
ren output\system\fonts\SarasaUiSC-Light.ttf fontchw3.ttf
ren output\system\fonts\SarasaUiSC-Regular.ttf fontchw4.ttf
copy output\system\fonts\fontchw4.ttf /Y output\system\fonts\fontchw5.ttf
ren output\system\fonts\SarasaUiSC-SemiBold.ttf fontchw6.ttf
ren output\system\fonts\SarasaUiSC-Bold.ttf fontchw7.ttf

del /F /S /Q output\system\fonts\SarasaUiSC-ExtraLightItalic.ttf
del /F /S /Q output\system\fonts\SarasaUiSC-LightItalic.ttf
del /F /S /Q output\system\fonts\SarasaUiSC-Italic.ttf
del /F /S /Q output\system\fonts\SarasaUiSC-SemiBoldItalic.ttf
del /F /S /Q output\system\fonts\SarasaUiSC-BoldItalic.ttf

::ren output\system\fonts\SarasaUiSC-ExtraLightItalic.ttf fontei2.ttf
::ren output\system\fonts\SarasaUiSC-LightItalic.ttf fontei3.ttf
::ren output\system\fonts\SarasaUiSC-Italic.ttf fontei4.ttf
::copy output\system\fonts\fontei4.ttf /Y output\system\fonts\fontei5.ttf
::ren output\system\fonts\SarasaUiSC-SemiBoldItalic.ttf fontei6.ttf
::ren output\system\fonts\SarasaUiSC-BoldItalic.ttf fontei7.ttf

del /F /S /Q output\module.prop
xcopy module.prop output\
ECHO.
ECHO Compressing the generated files...
7z.exe a Sarasa-Gothic-Font-Magisk-Module.zip .\output\*
::done
ECHO.
ECHO End of script running.
