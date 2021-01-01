NOTE:
  M.I.B. is running on Harman MHI2(Q) units (MIB 2.x) only.

CAUTION:
  Ensure that a external power is connected to the car or the engine is turned on during any flash or programming process!
  Power failure during flasing/programming will brick your unit.

Prepare SD card:
  Extract all files of the M.I.B. to the root directory of a clean SD-Card (FAT32/NTFS formatted)
  Patched IFS-stage2 images have to be placed on the SD card in the folder /patches
    Pre-patched (CP, FEC and EL) ifs-root-stage2 images can be found for all recent MHI2 FW versions here: https://bit.ly/399r2jy
    Extract the archives with SW-train and MU version as patch name (same as archive name) - e.g. /patches/MHI2_ER_SKG13_P4526_MU1440_PATCH  
    They are already prepared in the right way, so that the tool can use them right away
  In case you want to use your own patches (not recommended) - ask us first to help you:
    For each SW-train a seperate folder is needed e.g. /patches/MHI2_ER_SKG13_P4526_MU1440_PATCH
    The folder has to contain the patched ifs-root-stage2 image with the following naming syntax:
      "MU-version"-ifs-root-part2-"image start address in hex within RCC"-"image length in hex" --> e.g. MU1440-ifs-part2-0x00ba0000-1C06F300.ifs 
      image length is on byte 0x20 position 04-07 in little Endian of the original ifs-root-stage2 image (e.g. fresh from FW update)

Connect to MHI2 and start M.I.B.:
  D-Link - e.g. DUB-E100 HW rev. D1 - USB-Ethernet adapter is required to connect to your MHI2 unit.
  Use Putty/Kitty to connect via UART or Telnet (MIB IP:172.16.250.248) and login into RCC (recommended: port:123) or MMX (port:23).
  Login and password for your units SW train has to be known: https://anonymousfiles.io/xzi8Nq2r/
  Check your SW-train, a pre-patched ifs-root-stage2 has to be present within the folder /patches
  Insert the SD card into slot SD1 of your MHI2 unit and login to the RCC shell:
   # Mount SD card in slot SD1
     mount -uw /net/mmx/fs/sda0/
   # start M.I.B by typing
     /net/mmx/fs/sda0/start

  Default screen seize of Putty/Kitty is often too small to display the M.I.B. menu in full.
  Increase the window seize manually.

You should see (a more colourful) menu with the following content:

******************************************************************************************************************************************
 __  __     ___           ___
|  \/  |   |_ _|         | _ )
| |\/| |    | |          | _ \
|_|  |_|ore|___|ncredible|___/ash - V1.11 "Santa Edition"

******************************************************************************************************************************************

**	0 - Backup
		Runs a full backup (RCC, MM, EEPROM, ...) of your unit and places it into the folder /backup/"your hardware ID"

**	1 - VIM patch (199 km/h)
		Writes custom Video In Motion (VIM) speed of 199 km/h (yes, too slow for German Autobahn) to your unit
		Unit will automatically restart to save changes permanently

**	2 - VIM Original (6 km/h)
		Writes factory default Video In Motion (VIM) speed to unit
		Unit will automatically restart to save changes permanently

**	3 - IFS-ROOT-Stage2 flash patched image
		Will create a backup if it was not already created before
		applies patched IFS Stage 2 image - containing patched MIBRoot - to the unit
		Unit will automatically restart to save changes permanently

**	4 - IFS-ROOT-Stage2 revert to Backup image
		Applies original IFS Stage 2 image - containing original/stock MIBRoot - from your system backup to the unit
		Unit will automatically restart to save changes permanently

**	5 - Copy FEC and EL List to Unit
		Copies ExceptionList.txt and/or FecContainer.fec placed within 
		e.g. /patches/MHI2_ER_SKG13_P4526_MU1440_PATCH to the unit
		if no FEC and/or EL is inside /patch directory, files from /backup folder will be used

**	6 - Developer Menu activation
		Developer Menu will be enabled - no need for VCP/VCDS or OBD11 ;)
		Unit will automatically restart to save changes permanently

**	7 - Ambient Light Buttons Original
		When you see this, first take a look on https://www.glaskugelservice.de/codierung/ambientbeleuchtung
		it is some special coding only for Skoda Octavia 5E, yet!

**	8 - Ambient Light Buttons patch (first, set to Original)
		When you see this, first take a look on https://www.glaskugelservice.de/codierung/ambientbeleuchtung
		it is some special coding only for Skoda Octavia 5E, yet!

**	U - Mount USB writeable
		makes USB devices writeable

**	W - Mountpoints writeable
		make some Mounts writeable on the unit

**	O - Show OFFSET hashes
		some Unit and flash informations, e.g. RCC Image address or image length

**	R - Reboot Unit
		restart the Unit

**	C - cleanup Logs
		delete all inside /log directory

**	S - show Log (press Q for exit view)
		show all our Logs from this Unit

**	H - Help
		this here...

**	L - GPL License
		please take a look and note our license

******************************************************************************************************************************************

Patch Info:
  All patches ifs-root-stage2 files located on https://bit.ly/399r2jy contain the following patches - all-in-one file:
    CP  - Component Protection removed
    EL  - ExceptionList.txt signature check removed - get prepared EL files here: https://bit.ly/2J0RG3P
    FEC - FECContainer.fec signature check removed
  EL patch will re-enable the installation of MIB2Toolbox on latest FW version, as the removed signature check also applies to the POI upload process.

EL vs FEC:
  It is recommended to use the EL patch over FEC.
  ExceptionList.txt can be edited with any ASCII editor (Notepad++).
  No need to change FECContainer.fec with WhatTheFec tool, therefore it will stay original on the unit.
    In case of FW update - at dealer - no issues with illegal FECContainer and unusable unit.

Supporting Documents:
  MHI2 Documentation: https://bit.ly/3lOg5Ye
  MHI2 Patches:       https://bit.ly/332msjl
  MIB2 FW collection: https://bit.ly/35LTrKL
  MHS2 Delphi MIB-HS: https://bit.ly/3kQJHTr

CONTACT:
  mailto: Mr.MIBonk@gmail.com
  Telegram Channel: https://t.me/joinchat/EHt4RRksHcMQk6Xi6tFaBw

  Get in contact with us to get support and provide feedback about M.I.B.
  We are always eager to learn more about VAG MIB hardware and expand the FW collection you love: https://bit.ly/35LTrKL


