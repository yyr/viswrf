; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;    File: plot_xy.ncl
; Created: Thursday, January 19 2012
; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>
;

; Description:
;

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"
load "$VISWRF/lib/util.ncl"     ; default setup for xy plot

load "$VISWRF/dict_xy.ncl"     ; default setup for xy plot
load "./conf.ncl"               ; CUSTOMIZE HERE
load "$TMP/tmp_conf.ncl"             ; for command line options

;; should be sent to conf.ncl
;; time for all
; tsvals

begin
;;--------------------------------------------------------------------
; IO setup
  a = addfile(infile , "r")
  ofile = ofile_prefix + "_" + plotid + "_xy"

;;--------------------------------------------------------------------
; time setup

  if ( tvals .eq. -1 ) then
    times  = wrf_user_list_times(a)  ; get times in the file
  end if
  nt  = dimsizes(times)         ; number of times in the file

;;----------------------- graphic mode --------------------------------
  wks = gsn_open_wks(graphic_type,ofile)

;;--------------------------------------------------------------------
; Initial resources esources
  res = True
  opts = res
  pltres = True ; Plot resources
  mpres  = True  ; Map resources

  plot_xy_set_map_att(mpres)

;;--------------------------------------------------------------------
; initialize graph
  plot = new(nt,graphic)

;;--------------- grab the fields defined in the dictionary -----------
  varname = varname@$plotid$
  lev = lev@$varname$
  clevs = clevs@$varname$

;;--------------------- cape calculation -----------------------------
  if ( varname .eq. "cape" ) then

    gsn_define_colormap(wks,"WhiteYellowOrangeRed")
    do it = 40, nt, 2   ;; time loop

      ;; hint what time
      print("Working on time: " + times(it))

      ;;-- calcualtion  --
      cape  = wrf_user_getvar(a,"cape_2d",it) ; cape retrieve

      opts@TimeLabel = times(it)   ; Set Valid time to use on plots
      plot_xy_set_con_att(opts,clevs,"CAPE")

      contour = wrf_contour(a,wks,cape(1,:,:),opts)
      plot = wrf_map_overlays(a,wks,(/contour/),pltres,mpres)

    end do

  end if ;;-- cape  --

;;--------------------- diffp -----------------------------
  if ( varname .eq. "diffp" ) then

    do it = 40, nt, 2   ;; time loop

      ;; hint what time
      print("Working on time: " + times(it))

      ;;-- calcualtion  --
      slp = wrf_user_getvar(a,"slp",it)
      p  = wrf_user_getvar(a, "pressure",it) ; pressure is our vertical coordinate
      z  = wrf_user_getvar(a, "z",it)        ; grid point height
      p_top_level  = wrf_user_intrp3d( p,z,"h",diffp_top_level,0.,False)
      p_diff = slp - p_top_level

      opts@TimeLabel = times(it)   ; Set Valid time to use on plots
      plot_xy_set_con_att(opts,clevs,"Diff_p")

      title = "CAPE" + stringtochar(times(it))
      plot_xy_set_plt_att(pltres,title)

      contour = wrf_contour(a,wks,p_diff,opts)
      plot = wrf_map_overlays(a,wks,(/contour/),pltres,mpres)

    end do

  end if ;;-- diffp  --

;;--------------------- zave_wind -----------------------------

  if ( varname .eq. "zave_wind" ) then

    do it = 40, nt, 2   ;; time loop

      ;; hint what time
      print("Working on time: " + times(it))

      ;;-- calcualtion  --
      u = wrf_user_getvar(a,"ua",it) ; at mass point
      v = wrf_user_getvar(a,"va",it) ; at mass point

      u_lev_sum = u(1,:,:)      ;first level
      v_lev_sum = v(1,:,:)

      do le = 1, zave_wind_top_lev - 1 , 1 ;; level loop from 2 level
        u_lev_sum = u_lev_sum + u(le,:,:)
        v_lev_sum = v_lev_sum + v(le,:,:)
      end do

      u_lev_sum = u_lev_sum / zave_wind_top_lev
      v_lev_sum = v_lev_sum / zave_wind_top_lev

      mpres@mpFillColors  = (/"background","DeepSkyBlue","ForestGreen","DeepSkyBlue", "transparent"/)

      opts@TimeLabel = times(it)   ; Set Valid time to use on plots
      plot_xy_set_vec_att(opts,clevs)

      vector = wrf_vector(a,wks,u_lev_sum(:,:),v_lev_sum(:,:),opts)
      plot(it) = wrf_map_overlays(a,wks,(/vector/),pltres,mpres)

      delete(vector)

    end do

  end if ;;-- diffp  --

end
;;; plot_xy.ncl ends here
