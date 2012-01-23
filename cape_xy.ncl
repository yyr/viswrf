; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;    File: cape_xy.ncl
; Created: Thursday, January 19 2012
; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>
;

; Description:
;

load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"
load "$VISWRF/dict_xy.ncl"     ; default setup for xy plot


;;
load "./conf.ncl"               ; CUSTOMIZE HERE

plotid = "cape"

begin

  a = addfile(infile , "r")
  ofile = ofile_prefix + "cape_xy"

;;----------------------- graphic mode --------------------------------
  wks = gsn_open_wks(graphic_type,ofile)
  gsn_define_colormap(wks,"WhViBlGrYeOrReWh")

  varname = varname@$plotid$


;;--------------------- cape calculation -----------------------------
  if ( varname .eq. cape ) then
    lev = lev@$varname$
    print(lev)

  end if

end
;;; cape_xy.ncl ends here
