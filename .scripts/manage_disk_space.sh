#!/usr/bin/env bash

echo "MANAGE DISK SPACE: before"
df -h
du -sh /opt/*
echo "removing /opt/ghc"
rm -rf /opt/ghc
echo "MANAGE DISK SPACE: after"
df -h
