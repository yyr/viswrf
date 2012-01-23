; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;    File: dict_xy.ncl
; Created: Monday, January 23 2012
; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>
;

; Description:
;
begin
  varname = ""
  varname_y = ""
  lev = 0
  nclev = 30
  clevs = new(nclev, float)
;  dclevs = clevs


  varname@cape = "cape"
  lev@cape = 0
  clevs@cape = fspan(-0.1, .3, nclev)

  varname@diffp = "diffp"
  lev@diffp = 0
  clevs@diffp = fspan(165.,180.,nclev)

  varname@zave_wind = "zave_wind"
  lev@zave_wind = 0
  clevs@zave_wind = fspan(165.,180.,nclev)


  varname@moist_tr = "moist_tr"
  lev@moist_tr = 0
  clevs@moist_tr = fspan(165.,180.,nclev)

end

;;; dict_xy.ncl ends here
