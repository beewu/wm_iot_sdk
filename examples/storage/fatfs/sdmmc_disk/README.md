# FATFS (SDMMC 磁盘)

## 功能概述

此应用程序是使用 `WM IoT SDK` 进行 `FATFS` 文件系统的全面示例。它演示了如何使用 `WM IoT SDK` 中的 `FATFS` API 在 SDMMC 磁盘上进行 SD 卡挂载及文件读写操作。示例包括：

1. 注册 SDMMC 磁盘：将 SDMMC 磁盘注册到 FATFS 系统；
2. 挂载文件系统：将 SDMMC 磁盘挂载到文件系统中。
   如果磁盘未格式化，需先进行格式化。FATFS 会根据磁盘容量自动选择最合适的文件系统类型，具体如下：
   - FAT12：适用于小容量存储（≤ 2MB，最大支持 4085 个簇，MAX_FAT12 = 0xFF5 = 4085 簇 = 2042560 Bytes ≈ 2MB）
   - FAT16：适用于中等容量存储（≤ 32MB，最大支持 65493 个簇，MAX_FAT16 = 0xFFF5 = 65493 簇 = 33516032 Bytes ≈ 32MB）
   - FAT32：适用于大容量存储（≤ 128GB，最大支持 268435445 个簇，MAX_FAT32 = 0x0FFFFFF5 = 268435445 簇 = 137438947840 Bytes ≈ 128GB）
   - EXFAT：适用于超大容量存储（≤ 1TB，最大支持 2147483645 个簇，MAX_EXFAT = 0x7FFFFFFD = 2147483645 簇 = 1099511626240 Bytes ≈ 1TB）
   - 注意：文件系统类型的选择会影响后续 API 的使用方式。

   支持以下两种盘符:
   - 数字盘符: 使用 `sprintf(path, "%d:", WM_DISKIO_DRIVER_NUM_SDMMC)` 格式，其中 `WM_DISKIO_DRIVER_NUM_SDMMC` 为 SDMMC 磁盘的驱动号
   - 字符串盘符: 需在 menuconfig 中配置 `CONFIG_FATFS_FF_STR_VOLUME_ID_ENABLE=y` 和 `CONFIG_FATFS_SDMMC_DISK_FF_VOLUME_STRS`，可使用 `sprintf(path, "%s:", CONFIG_FATFS_SDMMC_DISK_FF_VOLUME_STRS)` 格式来支持类似 Windows 的盘符(C:/D:/E:)
3. 创建文件：创建一个名为 test.txt 的文件，并写入字符串 "Hello, FatFs!"；
4. 读取文件：读取 test.txt 文件的内容，并与写入的内容进行比较，验证数据一致性；
5. 卸载文件系统：卸载文件系统。

本示例使用SDMMC磁盘作为存储介质，展示了如何在SDMMC磁盘上使用FATFS文件系统。

## 环境要求

1. 需要正确配置 `wm_drv_sdh_sdmmc` 驱动
2. 需要支持 SD 卡的硬件环境，并插上 SD 卡

## 编译和烧录

示例位置：`examples\storage\fatfs\sdmmc_disk`

编译、烧录等操作请参考：[快速入门](https://doc.winnermicro.net/w800/zh_CN/2.2-beta.2/get_started/index.html)

## 运行结果

成功运行将输出如下日志
```
[I] (146) main: ver: 2.0.5dev build at Sep 30 2024 13:36:01
[I] (249) example: FATFS demo start.
[I] (249) example: SDMMC driver registered successfully.
[I] (249) diskio_sdmmc: Initializing sdmmc device...
[I] (258) example: File system not found. Formatting...
[I] (438) example: File system formatted successfully.
[I] (453) example: write txt: Hello, FatFs!
[I] (453) example: read txt: Hello, FatFs!
[I] (453) example: This example succeeds in running.
```