#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib/hw/camera.sdm660.so)
            "${PATCHELF}" --replace-needed "libminikin.so" "libminikin-v28.so" "${2}"
            ;;
        vendor/lib/libarcsoft_beauty_shot.so)
            "${PATCHELF}" --remove-needed "libandroid.so" "${2}"
            ;;
        vendor/lib/libFaceGrade.so)
            "${PATCHELF}" --remove-needed "libandroid.so" "${2}"
            ;;
        vendor/lib/libMiCameraHal.so)
            "${PATCHELF}" --replace-needed "libicuuc.so" "libicuuc-v28.so" "${2}"
            "${PATCHELF}" --replace-needed "libminikin.so" "libminikin-v28.so" "${2}"
            ;;
        vendor/lib/libicuuc-v28.so)
            "${PATCHELF}" --set-soname "libicuuc-v28.so" "${2}"
            ;;
        vendor/lib/libminikin-v28.so)
            "${PATCHELF}" --set-soname "libminikin-v28.so" "${2}"
            ;;
        vendor/lib/libmmcamera2_stats_modules.so)
            "${PATCHELF}" --remove-needed "libandroid.so" "${2}"
            "${PATCHELF}" --remove-needed "libgui.so" "${2}"
            ;;
        vendor/lib/libmmcamera_jason_s5k3p8sp_sunny.so)
            sed -i 's/\x1e\x40\x9a\x99\x99\x99\x99\x99\x3b\x40\x10/\x1e\x40\x9a\x99\x99\x99\x99\x99\x3b\x40\x01/' "${2}"
            ;;
        vendor/lib/libmmcamera_ppeiscore.so)
            "${PATCHELF}" --remove-needed "libgui.so" "${2}"
            ;;
        vendor/lib/libmpbase.so)
            "${PATCHELF}" --remove-needed "libandroid.so" "${2}"
            ;;
        vendor/lib/libVDClearShot.so)
            "${PATCHELF}" --remove-needed "libandroid.so" "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=jason
export DEVICE_COMMON=sdm660-common
export VENDOR=xiaomi

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
