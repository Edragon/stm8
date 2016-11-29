ST-LinkUpgrade.exe v2.1:

- On ST-Link, upgrade firmware to version V1J12S3:
  * modifications for SWD communication (STM32)
  
- On ST-Link/V2, upgrade firmware to V2J14S3:
  * Added command for target hardware reset
  * Added command for target voltage measurement
  * Added SWV commands
  
This version uses STLinkUSBDriver.dll v4.2.2.0 which requires the
Winusb Microsoft driver to be installed (which is not the case, by
default, on Windows XP).
A dedicated setup (STLinkV2USBDriver.exe) is published for installing
this driver on XP. This driver is also installed by the STToolset setup
from pack24 version.
 

