
 project "xmp-openmpt"
  uuid "AEA14F53-ADB0-45E5-9823-81F4F36886C2"
  language "C++"
  vpaths { ["*"] = "../../libopenmpt/" }
  mpt_kind "shared"
  warnings "Extra"
	
	mpt_use_libopenmpt()
	
	mpt_use_pugixml()
	mpt_use_xmplay()
	
  includedirs {
   "../..",
   "$(IntDir)/svn_version",
  }
  files {
   "../../libopenmpt/xmp-openmpt/xmp-openmpt.cpp",
   "../../libopenmpt/plugin-common/libopenmpt_plugin_settings.hpp",
   "../../libopenmpt/plugin-common/libopenmpt_plugin_gui.hpp",
   "../../libopenmpt/plugin-common/libopenmpt_plugin_gui.cpp",
   "../../libopenmpt/plugin-common/libopenmpt_plugin_gui.rc",
   "../../libopenmpt/plugin-common/resource.h",
  }

	filter { "action:vs*", "kind:SharedLib or ConsoleApp or WindowedApp" }
		resdefines {
			"MPT_BUILD_VER_FILENAME=\"" .. "xmp-openmpt" .. ".dll\"",
			"MPT_BUILD_VER_FILEDESC=\"" .. "xmp-openmpt" .. "\"",
		}
	filter { "action:vs*", "kind:SharedLib or ConsoleApp or WindowedApp" }
		resincludedirs {
			"$(IntDir)/svn_version",
		}
		files {
			"../../libopenmpt/libopenmpt_version.rc",
		}
	filter { "action:vs*", "kind:SharedLib" }
		resdefines { "MPT_BUILD_VER_DLL" }
	filter { "action:vs*", "kind:ConsoleApp or WindowedApp" }
		resdefines { "MPT_BUILD_VER_EXE" }
	filter {}

	mpt_use_mfc()
	defines { "MPT_WITH_MFC" }

  filter {}
  prebuildcommands { "..\\..\\build\\svn_version\\update_svn_version_vs_premake.cmd $(IntDir)" }
