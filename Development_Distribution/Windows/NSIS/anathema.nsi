# Auto-generated by EclipseNSIS Script Wizard
# Aug 7, 2010 12:19:00 PM
#
# Revised by hand afterwards

# Requires AccessControl plugin: http://nsis.sourceforge.net/AccessControl_plug-in

Name Anathema

SetCompressor lzma

# General Symbol Definitions
!define REGKEY "SOFTWARE\$(^Name)"
!define COMPANY "Anathema Team"
!define URL http://anathema.sf.net

# MultiUser Symbol Definitions
!define MULTIUSER_EXECUTIONLEVEL Power
!define MULTIUSER_MUI
!define MULTIUSER_INSTALLMODE_DEFAULT_REGISTRY_KEY "${REGKEY}"
!define MULTIUSER_INSTALLMODE_DEFAULT_REGISTRY_VALUENAME MultiUserInstallMode
!define MULTIUSER_INSTALLMODE_COMMANDLINE
!define MULTIUSER_INSTALLMODE_INSTDIR Anathema
!define MULTIUSER_INSTALLMODE_INSTDIR_REGISTRY_KEY "${REGKEY}"
!define MULTIUSER_INSTALLMODE_INSTDIR_REGISTRY_VALUE "Path"

# MUI Symbol Definitions
!define MUI_ICON sungearInstall.ico
!define MUI_FINISHPAGE_NOAUTOCLOSE
!define MUI_STARTMENUPAGE_REGISTRY_ROOT HKLM
!define MUI_STARTMENUPAGE_REGISTRY_KEY ${REGKEY}
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME StartMenuGroup
!define MUI_STARTMENUPAGE_DEFAULTFOLDER Anathema
!define MUI_FINISHPAGE_SHOWREADME $INSTDIR\readme.txt
!define MUI_UNICON sungearInstall.ico
!define MUI_UNFINISHPAGE_NOAUTOCLOSE

# Included files
!include MultiUser.nsh
!include Sections.nsh
!include MUI2.nsh

# Variables
Var StartMenuGroup

# Installer pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE ..\..\..\Development_Documentation\Distribution\English\license.txt
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MULTIUSER_PAGE_INSTALLMODE
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_STARTMENU Application $StartMenuGroup
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

# Installer languages
!insertmacro MUI_LANGUAGE English
!insertmacro MUI_LANGUAGE Spanish
!insertmacro MUI_LANGUAGE Italian

# Installer attributes
OutFile ..\..\Anathema_v${RELEASE_VERSION}.exe
InstallDir Anathema
CRCCheck on
XPStyle on
ShowInstDetails show
VIProductVersion ${VERSION}
VIAddVersionKey /LANG=${LANG_ENGLISH} ProductName Anathema
VIAddVersionKey /LANG=${LANG_ENGLISH} ProductVersion "${RELEASE_VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} CompanyName "${COMPANY}"
VIAddVersionKey /LANG=${LANG_ENGLISH} CompanyWebsite "${URL}"
VIAddVersionKey /LANG=${LANG_ENGLISH} FileVersion "${RELEASE_VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} FileDescription ""
VIAddVersionKey /LANG=${LANG_ENGLISH} LegalCopyright ""
InstallDirRegKey HKLM "${REGKEY}" Path
ShowUninstDetails show

# Installer sections
Section -Anathema SEC0000
    SetOutPath $INSTDIR\lib
    SetOverwrite on
    File /r ..\..\build\libraries\*
    SetOutPath $INSTDIR
    File ..\..\build\anathema.jar
    File /r ..\..\build\files\*
    SetOutPath $INSTDIR\plugins
    File ..\..\build\plugins\core.jar
    WriteRegStr HKLM "${REGKEY}\Components" Anathema 1
SectionEnd

Section $(SEC0001_NAME) SEC0001
    SetOutPath $INSTDIR\plugins
    SetOverwrite on
    File ..\..\build\plugins\character.jar
    File ..\..\build\plugins\character_abyssal.jar
    File ..\..\build\plugins\character_db.jar
    File ..\..\build\plugins\character_lunar.jar
    File ..\..\build\plugins\character_martialarts.jar
    File ..\..\build\plugins\character_mortal.jar
    File ..\..\build\plugins\character_sidereal.jar
    File ..\..\build\plugins\character_solar.jar
    File ..\..\build\plugins\namegenerator.jar
    WriteRegStr HKLM "${REGKEY}\Components" "Character Management" 1
SectionEnd

Section $(SEC0002_NAME) SEC0002
    SetOutPath $INSTDIR\plugins
    SetOverwrite on
    File ..\..\build\plugins\charmcascades.jar
    WriteRegStr HKLM "${REGKEY}\Components" "Charm Cascades" 1
SectionEnd

Section $(SEC0003_NAME) SEC0003
    SetOutPath $INSTDIR\plugins
    SetOverwrite on
    File ..\..\build\plugins\music.jar
    WriteRegStr HKLM "${REGKEY}\Components" "Music Database" 1
SectionEnd

Section $(SEC0004_NAME) SEC0004
    SetOutPath $INSTDIR\plugins
    SetOverwrite on
    File ..\..\build\plugins\plot.jar
    WriteRegStr HKLM "${REGKEY}\Components" "Plot Management" 1
SectionEnd

Section $(SEC0005_NAME) SEC0005
    SetOutPath $INSTDIR\plugins
    SetOverwrite on
    File ..\..\build\plugins\blog_inkmonkeys.jar
    File ..\..\build\plugins\book_glories_luna.jar
    File ..\..\build\plugins\book_glories_maidens.jar
    File ..\..\build\plugins\book_glories_unconqueredsun.jar
    File ..\..\build\plugins\book_moep_abyssals.jar
    File ..\..\build\plugins\book_moep_infernals.jar
    File ..\..\build\plugins\book_moep_lunars.jar
    File ..\..\build\plugins\book_moep_sidereals.jar
    File ..\..\build\plugins\book_scrollofexalts.jar
    File ..\..\build\plugins\book_scrollofthefallenraces_debris.jar
    File ..\..\build\plugins\book_scrollofthemonk.jar
    File ..\..\build\plugins\book_scrollofthemonk_imperfectlotus.jar
    File ..\..\build\plugins\book_thousandcorrectactions.jar
    File ..\..\build\plugins\book_undertherose.jar
    File ..\..\build\plugins\box_dotfa.jar
    WriteRegStr HKLM "${REGKEY}\Components" Sourcebooks 1
SectionEnd

Section -post SEC0006
    WriteRegStr HKLM "${REGKEY}" Path $INSTDIR
    SetOutPath $INSTDIR
    CreateDirectory $INSTDIR\repository
    AccessControl::GrantOnFile "$INSTDIR\repository" "(BU)" "GenericRead + GenericWrite"
    WriteUninstaller $INSTDIR\uninstall.exe
    !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    CreateDirectory $SMPROGRAMS\$StartMenuGroup
    CreateShortcut "$SMPROGRAMS\$StartMenuGroup\$(^Name).lnk" $INSTDIR\anathema.exe
    CreateShortcut "$SMPROGRAMS\$StartMenuGroup\$(^UninstallLink).lnk" $INSTDIR\uninstall.exe
    !insertmacro MUI_STARTMENU_WRITE_END
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" DisplayName "$(^Name)"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" DisplayVersion "${RELEASE_VERSION}"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" Publisher "${COMPANY}"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" URLInfoAbout "${URL}"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" DisplayIcon $INSTDIR\uninstall.exe
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" UninstallString $INSTDIR\uninstall.exe
    WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" NoModify 1
    WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" NoRepair 1
SectionEnd

# Macro for selecting uninstaller sections
!macro SELECT_UNSECTION SECTION_NAME UNSECTION_ID
    Push $R0
    ReadRegStr $R0 HKLM "${REGKEY}\Components" "${SECTION_NAME}"
    StrCmp $R0 1 0 next${UNSECTION_ID}
    !insertmacro SelectSection "${UNSECTION_ID}"
    GoTo done${UNSECTION_ID}
next${UNSECTION_ID}:
    !insertmacro UnselectSection "${UNSECTION_ID}"
done${UNSECTION_ID}:
    Pop $R0
!macroend

# Uninstaller sections
Section /o "-un.$(SEC0005_NAME)" UNSEC0005
    Delete /REBOOTOK $INSTDIR\plugins\box_dotfa.jar
    Delete /REBOOTOK $INSTDIR\plugins\book_undertherose.jar
    Delete /REBOOTOK $INSTDIR\plugins\book_thousandcorrectactions.jar
    Delete /REBOOTOK $INSTDIR\plugins\book_scrollofthemonk_imperfectlotus.jar
    Delete /REBOOTOK $INSTDIR\plugins\book_scrollofthemonk.jar
    Delete /REBOOTOK $INSTDIR\plugins\book_scrollofthefallenraces_debris.jar
    Delete /REBOOTOK $INSTDIR\plugins\book_scrollofexalts.jar
    Delete /REBOOTOK $INSTDIR\plugins\book_moep_sidereals.jar
    Delete /REBOOTOK $INSTDIR\plugins\book_moep_lunars.jar
    Delete /REBOOTOK $INSTDIR\plugins\book_moep_infernals.jar
    Delete /REBOOTOK $INSTDIR\plugins\book_moep_abyssals.jar
    Delete /REBOOTOK $INSTDIR\plugins\book_glories_unconqueredsun.jar
    Delete /REBOOTOK $INSTDIR\plugins\book_glories_maidens.jar
    Delete /REBOOTOK $INSTDIR\plugins\book_glories_luna.jar
    Delete /REBOOTOK $INSTDIR\plugins\blog_inkmonkeys_vol20_22.jar
    Delete /REBOOTOK $INSTDIR\plugins\blog_inkmonkeys_vol10_11.jar
    Delete /REBOOTOK $INSTDIR\plugins\blog_inkmonkeys_vol8.jar
    Delete /REBOOTOK $INSTDIR\plugins\blog_inkmonkeys.jar
    DeleteRegValue HKLM "${REGKEY}\Components" Sourcebooks
SectionEnd

Section /o "-un.$(SEC0004_NAME)" UNSEC0004
    Delete /REBOOTOK $INSTDIR\plugins\plot.jar
    DeleteRegValue HKLM "${REGKEY}\Components" "Plot Management"
SectionEnd

Section /o "-un.$(SEC0003_NAME)" UNSEC0003
    Delete /REBOOTOK $INSTDIR\plugins\music.jar
    DeleteRegValue HKLM "${REGKEY}\Components" "Music Database"
SectionEnd

Section /o "-un.$(SEC0002_NAME)" UNSEC0002
    Delete /REBOOTOK $INSTDIR\plugins\charmcascades.jar
    DeleteRegValue HKLM "${REGKEY}\Components" "Charm Cascades"
SectionEnd

Section /o "-un.$(SEC0001_NAME)" UNSEC0001
    Delete /REBOOTOK $INSTDIR\plugins\namegenerator.jar
    Delete /REBOOTOK $INSTDIR\plugins\character_solar.jar
    Delete /REBOOTOK $INSTDIR\plugins\character_sidereal.jar
    Delete /REBOOTOK $INSTDIR\plugins\character_mortal.jar
    Delete /REBOOTOK $INSTDIR\plugins\character_martialarts.jar
    Delete /REBOOTOK $INSTDIR\plugins\character_lunar.jar
    Delete /REBOOTOK $INSTDIR\plugins\character_db.jar
    Delete /REBOOTOK $INSTDIR\plugins\character_abyssal.jar
    Delete /REBOOTOK $INSTDIR\plugins\character.jar
    DeleteRegValue HKLM "${REGKEY}\Components" "Character Management"
SectionEnd

Section /o -un.Anathema UNSEC0000
    Delete /REBOOTOK $INSTDIR\plugins\core.jar
    RmDir /r /REBOOTOK $INSTDIR
    RmDir /r /REBOOTOK $INSTDIR\lib
    DeleteRegValue HKLM "${REGKEY}\Components" Anathema
SectionEnd

Section -un.post UNSEC0006
    DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)"
    Delete /REBOOTOK "$SMPROGRAMS\$StartMenuGroup\$(^UninstallLink).lnk"
    Delete /REBOOTOK "$SMPROGRAMS\$StartMenuGroup\$(^Name).lnk"
    Delete /REBOOTOK $INSTDIR\uninstall.exe
    DeleteRegValue HKLM "${REGKEY}" StartMenuGroup
    DeleteRegValue HKLM "${REGKEY}" Path
    DeleteRegKey /IfEmpty HKLM "${REGKEY}\Components"
    DeleteRegKey /IfEmpty HKLM "${REGKEY}"
    RmDir /REBOOTOK $SMPROGRAMS\$StartMenuGroup
    RmDir /REBOOTOK $INSTDIR\repository
    RmDir /REBOOTOK $INSTDIR
    Push $R0
    StrCpy $R0 $StartMenuGroup 1
    StrCmp $R0 ">" no_smgroup
no_smgroup:
    Pop $R0
SectionEnd

# Installer functions
Function .onInit
    InitPluginsDir
    !insertmacro MUI_LANGDLL_DISPLAY
    !insertmacro MULTIUSER_INIT
FunctionEnd

# Uninstaller functions
Function un.onInit
    !insertmacro MUI_STARTMENU_GETFOLDER Application $StartMenuGroup
    !insertmacro MULTIUSER_UNINIT
    !insertmacro SELECT_UNSECTION Anathema ${UNSEC0000}
    !insertmacro SELECT_UNSECTION "Character Management" ${UNSEC0001}
    !insertmacro SELECT_UNSECTION "Charm Cascades" ${UNSEC0002}
    !insertmacro SELECT_UNSECTION "Music Database" ${UNSEC0003}
    !insertmacro SELECT_UNSECTION "Plot Management" ${UNSEC0004}
    !insertmacro SELECT_UNSECTION Sourcebooks ${UNSEC0005}
FunctionEnd

# Section Descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
!insertmacro MUI_DESCRIPTION_TEXT ${SEC0001} $(SEC0001_DESC)
!insertmacro MUI_DESCRIPTION_TEXT ${SEC0002} $(SEC0002_DESC)
!insertmacro MUI_DESCRIPTION_TEXT ${SEC0003} $(SEC0003_DESC)
!insertmacro MUI_DESCRIPTION_TEXT ${SEC0004} $(SEC0004_DESC)
!insertmacro MUI_DESCRIPTION_TEXT ${SEC0005} $(SEC0005_DESC)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

# Installer Language Strings
# TODO Update the Language Strings with the appropriate translations.

LangString ^UninstallLink ${LANG_ENGLISH} "Uninstall $(^Name)"
LangString ^UninstallLink ${LANG_SPANISH} "Desinstalar $(^Name)"
LangString ^UninstallLink ${LANG_ITALIAN} "Disinstallare $(^Name)"

LangString SEC0001_NAME ${LANG_ENGLISH} "Character Management"
LangString SEC0001_DESC ${LANG_ENGLISH} "Adds the 'Character' item and related options."
LangString SEC0002_NAME ${LANG_ENGLISH} "Charm Cascades"
LangString SEC0002_DESC ${LANG_ENGLISH} "Stand-alone charm-viewer. Requires 'Character Management' for charm data."
LangString SEC0003_NAME ${LANG_ENGLISH} "Music Database"
LangString SEC0003_DESC ${LANG_ENGLISH} "Music management"
LangString SEC0004_NAME ${LANG_ENGLISH} "Plot Management"
LangString SEC0004_DESC ${LANG_ENGLISH} "Adds the 'Note' and 'Series' items."
LangString SEC0005_NAME ${LANG_ENGLISH} "Additional Sourcebooks"
LangString SEC0005_DESC ${LANG_ENGLISH} "Adds material from official sourcebooks. Requires 'Character Management' for display."

LangString SEC0001_NAME ${LANG_SPANISH} "Manejo de Personajes"
LangString SEC0001_DESC ${LANG_SPANISH} "Agrega el articulo 'Personaje' y las opciones relacionadas."
LangString SEC0002_NAME ${LANG_SPANISH} "Cascadas de Encantamientos"
LangString SEC0002_DESC ${LANG_SPANISH} "Visualizador-de-Encantamientos Independiente. Requiere 'Manejo de Personajes' para los datos de encantamientos."
LangString SEC0003_NAME ${LANG_SPANISH} "Base de Datos de Musica"
LangString SEC0003_DESC ${LANG_SPANISH} "Manejo de Musica"
LangString SEC0004_NAME ${LANG_SPANISH} "Manejo de Series"
LangString SEC0004_DESC ${LANG_SPANISH} "Agrega los articulos 'Nota' y 'Series'."
LangString SEC0005_NAME ${LANG_SPANISH} "Additional Sourcebooks"
LangString SEC0005_DESC ${LANG_SPANISH} "Adds material from official sourcebooks. Requires 'Character Management' for display."

LangString SEC0001_NAME ${LANG_ITALIAN} "Gestione Personaggi"
LangString SEC0001_DESC ${LANG_ITALIAN} "Aggiunge l'oggetto 'Personaggio' e le relative opzioni."
LangString SEC0002_NAME ${LANG_ITALIAN} "Cascate di Prodigi"
LangString SEC0002_DESC ${LANG_ITALIAN} "Un visualizzatore interno di alberi di Prodigi. Richiede 'Gestione Personaggi' per i dati dei Prodigi."
LangString SEC0003_NAME ${LANG_ITALIAN} "Database Musicale"
LangString SEC0003_DESC ${LANG_ITALIAN} "Gestione Musicale delle colonne sonore"
LangString SEC0004_NAME ${LANG_ITALIAN} "Gestione Trama"
LangString SEC0004_DESC ${LANG_ITALIAN} "Aggiunge gli oggetti relativi a 'Note' e 'Serie'."
LangString SEC0005_NAME ${LANG_ITALIAN} "Additional Sourcebooks"
LangString SEC0005_DESC ${LANG_ITALIAN} "Adds material from official sourcebooks. Requires 'Character Management' for display."
