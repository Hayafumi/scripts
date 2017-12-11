#!/bin/bash

if mpc status | grep -q "playing"; then
	mpc pause
else
	mpc play
fi