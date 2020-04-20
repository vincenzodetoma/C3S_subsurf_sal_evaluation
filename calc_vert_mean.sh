#!/bin/bash

basedir=/DataArchive/C3S/subsurf_sal
var=so

for (( y=1979;y<=2018;y++ ));do
  mkdir -p ${basedir}/tmp/${y}
  for (( m=1;m<=12;m++ ));do
    d=1
    python vertmean.py ${var} ${y} `printf "%02d" ${m}` ${d}
    d=300
    python vertmean.py ${var} ${y} `printf "%02d" ${m}` ${d}
    d=700
    python vertmean.py ${var} ${y} `printf "%02d" ${m}` ${d}
    d=2000
    python vertmean.py ${var} ${y} `printf "%02d" ${m}` ${d}
    d=6000
    python vertmean.py ${var} ${y} `printf "%02d" ${m}` ${d}
  done
done
d=1
cdo mergetime ${basedir}/tmp/*/${var}_${d}m_ORCA-0.25x0.25_regular_*.nc ${basedir}/Results/${var}_${d}m_ORCA-0.25x0.25_regular_1979_2018.nc
d=300
cdo mergetime ${basedir}/tmp/*/${var}_${d}m_ORCA-0.25x0.25_regular_*.nc ${basedir}/Results/${var}_${d}m_ORCA-0.25x0.25_regular_1979_2018.nc
d=700
cdo mergetime ${basedir}/tmp/*/${var}_${d}m_ORCA-0.25x0.25_regular_*.nc ${basedir}/Results/${var}_${d}m_ORCA-0.25x0.25_regular_1979_2018.nc
d=2000
cdo mergetime ${basedir}/tmp/*/${var}_${d}m_ORCA-0.25x0.25_regular_*.nc ${basedir}/Results/${var}_${d}m_ORCA-0.25x0.25_regular_1979_2018.nc
d=6000
cdo mergetime ${basedir}/tmp/*/${var}_${d}m_ORCA-0.25x0.25_regular_*.nc ${basedir}/Results/${var}_${d}m_ORCA-0.25x0.25_regular_1979_2018.nc


