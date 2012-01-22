; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;    File: cape_xy.ncl
; Created: Thursday, January 19 2012
; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>
;

; Description:
;

load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"
load "./conf.ncl"

begin
  a = addfile(infile , "r")
  ofile = ofile_prefix + "cape_xy"

  ;; output file reads from graphic
  wks = gsn_open_wks(graphic_type,ofile)


end
;;; cape_xy.ncl ends here
