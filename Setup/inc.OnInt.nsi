	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "SVPlayerInstallerMutex")  i .r1 ?e'
	Pop $R0

	StrCmp $R0 0 texsit
	  MessageBox MB_OK|MB_ICONEXCLAMATION "另一个安装程序已经在运行中了！"
	  Abort

   texsit:
   
  ;   !insertmacro MUI_LANGDLL_DISPLAY


System::Call 'kernel32::GetSystemDefaultLangID(i v)i .R7'
IntOp $R7 $R7 & 0xFFFF

Push "射手播放器"
Pop $SoftwareName

Push "射手影音播放器"
Pop $ProgrameFolder

Push "射手影音"
Pop $LinkName

IntCmp $R7 0x1004 chn 
IntCmp $R7 0x1404 tchn
IntCmp $R7 0x0c04 tchn 
IntCmp $R7 0x0404 tchn 
IntCmp $R7 0x0804 chn 
Goto Eng
chn:

 Push 2052
 Pop $LANGUAGE 
	
	Push "$SoftwareName 安装程序"
	Pop $SoftwareCaption

  Goto done
tchn:
	Push 1028
 	Pop $LANGUAGE 
 	Push "$SoftwareName 安裝程式"
	Pop $SoftwareCaption
	 Goto done
eng:
 Push 1033
 Pop $LANGUAGE 
 
 Push "SPlayer"
 Pop $SoftwareName
 
 Push "Setup $SoftwareName"
	Pop $SoftwareCaption

	Push "SPlayer"
	Pop $ProgrameFolder
	
	Push "SPlayer"
	Pop $LinkName

SectionSetText ${ResetSettingSec} "Reset Setting"
SectionSetText ${OtherSec} "Other"
SectionSetText ${ProgramMenuSec} "Program Menu"
SectionSetText ${DesctopShortCutSec} "Decktop Shortcut"
SectionSetText ${QuickLunchSec} "Quick Lunch"

SectionSetText ${ExtraCodecSec} "Extra Codec"
SectionSetText ${coreavc} "Misc."

SectionSetFlags  ${coreavc} SF_PSELECTED

 
  Goto done

done:


