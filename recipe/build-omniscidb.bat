@echo on

mkdir "%SRC_DIR%"\build
pushd "%SRC_DIR%"\build

COPY %PREFIX%\Library\lib\thriftmd.lib %PREFIX%\Library\bin\thriftmd.lib

cmake -G "NMake Makefiles" ^
      -DCMAKE_INSTALL_PREFIX=%PREFIX% ^
      -DCMAKE_PREFIX_PATH=%PREFIX% ^
      -DCMAKE_LIBRARY_PATH=%PREFIX%\Library\lib ^
      -DCMAKE_INCLUDE_PATH=%PREFIX%\Library\include ^
      -DLibArchive_INCLUDE_DIR=%PREFIX\include ^
      -DLibArchive_LIBRARY=%PREFIX%\Library\lib\archive.lib ^
      -DLZMA_LIBRARY=%PREFIX%\Library\lib\liblzma.lib ^
      -DBZ2_LIBRARY=%PREFIX%\Library\lib\libbz2.lib ^
      -DENABLE_FOLLY:BOOL=OFF ^
      -DENABLE_TESTS:BOOL=OFF ^
      -DENABLE_CUDA:BOOL=OFF ^
      -DENABLE_GEOS:BOOL=OFF ^
      -DENABLE_FSI_ODBC:BOOL=OFF ^
      -DENABLE_AWS_S3:BOOL=OFF ^
      -DENABLE_LDAP:BOOL=OFF ^
      -DMAPD_EDITION:STRING=EE ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DBoost_NO_BOOST_CMAKE:BOOL=OFF ^
      ..
if errorlevel 1 exit 1

cmake --build . --target install --config Release
if errorlevel 1 exit 1

popd