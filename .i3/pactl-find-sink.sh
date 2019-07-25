#!/bin/sh
# Find correct Bluetooth Headset Sink for i3 - Volume Control

current=$(pactl list short sinks | grep RUNNING | cut -f1)

if [ "$1" == "-m" ]
then
    exec pactl set-sink-volume $current -5%
elif [ "$1" == "-p" ]
then
    exec pactl set-sink-volume $current +5%
else
    exec pactl set-sink-mute $current toggle
fi
