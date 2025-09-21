#!/bin/bash
echo "Resetting NVIDIA driver..."
rmmod nvidia_uvm nvidia_drm nvidia_modeset nvidia 2>/dev/null
sleep 2
modprobe nvidia nvidia_modeset nvidia_drm nvidia_uvm
sleep 3
nvidia-smi > /dev/null
echo "GPU reset complete"
