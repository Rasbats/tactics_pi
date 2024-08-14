# ~~~
# Summary:      Local, non-generic plugin setup
# Copyright (c) 2020-2021 Mike Rossiter
# License:      GPLv3+
# ~~~

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.


# -------- Options ----------

set(OCPN_TEST_REPO
    "mike-rossiter/tactics-alpha"
    CACHE STRING "Default repository for untagged builds"
)

#
#
# -------  Plugin setup --------
#
set(PKG_NAME tactics_pi)
set(PKG_VERSION  3.3.3)
set(PKG_PRERELEASE "")  # Empty, or a tag like 'beta'

set(DISPLAY_NAME tactics)    # Dialogs, installer artifacts, ...
set(PLUGIN_API_NAME tactics) # As of GetCommonName() in plugin API
set(PKG_SUMMARY "Simulate ship movements")
set(PKG_DESCRIPTION [=[
Simulates how a sailing vessel might react in
those conditions.
]=])

set(PKG_AUTHOR "Mike Rossiter")
set(PKG_IS_OPEN_SOURCE "yes")
set(PKG_HOMEPAGE https://github.com/Rasbats/tactics_pi)
set(PKG_INFO_URL https://opencpn.org/OpenCPN/plugins/tactics.html)

set(SRC
    src/tactics_pi.h
    src/tactics_pi.cpp
    src/avg_wind.h
    src/avg_wind.cpp
    src/bearingcompass.cpp
    src/bearingcompass.h
    src/polarcompass.cpp
    src/polarcompass.h
    src/performance.cpp
    src/performance.h
    src/instrument.cpp
    src/instrument.h
    src/iirfilter.h
    src/iirfilter.cpp
    src/compass.cpp
    src/compass.h
    src/dial.cpp
    src/dial.h
    src/gps.cpp
    src/gps.h
    src/rudder_angle.cpp
    src/rudder_angle.h
    src/speedometer.cpp
    src/speedometer.h
    src/wind.cpp
    src/wind.h
    src/depth.cpp
    src/depth.h
    src/clock.cpp
    src/clock.h
    src/icons.cpp
    src/icons.h
    src/wind_history.cpp
    src/wind_history.h
    src/baro_history.cpp
    src/baro_history.h
    src/from_ownship.cpp
    src/from_ownship.h

)

set(PKG_API_LIB api-17)  #  A dir in opencpn-libs/ e. g., api-17 or api-16

macro(late_init)
  # Perform initialization after the PACKAGE_NAME library, compilers
  # and ocpn::api is available.
endmacro ()

macro(add_plugin_libraries)
  # Add libraries required by this plugin
  add_subdirectory("${CMAKE_SOURCE_DIR}/opencpn-libs/nmea0183")
  target_link_libraries(${PACKAGE_NAME} ocpn::nmea0183)

  add_subdirectory("${CMAKE_SOURCE_DIR}/opencpn-libs/tinyxml")
  target_link_libraries(${PACKAGE_NAME} ocpn::tinyxml)

  add_subdirectory("${CMAKE_SOURCE_DIR}/opencpn-libs/wxJSON")
  target_link_libraries(${PACKAGE_NAME} ocpn::wxjson)

  add_subdirectory("${CMAKE_SOURCE_DIR}/opencpn-libs/plugin_dc")
  target_link_libraries(${PACKAGE_NAME} ocpn::plugin-dc)

  add_subdirectory("${CMAKE_SOURCE_DIR}/opencpn-libs/jsoncpp")
  target_link_libraries(${PACKAGE_NAME} ocpn::jsoncpp)

  # The wxsvg library enables SVG overall in the plugin
  add_subdirectory("${CMAKE_SOURCE_DIR}/opencpn-libs/wxsvg")
  target_link_libraries(${PACKAGE_NAME} ocpn::wxsvg)
endmacro ()
