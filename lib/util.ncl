; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;    File: util.ncl
; Created: Monday, March  5 2012
; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>
;

; Description:
; these are the utils written for viswrf

;;--------------------------------------------------------------------
; some procedures
;---------------------------------------------------------------------
; procedure: plot_xy_set_con_att
; Doc: sets contour plot con_attributes
; op = resources
;     cl array of levels
;---------------------------------------------------------------------
undef("plot_xy_set_con_att")
procedure plot_xy_set_con_att(op:logical,cl,tit:string)
local op, cl,tit

begin
  op@gsnSpreadColors = True    ;spread Colors
  op@cnFillOn = True
  op@cnLevelSelectionMode = "ExplicitLevels"
  op@cnLinesOn = False
  op@Footer = False
  op@InitTime = False

  op@FieldTitle = tit       ; overwrite Field Title
  op@cnLevels = cl

  return
end
;- |plot_xy_set_con_att| ends here --

;---------------------------------------------------------------------
; procedure: plot_xy_set_map_att
; Doc:
;---------------------------------------------------------------------
undef("plot_xy_set_map_att")
procedure plot_xy_set_map_att(mp:logical)
local mp, tmp

begin

  mp@mpDataBaseVersion    = "HighRes"
  mp@mpGeophysicalLineThicknessF = 2.0
  mp@pmTickMarkDisplayMode = "Always"

  mp@mpGeophysicalLineColor      = "Black"
  mp@mpGridLineColor             = "Black"
  mp@mpLimbLineColor             = "Black"
  mp@mpNationalLineColor         = "Black"
  mp@mpPerimLineColor            = "Black"

  return
end
;- |plot_xy_set_map_att| ends here --

;---------------------------------------------------------------------
; procedure: plot_xy_set_vec_att
; Doc:
;---------------------------------------------------------------------
undef("plot_xy_set_vec_att")
procedure plot_xy_set_vec_att(vec:logical,vl)
local vec, vl

begin

  vec@FieldTitle = "Wind"       ; overwrite Field Title
  vec@InitTime = False
  vec@vcGlyphStyle = "LineArrow"
  vec@vcMonoLineArrowColor = False
  vec@gsnSpreadColors     = True      ; use full colormap
  vec@vcGlyphStyle        = "CurlyVector"    ; turn on curly vectors

  return
end
;- |plot_xy_set_vec_att| ends here --

;---------------------------------------------------------------------
; procedure: plot_xy_set_plt_att
; Doc:
;---------------------------------------------------------------------
undef("plot_xy_set_plt_att")
procedure plot_xy_set_plt_att(plt:logical,tit:string)
local plt,tit

begin
  plt@MainTitlePos= tit

  return
end
;- |plot_xy_set_plt_att| ends here --


;;; util.ncl ends here
