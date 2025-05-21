project "NVRHI"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "Off"

    if OutputIntermediateDir == nil or OutputTargetDir == nil then
        targetdir ("Build/bin/%{prj.name}/")
        objdir    ("Build/obj/%{prj.name}/")

    else
        targetdir ("../../../" .. OutputTargetDir .. "")
        objdir    ("../../../" .. OutputIntermediateDir .. "")
    end

    defines
    {
        "NVRHI_WITH_DX12",
        "NVRHI_WITH_VULKAN"
    }

    includedirs 
    {
        "./thirdparty/DirectX-Headers/include",
        "./thirdparty/DirectX-Headers/include/directx",
        "./thirdparty/DirectX-Headers/src",
        "./thirdparty/Vulkan-Headers/include",
        "./include",
        "./src",
    }

    files
    {
        "./thirdparty/DirectX-Headers/include/**.h",
        "./thirdparty/DirectX-Headers/src/**.h",
        "./thirdparty/DirectX-Headers/src/**.cpp",
        "./thirdparty/Vulkan-Headers/include/**.h",
        "./include/**.h",
        "./src/**.h",
        "./src/**.cpp"
    }

    filter "system:windows"
        defines { "VK_USE_PLATFORM_WIN32_KHR", "NOMINMAX" }
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        buildoptions { "/MDd" }
        symbols "On"

    filter "configurations:Optimized"
        runtime "Release"
        buildoptions { "/MDd" }
        optimize "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"
        buildoptions { "/MD" }
        symbols "Off"