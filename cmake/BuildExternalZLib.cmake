# Build the ZLib vendor library
set(ZLib_ROOT "${VENDOR_PREFIX}/src/zlib")

if(WIN32)
	set(patch_command del zconf.h)
else()
	set(patch_command rm -f zconf.h)
endif()

ExternalProject_Add(ZLib
	PREFIX ${VENDOR_PREFIX}	
	GIT_REPOSITORY https://github.com/anhstudios/zlib.git
	GIT_TAG f3c9192b
	UPDATE_COMMAND ""
	PATCH_COMMAND ${patch_command}
	BUILD_IN_SOURCE 1
	INSTALL_COMMAND ""
)