[Files] 
Source: therion-batteries\bin\win32\*.*; DestDir: {app}\bin\win32; Components: tex 
Source: therion-batteries\texmf\*.*; DestDir: {app}\texmf; Flags: recursesubdirs; Components: tex 
 
Source: therion-batteries\bin\wish.exe; DestDir: {app}\bin; Components: tcl 
Source: therion-batteries\lib\*.*; DestDir: {app}\lib; Flags: recursesubdirs; Components: tcl 
 
Source: therion\therion.exe; DestDir: {app}; Components: therion 
Source: therion\therion.ini; DestDir: {app}; Components: therion 
Source: therion\xtherion\xtherion.tcl; DestDir: {app}; Components: therion 
Source: therion\xtherion\xtherion.ini; DestDir: {app}; Components: therion 
;Source: therion\thbook\thbook.pdf; DestDir: {app}; Components: therion 
Source: therion\README; DestDir: {app}; Components: therion 
Source: therion\COPYING; DestDir: {app}; Components: therion 
 
 
[Setup] 
OutputDir=C:\Cave 
AppName=Therion 
AppVerName=Therion 
DefaultDirName={pf}\Therion 
AppID={0AFAB7F4-1EBC-4269-AECD-2A490A902BDD} 
UninstallDisplayName=Therion 
SetupIconFile=C:\Cave\therion\therion.ico 
ShowLanguageDialog=no 
LanguageDetectionMethod=none 
OutputBaseFilename=therion-batteries 
AppPublisherURL=http://therion.speleo.sk 
SourceDir=C:\Cave 
DefaultGroupName=Therion 
ChangesAssociations=true 
WizardSmallImageFile=therion-batteries\therion.bmp 
WizardImageFile=therion-batteries\mapa.bmp 
WizardImageStretch=false 
[Components] 
Name: therion; Description: Therion; Flags: fixed; Types: default 
Name: tex; Description: TeX, MetaPost and pdfTeX; Types: default 
Name: tcl; Description: Tcl/Tk with BWidgets; Types: default 
[Types] 
Name: default; Description: Therion installation; Flags: iscustom 
[Icons] 
Name: {group}\XTherion; Filename: {app}\xtherion.tcl; IconFileName: {app}\therion.exe; Check: NoTherionTcl 
Name: {group}\XTherion; Filename: {app}\bin\wish.exe; Parameters: """{app}\xtherion.tcl"""; IconFileName: {app}\therion.exe; Check: TherionTcl 
;Name: "{group}\The Therion Book"; Filename: "{app}\thbook.pdf" 
Name: {group}\Uninstall Therion; Filename: {uninstallexe} 
[Registry] 
Root: HKCR; Subkey: .th; ValueType: string; ValueName: ; ValueData: TherionFile; Flags: uninsdeletevalue 
Root: HKCR; Subkey: .th2; ValueType: string; ValueName: ; ValueData: TherionFile; Flags: uninsdeletevalue 
Root: HKCR; Subkey: .thm; ValueType: string; ValueName: ; ValueData: TherionFile; Flags: uninsdeletevalue 
Root: HKCR; Subkey: TherionFile; ValueType: string; ValueName: ; ValueData: Therion data file; Flags: uninsdeletekey 
Root: HKCR; Subkey: TherionFile\DefaultIcon; ValueType: string; ValueName: ; ValueData: {app}\therion.exe,0 
Root: HKCR; Subkey: TherionFile\shell\open\command; ValueType: string; ValueName: ; ValueData: """{app}\bin\wish.exe"" ""{app}\xtherion.tcl"" ""%1"""; Check: TherionTcl 
Root: HKCR; Subkey: TherionFile\shell\open\command; ValueType: string; ValueName: ; ValueData: """{app}\xtherion.tcl"" ""%1"""; Check: NoTherionTcl 
Root: HKLM; Subkey: SOFTWARE\Therion; ValueType: string; ValueName: InstallPath; ValueData: {app}; Flags: uninsdeletekey 
Root: HKLM; Subkey: SOFTWARE\Therion; ValueType: string; ValueName: TclTk; ValueData: 1; Components: tcl 
Root: HKLM; Subkey: SOFTWARE\Therion; ValueType: string; ValueName: TeX; ValueData: 1; Components: tex 
 
[Code] 
function TherionTcl(): boolean; 
begin 
  if (pos('tcl',WizardSelectedComponents(false))>0) or (RegValueExists(HKLM,'SOFTWARE\Therion','TclTk')) then 
    Result:=true else Result:=false; 
end; 
 
function NoTherionTcl(): boolean; 
begin 
  Result:=not TherionTcl; 
end; 
 
 
[_ISTool] 
OutputExeFilename=C:\Cave\therion-batteries.exe 
