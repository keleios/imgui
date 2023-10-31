project "ImGui"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin/" .. outputdir .. "/%{proname}")

    files
    {
        "imconfig.h",
        "imgui.cpp",
		"imgui.h",
		"imgui_demo.cpp",
        "imgui_draw.cpp",
        "imgui_internal.h",
		"imgui_tables.cpp",
        "imgui_widgets.cpp",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",
        
        "../imgui-sfml/imconfig-SFML.h"
    }

    includedirs
    {
        "../SFML/include"
    }

    defines
    {
        "IMGUI_USER_CONFIG=\"../imgui-sfml/imconfig-SFML.h\"",
    }

    links
    {
        "sfml-system",
        "sfml-graphics",
    }

    filter "system:windows"
        systemversion "latest"

    filter {"configurations:Debug"}
        runtime "Debug"
        symbols "on"

    filter {"configurations:Release"}
        runtime "Release"
        optimize "on"    

    filter {"configurations:Retail"}
        runtime "Release"
        optimize "on"