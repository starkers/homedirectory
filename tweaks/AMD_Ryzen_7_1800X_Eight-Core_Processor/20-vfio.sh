#!/usr/bin/env bash
UPDATE_INITRD=0

VFIO_OPTS="options vfio-pci ids=1022:1455,1002:67df,1002:aaf0"

function set_modprobe(){
  echo "setting /etc/modprobe.d/vfio.conf"
  echo "${VFIO_OPTS}" | sudo tee /etc/modprobe.d/vfio.conf
  export UPDATE_INITRD=1
}

if [ -f /etc/modprobe.d/vfio.conf ]; then
  if ! grep -q "${VFIO_OPTS}" /etc/modprobe.d/vfio.conf ; then
    set_modprobe
  fi
else
  set_modprobe
fi




function set_modules(){
  local ADD="${1}"
  local EXISTING="${2}"
  local FILE="${3}"

  sudo sed -i "s+${EXISTING}+#${EXISTING}+g" "${FILE}"
  printf "MODULES=\"dm_mod dm_crypt ext4 aes_x86_64 sha256 sha512 ${STRING}\"" | sudo tee -a "${FILE}"
}

DATA="$(grep "MODULES=" /etc/mkinitcpio.conf|tail -1)"
# echo "DATA=${DATA}"


STRING="vfio_pci vfio vfio_iommu_type1 vfio_virqfd"
if ! grep -q "${STRING}" <<<"${DATA}" ; then
  echo "$0: vfio modules not added to mkinitcpio.conf"
  sudo cp -p /etc/mkinitcpio.conf /etc/mkinitcpio.conf."$(date +%Y-%m-%d_%H%M%S)"
  set_modules "${STRING}" "${DATA}" /etc/mkinitcpio.conf
  echo "$0: WARNING.....  modified /etc/mkinitcpio.conf"
  export UPDATE_INITRD=2
fi


if [ ${UPDATE_INITRD} -gt 0 ]; then
  echo updating initrd
  echo mkinitcpio -g /boot/initramfs-linux.img
  sudo mkinitcpio -g /boot/initramfs-linux.img
fi
