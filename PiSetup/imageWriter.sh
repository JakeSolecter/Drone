#!/bin/bash
dd if=./result/iso/nixos.iso of=/dev/sd$1 status=progress
sync