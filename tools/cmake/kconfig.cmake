if(${CONFIG_BUILD_TYPE_W800})
    message(STATUS "CHIP_TYPE: W800")
    set(chip_type "w800")
elseif(${CONFIG_BUILD_TYPE_W801})
    message(STATUS "CHIP_TYPE: W801")
    set(chip_type "w801")
elseif(${CONFIG_BUILD_TYPE_W801S})
    message(STATUS "CHIP_TYPE: W801S")
    set(chip_type "w801s")
elseif(${CONFIG_BUILD_TYPE_W802})
    message(STATUS "CHIP_TYPE: W802")
    set(chip_type "w802")
elseif(${CONFIG_BUILD_TYPE_W803})
    message(STATUS "CHIP_TYPE: W803")
    set(chip_type "w803")
elseif(${CONFIG_BUILD_TYPE_W805})
    message(STATUS "CHIP_TYPE: W805")
    set(chip_type "w805")
elseif(${CONFIG_BUILD_TYPE_W806})
    message(STATUS "CHIP_TYPE: W806")
    set(chip_type "w806")
endif()

if(${CONFIG_CHIP_W80X})
    set(chip_family_type "w80x")
    set(CONFIG_FLASH_BASE_ADDR "0x8000000")
elseif(${CONFIG_CHIP_W9XX})
    set(chip_family_type "w9xx")
    set(CONFIG_FLASH_BASE_ADDR "0x8000000")
endif()

if(${CONFIG_COMPILER_OPTIMIZE_LEVEL_O0})
    set(compiler_optimization "-O0")
elseif(${CONFIG_COMPILER_OPTIMIZE_LEVEL_OS})
    set(compiler_optimization "-Os")
elseif(${CONFIG_COMPILER_OPTIMIZE_LEVEL_O2})
    set(compiler_optimization "-O2")
elseif(${CONFIG_COMPILER_OPTIMIZE_LEVEL_O3})
    set(compiler_optimization "-O3")
endif()

if(${CONFIG_COMPILER_DEBUG_INFORMATION})
    set(compiler_optimization "${compiler_optimization} -g3")
endif()

if(USE_CMAKE_PRE_PROCESS)
    set(compiler_optimization "${compiler_optimization} -E")
    if(USE_CMAKE_BUILD_PROMPT)
        set(USE_CMAKE_BUILD_PROMPT OFF)
    endif()
endif()
