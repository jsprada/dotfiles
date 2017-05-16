#!/usr/bin/env python3
# coding: utf-8

from sys import argv
import dbus


def kb_light_set(delta):
    bus = dbus.SystemBus()
    kbd_backlight_proxy = bus.get_object('org.freedesktop.UPower', '/org/freedesktop/UPower/KbdBacklight')
    kbd_backlight = dbus.Interface(kbd_backlight_proxy, 'org.freedesktop.UPower.KbdBacklight')

    current = round(kbd_backlight.GetBrightness(),0)
    maximum = kbd_backlight.GetMaxBrightness()
    new = current + delta

    if 0 <= new <= maximum:
        current = new
        kbd_backlight.SetBrightness(current)

    # Return current backlight level percentage
    return current

if __name__ == '__main__':
    increment=25
    if len(argv[1:]) == 1:
        if argv[1] == "--up" or argv[1] == "+":
            # ./kb-light.py (+|--up) to increment
            print(kb_light_set(increment))
        elif argv[1] == "--down" or argv[1] == "-":
            # ./kb-light.py (-|--down) to decrement
            print(kb_light_set(-increment))
        else:
            print("Unknown argument:", argv[1])
    else:
        print("Script takes exactly one argument.", len(argv[1:]), "arguments provided.")