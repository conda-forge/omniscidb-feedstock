@echo on

mkdir "%SRC_DIR%"\build
pushd "%SRC_DIR%"\build

COPY %CONDA_PREFIX%\Library\lib\thriftmd.lib %CONDA_PREFIX%\Library\bin\thriftmd.lib

cmake -G "Ninja" ^
      -DCMAKE_PREFIX_PATH=%CONDA_PREFIX% ^
      -DCMAKE_LIBRARY_PATH=%CONDA_PREFIX%\Library\lib ^
      -DCMAKE_INCLUDE_PATH=%CONDA_PREFIX%\Library\include ^
      -DCMAKE_C_COMPILER=cl.exe ^
      -DCMAKE_CXX_COMPILER=cl.exe ^
      -DENABLE_FOLLY:BOOL=OFF ^
      -DENABLE_TESTS:BOOL=OFF ^
      -DENABLE_CUDA:BOOL=OFF ^
      -DENABLE_GEOS:BOOL=OFF ^
      -DENABLE_FSI_ODBC:BOOL=OFF ^
      -DENABLE_AWS_S3:BOOL=OFF ^
      -DENABLE_LDAP:BOOL=OFF ^
      -DENABLE_CUDA:BOOL=OFF ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DBoost_NO_BOOST_CMAKE:BOOL=OFF ^
      ..
if errorlevel 1 exit 1

cmake --build . --target install --config Release
if errorlevel 1 exit 1

popd