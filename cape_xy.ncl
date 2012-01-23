; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;    File: cape_xy.ncl
; Created: Thursday, January 19 2012
; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>
;

; Description:
;

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

load "$VISWRF/dict_xy.ncl"     ; default setup for xy plot


;;
load "./conf.ncl"               ; CUSTOMIZE HERE

plotid = "cape"
tvals = -1

begin

;;--------------------------------------------------------------------
; IO setup
  a = addfile(infile , "r")
  ofile = ofile_prefix + "cape_xy"

;;--------------------------------------------------------------------
; time setup

  if ( tvals .eq. -1 ) then
    times  = wrf_user_list_times(a)  ; get times in the file
  end if
  nt  = dimsizes(times)         ; number of times in the file

;;----------------------- graphic mode --------------------------------
  wks = gsn_open_wks(graphic_type,ofile)
  gsn_define_colormap(wks,"WhViBlGrYeOrReWh")

;;--------------------------------------------------------------------
; Initial resources esources
  res = True
  opts = res
  mpres  = True  ; Map resources
  pltres = True ; Plot resources

  opts@Footer = False
  opts@InitTime = False

;;--------------------------------------------------------------------
; initialize graph
  plot = new(nt,graphic)


;;--------------- grab the fields defined in the dictionary -----------
  varname = varname@$plotid$
  lev = lev@$varname$
  clevs = clevs@$varname$
  dclevs = dclevs@$varname$

;;--------------------- cape calculation -----------------------------
  if ( varname .eq. "cape" ) then

    do it = 0, nt, 5   ;; time loop

      ;; hint what time
      print("Working on time: " + times(it))

      ;;-- calcualtion  --
      cape  = wrf_user_getvar(a,"cape_2d",it) ; cape retrieve

      res@TimeLabel = times(it)   ; Set Valid time to use on plots
      res@gsnSpreadColors = True    ;spread Colors

      opts@cnFillOn         = True
      opts@cnFillColor = True

;      printVarSummary(cape)

;      opts@ContourParameters = (/ 0., 2.6, .02 /)

     contour = wrf_contour(a,wks,cape(1,:,:),opts)
     plot = wrf_map_overlays(a,wks,(/contour/),pltres,mpres)

    end do

  end if ;;-- cape  --



end
;;; cape_xy.ncl ends here
