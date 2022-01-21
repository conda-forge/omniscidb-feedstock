@echo on

mkdir "%SRC_DIR%"\build
pushd "%SRC_DIR%"\build

COPY %PREFIX%\Library\lib\thriftmd.lib %PREFIX%\Library\bin\thriftmd.lib

cmake -G "Ninja" ^
      -DCMAKE_INSTALL_PREFIX=%PREFIX% ^
      -DCMAKE_PREFIX_PATH=%PREFIX% ^
      -DCMAKE_LIBRARY_PATH=%PREFIX%\Library\lib ^
      -DCMAKE_INCLUDE_PATH=%PREFIX%\Library\include ^
      -DLibArchive_INCLUDE_DIR=%PREFIX\include ^
      -DLibArchive_LIBRARY=%PREFIX%\Library\lib\archive.lib ^
      -DLZMA_LIBRARY=%PREFIX%\Library\lib\liblzma.lib ^
      -DBZ2_LIBRARY=%PREFIX%\Library\lib\libbz2.lib ^
      -DENABLE_FOLLY=OFF ^
      -DENABLE_TESTS=OFF ^
      -DENABLE_CUDA=OFF ^
      -DENABLE_GEOS=OFF ^
      -DENABLE_FSI_ODBC=OFF ^
      -DENABLE_AWS_S3=OFF ^
      -DENABLE_LDAP=OFF ^
      -DMAPD_EDITION=EE ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DBoost_NO_BOOST_CMAKE=OFF ^
      "%SRC_DIR%"
if errorlevel 1 exit 1

@REM cmake --build . --target install --config Release
ninja
if errorlevel 1 exit 1

popd