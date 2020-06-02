
Switch on HDMI cec in Your device

```
settings put global hdmi_control_enabled 1 

#if you want, you can also enable this self-explanatory command
settings put global hdmi_control_auto_wakeup_enabled 1 

#and this
settings put global hdmi_control_auto_device_off_enabled 1
```


Switch on HDMI-CEC in Your TV:



    AOC: E-link
    Hitachi: HDMI-CEC (Thank you, Hitachi!)
    LG: SimpLink or SIMPLINK (HDMI-CEC)
    Mitsubishi: NetCommand for HDMI
    Onkyo: RIHD (Remote Interactive over HDMI)
    Panasonic: HDAVI Control, EZ-Sync, or VIERA Link
    Philips: EasyLink
    Pioneer: Kuro Link
    Runco International: RuncoLink
    Samsung: Anynet+ (Menu->System->Anynet)
    Sharp: Aquos Link
    Sony: BRAVIA Sync
    Toshiba: CE-Link or Regza Link
    Vizio: CEC (Thank you, Vizio!)

   
Search for devices - should detect Your tvbox

#@refs:http://www.cec-o-matic.com/,
#@refs:https://github.com/Pulse-Eight/libcec

#@refs:https://stackoverflow.com/questions/47892639/hdmi-cec-on-android


#turn on tv
echo 0x40 0x04 > /sys/class/cec/cmd

echo 0x40 0x36 > /sys/class/cec/cmd

echo 0x40 0x83 > /sys/class/cec/cmd

#change input source to HDMI 1
echo 0x4F 0x82 0x10 0x00 > /sys/class/cec/cmd

#change input source to HDMI 3
echo 0x4F 0x82 0x30 0x00 > /sys/class/cec/cmd
    
#@refs:https://stackoverflow.com/questions/29670275/android-send-hdmi-cec-commands-to-tv-minix-libcec

Send a request for connected device's power status
echo 0x40 0x8F > /sys/class/cec/cmd
    
    
"Active Source" - 0x82
"Image View On" - 0x04
"Text View On" - 0x0D
"Inactive Source" - 0x9D
"Request Active Source" - 0x85
"Routing Change" - 0x80
"Routing Information" - 0x81
"Set Stream Path" - 0x86
"Standby" - 0x36
"Record Off" - 0x0B
"Record On" - 0x09
"Record Status" - 0x0A
"Record TV Screen" - 0x0F
"Clear Analogue Timer" - 0x33
"Clear Digital Timer" - 0x99
"Clear External Timer" - 0xA1
"Set Analogue Timer" - 0x34
"Set Digital Timer" - 0x97
"Set External Timer" - 0xA2
"Set Timer Programme Title" - 0x67
"Timer Cleared Status" - 0x43
"Timer Status" - 0x35
"CEC Version" - 0x9E
"Get CEC Version" - 0x9F
"Give Physical Address" - 0x83
"Get Menu Language" - 0x91
"Report Physical Address" - 0x84
"Set Menu Language" - 0x32
"Deck Control" - 0x42
"Deck Status" - 0x1B
"Give Deck Status" - 0x1A
"Play" - 0x41
"Give Tuner Device Status" - 0x08
"Select Analogue Service" - 0x92
"Select Digital Service" - 0x93
"Tuner Device Status" - 0x07
"Tuner Step Decrement" - 0x06
"Tuner Step Increment" - 0x05
"Device Vendor ID" - 0x87
"Give Device Vendor ID" - 0x8C
"Vendor Command" - 0x89
"Vendor Command With ID" - 0xA0
"Vendor Remote Button Down" - 0x8A
"Vendor Remote Button Up" - 0x8B
"Set OSD String" - 0x64
"Give OSD Name" - 0x46    
"Set OSD Name" - 0x47
"Menu Request" - 0x8D
"Menu Status" - 0x8E
"User Control Pressed" - 0x44
"User Control Released" - 0x45
"Give Device Power Status" - 0x8F
"Report Power Status" - 0x90
"Feature Abort" - 0x00
"Abort" - 0xFF
"Give Audio Status" - 0x71
"Give System Audio Mode Status" - 0x7E
"Report Audio Status" - 0x7A
"Report Short Audio Descriptor" - 0xA3
"Request Short Audio Descriptor" - 0xA4
"Set System Audio Mode" - 0x72
"System Audio Mode Request" - 0x70
"System Audio Mode Status" - 0x7E
"Set Audio Rate" - 0x9A
"Initiate ARC" - 0xC0
"Report ARC Initiated" - 0xC1
"Report ARC Terminated" - 0xC2
"Request ARC Initiation" - 0xC3
"Request ARC Termination" - 0xC4
"Terminate ARC" - 0xC5
"CDC Message" - 0xF8    
    