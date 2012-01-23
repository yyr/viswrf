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
    nclev = 20
    clevs = new(nclev, float)
    dclevs = clevs

    varname@cape = "cape"
    lev@cape = 0
    clevs@cape = fspan(-0.1, .3, nclev)
    dclevs@cape = (/-8., -6., -5., -4., -3., -2., -1., 0., \
                     1.,  2.,  3.,  4.,  5.,  6.,  8./)


end

;;; dict_xy.ncl ends here
