# Before run nmake, need run this vcvars64.bat
# "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\vc\Auxiliary\Build\vcvars64.bat"

LUA_INC=/I "D:\workspace\lua\lua-5.3.4\src"
LUA_LIB= D:\workspace\lua\lua53.lib

CFLAGS=/nologo /MT /O2 /c -D_WIN64 -DWIN32_LEAN_AND_MEAN -D_CRT_NO_POSIX_ERROR_CODES -DLUA_LIB -DLUA_BUILD_AS_DLL

all: touch lsocket.dll

touch:
	@echo.>unistd.h

#compile
.c.o:
    @$(CC) /I . $(LUA_INC) /Fo$@ $(CFLAGS) $?

# link
lsocket.dll : lsocket.o win_compat.o
    @LINK /nologo /DLL /OUT:$@ $(LUA_LIB) ws2_32.lib $?

test:
	lua samples\httpclient.lua http://www.baidu.com

clean:
    @del *.o
	@del *.exp
	@del *.lib
    @del *.dll
