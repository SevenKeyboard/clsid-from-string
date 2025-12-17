#Requires AutoHotkey v2.0.0+
;==============================================================
; clsidFromString — Convert a GUID/CLSID string to a 16-byte CLSID buffer
;
; GitHub: https://github.com/SevenKeyboard/clsid-from-string
; Author: SevenKeyboard Ltd. (2025)
; License: The Unlicense
;==============================================================
class VersionManager_clsidFromString
{
    static _ := this._init()
    static _init()    {
        global
        CLSIDFROMSTRING_VERSION := "1.0.0"
    }
}
clsidFromString(str, &CLSID)    {
    static NOERROR:=0, CO_E_CLASSSTRING:=0x800401F3
    CLSID:=buffer(16,0)
    ret:=dllCall("Ole32.dll\CLSIDFromString", "WStr",str, "Ptr",CLSID.Ptr, "Int")
    return (ret==NOERROR)
}