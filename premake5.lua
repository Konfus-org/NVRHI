project "NVRHI"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "Off"

    includedirs
    {
        "./thirdparty/DirectX-Headers/include",
        "./thirdparty/DirectX-Headers/include/directx",
        "./thirdparty/Vulkan-Headers/include",

        "./rtxmu/include",

        "./include",
        "./src",
    }
    files
    {
        "./thirdparty/Vulkan-Headers/include/**.h",
        "./thirdparty/Vulkan-Headers/include/**.hpp",
        "./thirdparty/Vulkan-Headers/src/**.cpp",

        "./rtxmu/include/rtxmu/Logger.h",
        "./rtxmu/include/rtxmu/Suballocator.h",
        "./rtxmu/include/rtxmu/AccelStructManager.h",
        "./rtxmu/include/rtxmu/VulkanSuballocator.h",
        "./rtxmu/include/rtxmu/VkAccelStructManager.h",
        "./rtxmu/src/VulkanSuballocator.cpp",
        "./rtxmu/src/VkAccelStructManager.cpp",
        "./rtxmu/src/Logger.cpp",

        "./include/common/**.h",
        "./src/common/**.h",
        "./src/common/**.cpp",
        "./include/validation/**.h",
        "./src/validation/**.h",
        "./src/validation/**.cpp",
        "./include/vulkan/**.h",
        "./src/vulkan/**.cpp",
        "./src/vulkan/**.h",

        -- Use later requires xxopts
        -- "./tools/**.h",
        -- "./tools/**.cpp",

        "./**.md"
    }
    defines
    {
        "NVRHI_WITH_VULKAN",
        "RTXMU_WITH_VULKAN"
    }

    filter "system:windows"
        systemversion "latest"
        defines { "NVRHI_WITH_DX12", "RTXMU_WITH_D3D12", "VK_USE_PLATFORM_WIN32_KHR", "NOMINMAX" }
        files
        {
            "./thirdparty/DirectX-Headers/include/**.h",
            "./thirdparty/DirectX-Headers/include/**.hpp",
            "./thirdparty/DirectX-Headers/src/**.cpp",

            "./rtxmu/include/rtxmu/D3D12Suballocator.h",
            "./rtxmu/include/rtxmu/D3D12AccelStructManager.h",
            "./rtxmu/src/D3D12Suballocator.cpp",
            "./rtxmu/src/D3D12AccelStructManager.cpp",

            "./include/d3d12/**.h",
            "./src/d3d12/**.cpp",
            "./src/d3d12/**.h",
        }