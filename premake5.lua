project "MetalCpp"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/obj/" .. outputdir .. "/%{prj.name}")

    files {
        "Source/Implementation.cpp"
    }

    includedirs {
        "Include"
    }

    filter { "system:macosx" }
        systemversion "14.0"

        links {
            -- "Metal.framework",
            -- "MetalKit.framework",
            -- "AppKit.framework",
            -- "Foundation.framework",
            -- "QuartzCore.framework",
        }

        xcodebuildsettings {
            ["USE_HEADERMAP"] = "NO",
            ["ALWAYS_SEARCH_USER_PATHS"] = "YES"
        }
    filter {}

    filter { "configurations:Debug" }
        runtime "Debug"
        symbols "on"
    filter {}

    filter { "configurations:Release" }
        runtime "Release"
        optimize "on"
    filter {}

