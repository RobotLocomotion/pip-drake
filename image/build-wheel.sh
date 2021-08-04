#!/bin/bash -e

DRAKE_VERSION=0.32.0

cd /

git clone https://github.com/robotlocomotion/drake

cd /drake

git apply < /image/pip-drake.patch

bazel run \
    --define NO_CLP=ON \
    --define NO_IPOPT=ON \
    --define NO_DREAL=ON \
    //:install -- /opt/drake

mkdir -p /build-wheel/pydrake

# copy libraries
mkdir -p /build-wheel/pydrake/lib
cp -r /opt/drake-dependencies/lib/lib*.so* /build-wheel/pydrake/lib
cp -r /opt/drake/lib/lib*.so /build-wheel/pydrake/lib

# copy pydrake subdirectory
cp -r /opt/drake/lib/python*/site-packages/pydrake /build-wheel

# copy other files
cp -r /opt/drake/share/doc /build-wheel/pydrake

cp -r /opt/drake/share/drake/.drake-find_resource-sentinel /build-wheel/pydrake

cp -r /opt/drake/share/drake/examples /build-wheel/pydrake

cp -r /opt/drake/share/drake/manipulation /build-wheel/pydrake

# copy setup.py
cp /image/setup.py /build-wheel

# set LD_LIBRARY_PATH
LD_LIBRARY_PATH=/build-wheel/pydrake
export LD_LIBRARY_PATH

# Navigate to temporary directory
cd /build-wheel

# Build the wheel
python3 setup.py bdist_wheel

# Fixup wheel
auditwheel repair dist/pydrake-${DRAKE_VERSION}-py3-none-any.whl
