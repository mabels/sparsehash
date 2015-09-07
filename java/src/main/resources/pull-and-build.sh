#!/bin/sh

BASEDIR=$1
TARGET=$1/target/cpp
ARCH=$2
if [ ! -f $TARGET/build ]
then
  rm -rf $TARGET
  mkdir -p $TARGET
  git clone https://github.com/mabels/sparsehash $TARGET
  rm -rf $TARGET/../classes/sparsehash/$ARCH
  mkdir -p $TARGET/../classes/sparsehash/$ARCH
  cd $TARGET && ./configure --prefix=$TARGET/../classes/sparsehash/$ARCH && make && make install
  touch $TARGET/build
fi
