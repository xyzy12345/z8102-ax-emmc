# z8102-ax-emmc

OpenWrt build configuration for ZBT-Z8102AX-V2 device with eMMC storage support.

## Build Configuration

The build configuration is optimized for the MediaTek MT7981 platform with the following features:

- **Device Support**: ZBT-Z8102AX-V2 with eMMC storage
- **WiFi**: MT7915E driver support
- **USB**: USB 3.0 and USB storage support
- **Modem Support**: 
  - Standard USB modem protocols (QMI, MBIM, NCM)
  - Serial drivers for Qualcomm-based modems
  - Management tools (umbim, uqmi, comgt, usb-modeswitch)
- **Web Interface**: LuCI with SSL support and modem protocol handlers

## Known Issues and Fixes

### Package Availability

Some specialized packages are not available in the standard OpenWrt repository and have been commented out in the configuration:

- `quectel-CM`: Quectel Connection Manager (requires external feed)
- `quectel-CM-5G`: 5G Connection Manager (requires external feed)
- `luci-app-modem`: Modem management web interface (not in standard repository)

The build uses standard OpenWrt packages for modem connectivity, which provide equivalent functionality for most use cases.

### dnsmasq Package Conflict (Fixed)

The base `dnsmasq` package conflicts with `dnsmasq-full` as they provide the same files. The configuration explicitly disables the base `dnsmasq` package with `# CONFIG_PACKAGE_dnsmasq is not set` to ensure only `dnsmasq-full` is installed.

## Building

The build is automated via GitHub Actions. See `.github/workflows/build-generic-bl2.yml` for the complete build process.