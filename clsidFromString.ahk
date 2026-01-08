#Requires AutoHotkey v1.1.0+
;==============================================================
; clsidFromString — Convert a GUID/CLSID string to a 16-byte CLSID buffer
;
; GitHub: https://github.com/SevenKeyboard/clsid-from-string
; Author: SevenKeyboard Ltd. (2025)
; License: The Unlicense
;==============================================================
class VersionManager_clsidFromString
{
    static _ := VersionManager_clsidFromString._init()
    _init()    {
        global
        CLSIDFROMSTRING_VERSION := "1.0.0"
    }
}
clsidFromString(str, byRef clsid)    {
    local
    static NOERROR := 0, CO_E_CLASSSTRING := 0x800401F3
    varSetCapacity(clsid,16,0)
    hr := dllCall("Ole32.dll\CLSIDFromString", "WStr",str, "Ptr",&clsid, "Int")
    return (hr == NOERROR)
}