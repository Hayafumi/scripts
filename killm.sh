#!/bin/bash

while pstree -p | grep -q "$1"; do
	kill "$(pstree -p | grep "$1" | grep -o -E '[0-9]+' | head -1)"
done