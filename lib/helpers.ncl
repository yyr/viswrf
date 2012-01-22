; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;    File: helpers.ncl
; Created: Monday, January 23 2012
; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>
;

; Description:
;

;---------------------------------------------------------------------
; Fuction: announce
; Doc: just announces stdout what ever given with print statement
;---------------------------------------------------------------------
undef("announce")
procedure announce(var_in:string)
local str,var_in
begin
  str = var_in
  system("echo")
  system("echo ===========================================================")
  print(str + "")
  system("echo ===========================================================")

end
;- "announce" ends here --


;;; helpers.ncl ends here
