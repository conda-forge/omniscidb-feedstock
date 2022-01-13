@echo on

mkdir "%SRC_DIR%"\build
pushd "%SRC_DIR%"\build

cmake -G "NMake Makefiles" ^
      -DENABLE_FOLLY:BOOL=OFF ^
      -DENABLE_TESTS:BOOL=OFF ^
      -DENABLE_CUDA:BOOL=OFF ^
      -DENABLE_GEOS:BOOL=OFF ^
      -DENABLE_AWS_S3:BOOL=OFF ^
      -DCMAKE_BUILD_TYPE=Release ^
      ..
if errorlevel 1 exit 1

cmake --build . --target install --config Release
if errorlevel 1 exit 1

popd