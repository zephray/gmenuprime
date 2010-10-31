CHAINPREFIX=$(OPEN2X)
CROSS_COMPILE=$(CHAINPREFIX)/bin/arm-open2x-linux-

CC= $(CROSS_COMPILE)gcc
CXX = $(CROSS_COMPILE)g++
STRIP = $(CROSS_COMPILE)strip

CFLAGS = -I"$(CHAINPREFIX)/include" `$(CHAINPREFIX)/bin/sdl-config --cflags` -DLOG_LEVEL=4 -DTARGET_GP2X -O3 -g -msoft-float -fomit-frame-pointer -ffast-math -funroll-loops -fno-exceptions -Wall -Wno-unknown-pragmas -Wno-format
CXXFLAGS = $(CFLAGS)
LDFLAGS = -L$(CHAINPREFIX)/lib -lSDL_image -lSDL_ttf -lfreetype -lSDL_gfx -ljpeg -lpng12 -lSDL -lz -ldl

TARGET = build/gmenu2x
OBJDIR = objs/gp2x

SOURCES := $(wildcard src/*.cpp)
OBJS := $(patsubst src/%.cpp, $(OBJDIR)/%.o, $(SOURCES))

# File types rules
$(OBJDIR)/%.o: src/%.cpp src/%.h
	$(CXX) $(CFLAGS) -o $@ -c $<

all: dir shared

dir:
	@if [ ! -d $(OBJDIR) ]; then mkdir -p $(OBJDIR); fi

debug-static: $(OBJS)
	@echo "Linking $(TARGET)-debug..."
	$(CXX) -o $(TARGET)-debug $(OBJS) -static `$(CHAINPREFIX)/bin/sdl-config --static-libs` $(LDFLAGS)

debug-shared: $(OBJS)
	@echo "Linking $(TARGET)-debug..."
	$(CXX) -o $(TARGET)-debug `$(CHAINPREFIX)/bin/sdl-config --libs` $(LDFLAGS) $(OBJS)

shared: debug-shared
	$(STRIP) $(TARGET)-debug -o $(TARGET)

static: debug-static
	$(STRIP) $(TARGET)-debug -o $(TARGET)

clean:
	-rm -f $(OBJDIR)/*.o $(TARGET)

depend:
	makedepend -p$(OBJDIR)/ -- $(CFLAGS) -- src/*.cpp
# DO NOT DELETE

objs/gp2x/src/browsedialog.o: src/browsedialog.h src/filelister.h
objs/gp2x/src/browsedialog.o: src/gmenu2x.h src/surfacecollection.h
objs/gp2x/src/browsedialog.o: src/iconbutton.h src/button.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/browsedialog.o: /usr/include/sys/types.h
objs/gp2x/src/browsedialog.o: /usr/include/features.h
objs/gp2x/src/browsedialog.o: /usr/include/sys/cdefs.h
objs/gp2x/src/browsedialog.o: /usr/include/bits/wordsize.h
objs/gp2x/src/browsedialog.o: /usr/include/gnu/stubs.h
objs/gp2x/src/browsedialog.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/browsedialog.o: /usr/include/bits/types.h
objs/gp2x/src/browsedialog.o: /usr/include/bits/typesizes.h
objs/gp2x/src/browsedialog.o: /usr/include/time.h /usr/include/endian.h
objs/gp2x/src/browsedialog.o: /usr/include/bits/endian.h
objs/gp2x/src/browsedialog.o: /usr/include/bits/byteswap.h
objs/gp2x/src/browsedialog.o: /usr/include/sys/select.h
objs/gp2x/src/browsedialog.o: /usr/include/bits/select.h
objs/gp2x/src/browsedialog.o: /usr/include/bits/sigset.h
objs/gp2x/src/browsedialog.o: /usr/include/bits/time.h
objs/gp2x/src/browsedialog.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/browsedialog.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/browsedialog.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/browsedialog.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/browsedialog.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/browsedialog.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/browsedialog.o: /usr/include/stdlib.h
objs/gp2x/src/browsedialog.o: /usr/include/bits/waitflags.h
objs/gp2x/src/browsedialog.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/browsedialog.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/browsedialog.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/browsedialog.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/browsedialog.o: /usr/include/bits/wchar.h /usr/include/ctype.h
objs/gp2x/src/browsedialog.o: /usr/include/iconv.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/browsedialog.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/browsedialog.o: src/translator.h src/utilities.h
objs/gp2x/src/browsedialog.o: src/touchscreen.h /usr/include/fcntl.h
objs/gp2x/src/browsedialog.o: /usr/include/bits/fcntl.h
objs/gp2x/src/browsedialog.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/browsedialog.o: src/surface.h src/sfontplus.h
objs/gp2x/src/browsedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/browsedialog.o: src/buttonbox.h src/dialog.h
objs/gp2x/src/buttonbox.o: src/button.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/buttonbox.o: /usr/include/sys/types.h /usr/include/features.h
objs/gp2x/src/buttonbox.o: /usr/include/sys/cdefs.h
objs/gp2x/src/buttonbox.o: /usr/include/bits/wordsize.h
objs/gp2x/src/buttonbox.o: /usr/include/gnu/stubs.h
objs/gp2x/src/buttonbox.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/buttonbox.o: /usr/include/bits/types.h
objs/gp2x/src/buttonbox.o: /usr/include/bits/typesizes.h /usr/include/time.h
objs/gp2x/src/buttonbox.o: /usr/include/endian.h /usr/include/bits/endian.h
objs/gp2x/src/buttonbox.o: /usr/include/bits/byteswap.h
objs/gp2x/src/buttonbox.o: /usr/include/sys/select.h
objs/gp2x/src/buttonbox.o: /usr/include/bits/select.h
objs/gp2x/src/buttonbox.o: /usr/include/bits/sigset.h
objs/gp2x/src/buttonbox.o: /usr/include/bits/time.h
objs/gp2x/src/buttonbox.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/buttonbox.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/buttonbox.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/buttonbox.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/buttonbox.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/buttonbox.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/buttonbox.o: /usr/include/stdlib.h
objs/gp2x/src/buttonbox.o: /usr/include/bits/waitflags.h
objs/gp2x/src/buttonbox.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/buttonbox.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/buttonbox.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/buttonbox.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/buttonbox.o: /usr/include/bits/wchar.h /usr/include/ctype.h
objs/gp2x/src/buttonbox.o: /usr/include/iconv.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/buttonbox.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/buttonbox.o: src/gmenu2x.h src/surfacecollection.h
objs/gp2x/src/buttonbox.o: src/iconbutton.h src/translator.h src/utilities.h
objs/gp2x/src/buttonbox.o: src/touchscreen.h /usr/include/fcntl.h
objs/gp2x/src/buttonbox.o: /usr/include/bits/fcntl.h /usr/include/bits/stat.h
objs/gp2x/src/buttonbox.o: src/inputmanager.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/buttonbox.o: src/surface.h src/sfontplus.h
objs/gp2x/src/buttonbox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/buttonbox.o: src/buttonbox.h
objs/gp2x/src/button.o: src/button.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/button.o: /usr/include/sys/types.h /usr/include/features.h
objs/gp2x/src/button.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
objs/gp2x/src/button.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
objs/gp2x/src/button.o: /usr/include/bits/types.h
objs/gp2x/src/button.o: /usr/include/bits/typesizes.h /usr/include/time.h
objs/gp2x/src/button.o: /usr/include/endian.h /usr/include/bits/endian.h
objs/gp2x/src/button.o: /usr/include/bits/byteswap.h
objs/gp2x/src/button.o: /usr/include/sys/select.h /usr/include/bits/select.h
objs/gp2x/src/button.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
objs/gp2x/src/button.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/button.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
objs/gp2x/src/button.o: /usr/include/libio.h /usr/include/_G_config.h
objs/gp2x/src/button.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
objs/gp2x/src/button.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
objs/gp2x/src/button.o: /usr/include/bits/waitflags.h
objs/gp2x/src/button.o: /usr/include/bits/waitstatus.h /usr/include/alloca.h
objs/gp2x/src/button.o: /usr/include/string.h /usr/include/xlocale.h
objs/gp2x/src/button.o: /usr/include/strings.h /usr/include/inttypes.h
objs/gp2x/src/button.o: /usr/include/stdint.h /usr/include/bits/wchar.h
objs/gp2x/src/button.o: /usr/include/ctype.h /usr/include/iconv.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/button.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/button.o: src/gmenu2x.h src/surfacecollection.h
objs/gp2x/src/button.o: src/iconbutton.h src/translator.h src/utilities.h
objs/gp2x/src/button.o: src/touchscreen.h /usr/include/fcntl.h
objs/gp2x/src/button.o: /usr/include/bits/fcntl.h /usr/include/bits/stat.h
objs/gp2x/src/button.o: src/inputmanager.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/button.o: src/surface.h src/sfontplus.h
objs/gp2x/src/button.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/dialog.o: src/dialog.h src/gmenu2x.h src/surfacecollection.h
objs/gp2x/src/dialog.o: src/iconbutton.h src/button.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/dialog.o: /usr/include/sys/types.h /usr/include/features.h
objs/gp2x/src/dialog.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
objs/gp2x/src/dialog.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
objs/gp2x/src/dialog.o: /usr/include/bits/types.h
objs/gp2x/src/dialog.o: /usr/include/bits/typesizes.h /usr/include/time.h
objs/gp2x/src/dialog.o: /usr/include/endian.h /usr/include/bits/endian.h
objs/gp2x/src/dialog.o: /usr/include/bits/byteswap.h
objs/gp2x/src/dialog.o: /usr/include/sys/select.h /usr/include/bits/select.h
objs/gp2x/src/dialog.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
objs/gp2x/src/dialog.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/dialog.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
objs/gp2x/src/dialog.o: /usr/include/libio.h /usr/include/_G_config.h
objs/gp2x/src/dialog.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
objs/gp2x/src/dialog.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
objs/gp2x/src/dialog.o: /usr/include/bits/waitflags.h
objs/gp2x/src/dialog.o: /usr/include/bits/waitstatus.h /usr/include/alloca.h
objs/gp2x/src/dialog.o: /usr/include/string.h /usr/include/xlocale.h
objs/gp2x/src/dialog.o: /usr/include/strings.h /usr/include/inttypes.h
objs/gp2x/src/dialog.o: /usr/include/stdint.h /usr/include/bits/wchar.h
objs/gp2x/src/dialog.o: /usr/include/ctype.h /usr/include/iconv.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/dialog.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/dialog.o: src/translator.h src/utilities.h src/touchscreen.h
objs/gp2x/src/dialog.o: /usr/include/fcntl.h /usr/include/bits/fcntl.h
objs/gp2x/src/dialog.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/dialog.o: src/surface.h src/sfontplus.h
objs/gp2x/src/dialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/dirdialog.o: src/dirdialog.h src/gmenu2x.h
objs/gp2x/src/dirdialog.o: src/surfacecollection.h src/iconbutton.h
objs/gp2x/src/dirdialog.o: src/button.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/dirdialog.o: /usr/include/sys/types.h /usr/include/features.h
objs/gp2x/src/dirdialog.o: /usr/include/sys/cdefs.h
objs/gp2x/src/dirdialog.o: /usr/include/bits/wordsize.h
objs/gp2x/src/dirdialog.o: /usr/include/gnu/stubs.h
objs/gp2x/src/dirdialog.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/dirdialog.o: /usr/include/bits/types.h
objs/gp2x/src/dirdialog.o: /usr/include/bits/typesizes.h /usr/include/time.h
objs/gp2x/src/dirdialog.o: /usr/include/endian.h /usr/include/bits/endian.h
objs/gp2x/src/dirdialog.o: /usr/include/bits/byteswap.h
objs/gp2x/src/dirdialog.o: /usr/include/sys/select.h
objs/gp2x/src/dirdialog.o: /usr/include/bits/select.h
objs/gp2x/src/dirdialog.o: /usr/include/bits/sigset.h
objs/gp2x/src/dirdialog.o: /usr/include/bits/time.h
objs/gp2x/src/dirdialog.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/dirdialog.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/dirdialog.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/dirdialog.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/dirdialog.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/dirdialog.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/dirdialog.o: /usr/include/stdlib.h
objs/gp2x/src/dirdialog.o: /usr/include/bits/waitflags.h
objs/gp2x/src/dirdialog.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/dirdialog.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/dirdialog.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/dirdialog.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/dirdialog.o: /usr/include/bits/wchar.h /usr/include/ctype.h
objs/gp2x/src/dirdialog.o: /usr/include/iconv.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/dirdialog.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/dirdialog.o: src/translator.h src/utilities.h src/touchscreen.h
objs/gp2x/src/dirdialog.o: /usr/include/fcntl.h /usr/include/bits/fcntl.h
objs/gp2x/src/dirdialog.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/dirdialog.o: src/surface.h src/sfontplus.h
objs/gp2x/src/dirdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/dirdialog.o: src/browsedialog.h src/filelister.h
objs/gp2x/src/dirdialog.o: src/buttonbox.h src/dialog.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/filedialog.o: /usr/include/sys/types.h /usr/include/features.h
objs/gp2x/src/filedialog.o: /usr/include/sys/cdefs.h
objs/gp2x/src/filedialog.o: /usr/include/bits/wordsize.h
objs/gp2x/src/filedialog.o: /usr/include/gnu/stubs.h
objs/gp2x/src/filedialog.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/filedialog.o: /usr/include/bits/types.h
objs/gp2x/src/filedialog.o: /usr/include/bits/typesizes.h /usr/include/time.h
objs/gp2x/src/filedialog.o: /usr/include/endian.h /usr/include/bits/endian.h
objs/gp2x/src/filedialog.o: /usr/include/bits/byteswap.h
objs/gp2x/src/filedialog.o: /usr/include/sys/select.h
objs/gp2x/src/filedialog.o: /usr/include/bits/select.h
objs/gp2x/src/filedialog.o: /usr/include/bits/sigset.h
objs/gp2x/src/filedialog.o: /usr/include/bits/time.h
objs/gp2x/src/filedialog.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/filedialog.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/filedialog.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/filedialog.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/filedialog.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/filedialog.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/filedialog.o: /usr/include/stdlib.h
objs/gp2x/src/filedialog.o: /usr/include/bits/waitflags.h
objs/gp2x/src/filedialog.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/filedialog.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/filedialog.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/filedialog.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/filedialog.o: /usr/include/bits/wchar.h /usr/include/ctype.h
objs/gp2x/src/filedialog.o: /usr/include/iconv.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_gfxPrimitives.h
objs/gp2x/src/filedialog.o: /usr/include/math.h /usr/include/bits/huge_val.h
objs/gp2x/src/filedialog.o: /usr/include/bits/huge_valf.h
objs/gp2x/src/filedialog.o: /usr/include/bits/huge_vall.h
objs/gp2x/src/filedialog.o: /usr/include/bits/inf.h /usr/include/bits/nan.h
objs/gp2x/src/filedialog.o: /usr/include/bits/mathdef.h
objs/gp2x/src/filedialog.o: /usr/include/bits/mathcalls.h
objs/gp2x/src/filedialog.o: /usr/include/sys/stat.h /usr/include/bits/stat.h
objs/gp2x/src/filedialog.o: /usr/include/dirent.h /usr/include/bits/dirent.h
objs/gp2x/src/filedialog.o: /usr/include/bits/posix1_lim.h
objs/gp2x/src/filedialog.o: /usr/include/bits/local_lim.h
objs/gp2x/src/filedialog.o: /usr/include/linux/limits.h src/filedialog.h
objs/gp2x/src/filedialog.o: src/browsedialog.h src/filelister.h src/gmenu2x.h
objs/gp2x/src/filedialog.o: src/surfacecollection.h src/iconbutton.h
objs/gp2x/src/filedialog.o: src/button.h src/FastDelegate.h
objs/gp2x/src/filedialog.o: /usr/include/memory.h src/translator.h
objs/gp2x/src/filedialog.o: src/utilities.h src/touchscreen.h
objs/gp2x/src/filedialog.o: /usr/include/fcntl.h /usr/include/bits/fcntl.h
objs/gp2x/src/filedialog.o: src/inputmanager.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/filedialog.o: src/surface.h src/sfontplus.h
objs/gp2x/src/filedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/filedialog.o: src/buttonbox.h src/dialog.h
objs/gp2x/src/filelister.o: /usr/include/sys/stat.h /usr/include/features.h
objs/gp2x/src/filelister.o: /usr/include/sys/cdefs.h
objs/gp2x/src/filelister.o: /usr/include/bits/wordsize.h
objs/gp2x/src/filelister.o: /usr/include/gnu/stubs.h
objs/gp2x/src/filelister.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/filelister.o: /usr/include/bits/types.h
objs/gp2x/src/filelister.o: /usr/include/bits/typesizes.h /usr/include/time.h
objs/gp2x/src/filelister.o: /usr/include/bits/stat.h /usr/include/sys/types.h
objs/gp2x/src/filelister.o: /usr/include/endian.h /usr/include/bits/endian.h
objs/gp2x/src/filelister.o: /usr/include/bits/byteswap.h
objs/gp2x/src/filelister.o: /usr/include/sys/select.h
objs/gp2x/src/filelister.o: /usr/include/bits/select.h
objs/gp2x/src/filelister.o: /usr/include/bits/sigset.h
objs/gp2x/src/filelister.o: /usr/include/bits/time.h
objs/gp2x/src/filelister.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/filelister.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/filelister.o: /usr/include/dirent.h /usr/include/bits/dirent.h
objs/gp2x/src/filelister.o: /usr/include/bits/posix1_lim.h
objs/gp2x/src/filelister.o: /usr/include/bits/local_lim.h
objs/gp2x/src/filelister.o: /usr/include/linux/limits.h /usr/include/errno.h
objs/gp2x/src/filelister.o: /usr/include/bits/errno.h
objs/gp2x/src/filelister.o: /usr/include/linux/errno.h
objs/gp2x/src/filelister.o: /usr/include/asm/errno.h
objs/gp2x/src/filelister.o: /usr/include/asm-generic/errno.h
objs/gp2x/src/filelister.o: /usr/include/asm-generic/errno-base.h
objs/gp2x/src/filelister.o: src/filelister.h src/utilities.h src/gmenu2x.h
objs/gp2x/src/filelister.o: src/surfacecollection.h src/iconbutton.h
objs/gp2x/src/filelister.o: src/button.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/filelister.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/filelister.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/filelister.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/filelister.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/filelister.o: /usr/include/stdlib.h
objs/gp2x/src/filelister.o: /usr/include/bits/waitflags.h
objs/gp2x/src/filelister.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/filelister.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/filelister.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/filelister.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/filelister.o: /usr/include/bits/wchar.h /usr/include/ctype.h
objs/gp2x/src/filelister.o: /usr/include/iconv.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/filelister.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/filelister.o: src/translator.h src/touchscreen.h
objs/gp2x/src/filelister.o: /usr/include/fcntl.h /usr/include/bits/fcntl.h
objs/gp2x/src/filelister.o: src/inputmanager.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/filelister.o: src/surface.h src/sfontplus.h
objs/gp2x/src/filelister.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/filelister.o: src/debug.h
objs/gp2x/src/gmenu2x.o: /usr/include/stdlib.h /usr/include/features.h
objs/gp2x/src/gmenu2x.o: /usr/include/sys/cdefs.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/wordsize.h
objs/gp2x/src/gmenu2x.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/waitflags.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/endian.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/byteswap.h
objs/gp2x/src/gmenu2x.o: /usr/include/sys/types.h /usr/include/bits/types.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/typesizes.h /usr/include/time.h
objs/gp2x/src/gmenu2x.o: /usr/include/sys/select.h /usr/include/bits/select.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
objs/gp2x/src/gmenu2x.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/gmenu2x.o: /usr/include/alloca.h /usr/include/unistd.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/posix_opt.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/environments.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/confname.h /usr/include/getopt.h
objs/gp2x/src/gmenu2x.o: /usr/include/math.h /usr/include/bits/huge_val.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/huge_valf.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/huge_vall.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/inf.h /usr/include/bits/nan.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/mathdef.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/mathcalls.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/gmenu2x.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/gmenu2x.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/gmenu2x.o: /usr/include/string.h /usr/include/xlocale.h
objs/gp2x/src/gmenu2x.o: /usr/include/strings.h /usr/include/inttypes.h
objs/gp2x/src/gmenu2x.o: /usr/include/stdint.h /usr/include/bits/wchar.h
objs/gp2x/src/gmenu2x.o: /usr/include/ctype.h /usr/include/iconv.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_gfxPrimitives.h
objs/gp2x/src/gmenu2x.o: /usr/include/signal.h /usr/include/bits/signum.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/siginfo.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/sigaction.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/sigcontext.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/sigstack.h
objs/gp2x/src/gmenu2x.o: /usr/include/sys/ucontext.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/sigthread.h
objs/gp2x/src/gmenu2x.o: /usr/include/sys/statvfs.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/statvfs.h /usr/include/errno.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
objs/gp2x/src/gmenu2x.o: /usr/include/asm/errno.h
objs/gp2x/src/gmenu2x.o: /usr/include/asm-generic/errno.h
objs/gp2x/src/gmenu2x.o: /usr/include/asm-generic/errno-base.h src/gp2x.h
objs/gp2x/src/gmenu2x.o: /usr/include/linux/types.h /usr/include/asm/types.h
objs/gp2x/src/gmenu2x.o: /usr/include/asm-generic/types.h
objs/gp2x/src/gmenu2x.o: /usr/include/asm-generic/int-ll64.h
objs/gp2x/src/gmenu2x.o: /usr/include/asm/bitsperlong.h
objs/gp2x/src/gmenu2x.o: /usr/include/asm-generic/bitsperlong.h
objs/gp2x/src/gmenu2x.o: /usr/include/linux/posix_types.h
objs/gp2x/src/gmenu2x.o: /usr/include/linux/stddef.h
objs/gp2x/src/gmenu2x.o: /usr/include/asm/posix_types.h
objs/gp2x/src/gmenu2x.o: /usr/include/asm/posix_types_64.h
objs/gp2x/src/gmenu2x.o: /usr/include/sys/fcntl.h /usr/include/fcntl.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/fcntl.h /usr/include/bits/stat.h
objs/gp2x/src/gmenu2x.o: /usr/include/sys/stat.h /usr/include/dirent.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/dirent.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/posix1_lim.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/local_lim.h
objs/gp2x/src/gmenu2x.o: /usr/include/linux/limits.h /usr/include/sys/ioctl.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/ioctls.h /usr/include/asm/ioctls.h
objs/gp2x/src/gmenu2x.o: /usr/include/asm-generic/ioctls.h
objs/gp2x/src/gmenu2x.o: /usr/include/linux/ioctl.h /usr/include/asm/ioctl.h
objs/gp2x/src/gmenu2x.o: /usr/include/asm-generic/ioctl.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/ioctl-types.h
objs/gp2x/src/gmenu2x.o: /usr/include/sys/ttydefaults.h
objs/gp2x/src/gmenu2x.o: /usr/include/linux/soundcard.h
objs/gp2x/src/gmenu2x.o: /usr/include/linux/patchkey.h src/linkapp.h
objs/gp2x/src/gmenu2x.o: src/link.h src/button.h src/FastDelegate.h
objs/gp2x/src/gmenu2x.o: /usr/include/memory.h src/surface.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/gmenu2x.o: src/linkaction.h src/menu.h src/sfontplus.h
objs/gp2x/src/gmenu2x.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/gmenu2x.o: src/filedialog.h src/browsedialog.h src/filelister.h
objs/gp2x/src/gmenu2x.o: src/gmenu2x.h src/surfacecollection.h
objs/gp2x/src/gmenu2x.o: src/iconbutton.h src/translator.h src/utilities.h
objs/gp2x/src/gmenu2x.o: src/touchscreen.h src/inputmanager.h src/buttonbox.h
objs/gp2x/src/gmenu2x.o: src/dialog.h src/messagebox.h src/inputdialog.h
objs/gp2x/src/gmenu2x.o: src/settingsdialog.h src/menusetting.h
objs/gp2x/src/gmenu2x.o: src/wallpaperdialog.h src/textdialog.h
objs/gp2x/src/gmenu2x.o: src/menusettingint.h src/menusettingbool.h
objs/gp2x/src/gmenu2x.o: src/menusettingrgba.h src/menusettingstring.h
objs/gp2x/src/gmenu2x.o: src/menusettingstringbase.h
objs/gp2x/src/gmenu2x.o: src/menusettingmultistring.h src/menusettingfile.h
objs/gp2x/src/gmenu2x.o: src/menusettingimage.h src/menusettingdir.h
objs/gp2x/src/gmenu2x.o: src/debug.h /usr/include/sys/mman.h
objs/gp2x/src/gmenu2x.o: /usr/include/bits/mman.h
objs/gp2x/src/iconbutton.o: src/iconbutton.h src/button.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/iconbutton.o: /usr/include/sys/types.h /usr/include/features.h
objs/gp2x/src/iconbutton.o: /usr/include/sys/cdefs.h
objs/gp2x/src/iconbutton.o: /usr/include/bits/wordsize.h
objs/gp2x/src/iconbutton.o: /usr/include/gnu/stubs.h
objs/gp2x/src/iconbutton.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/iconbutton.o: /usr/include/bits/types.h
objs/gp2x/src/iconbutton.o: /usr/include/bits/typesizes.h /usr/include/time.h
objs/gp2x/src/iconbutton.o: /usr/include/endian.h /usr/include/bits/endian.h
objs/gp2x/src/iconbutton.o: /usr/include/bits/byteswap.h
objs/gp2x/src/iconbutton.o: /usr/include/sys/select.h
objs/gp2x/src/iconbutton.o: /usr/include/bits/select.h
objs/gp2x/src/iconbutton.o: /usr/include/bits/sigset.h
objs/gp2x/src/iconbutton.o: /usr/include/bits/time.h
objs/gp2x/src/iconbutton.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/iconbutton.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/iconbutton.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/iconbutton.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/iconbutton.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/iconbutton.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/iconbutton.o: /usr/include/stdlib.h
objs/gp2x/src/iconbutton.o: /usr/include/bits/waitflags.h
objs/gp2x/src/iconbutton.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/iconbutton.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/iconbutton.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/iconbutton.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/iconbutton.o: /usr/include/bits/wchar.h /usr/include/ctype.h
objs/gp2x/src/iconbutton.o: /usr/include/iconv.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/iconbutton.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/iconbutton.o: src/gmenu2x.h src/surfacecollection.h
objs/gp2x/src/iconbutton.o: src/translator.h src/utilities.h
objs/gp2x/src/iconbutton.o: src/touchscreen.h /usr/include/fcntl.h
objs/gp2x/src/iconbutton.o: /usr/include/bits/fcntl.h
objs/gp2x/src/iconbutton.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/iconbutton.o: src/surface.h src/sfontplus.h
objs/gp2x/src/iconbutton.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/imagedialog.o: /usr/include/sys/types.h /usr/include/features.h
objs/gp2x/src/imagedialog.o: /usr/include/sys/cdefs.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/wordsize.h
objs/gp2x/src/imagedialog.o: /usr/include/gnu/stubs.h
objs/gp2x/src/imagedialog.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/types.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/typesizes.h
objs/gp2x/src/imagedialog.o: /usr/include/time.h /usr/include/endian.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/endian.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/byteswap.h
objs/gp2x/src/imagedialog.o: /usr/include/sys/select.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/select.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/sigset.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/time.h
objs/gp2x/src/imagedialog.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/imagedialog.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/imagedialog.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/imagedialog.o: /usr/include/stdlib.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/waitflags.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/imagedialog.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/imagedialog.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/imagedialog.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/wchar.h /usr/include/ctype.h
objs/gp2x/src/imagedialog.o: /usr/include/iconv.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_gfxPrimitives.h
objs/gp2x/src/imagedialog.o: /usr/include/math.h /usr/include/bits/huge_val.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/huge_valf.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/huge_vall.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/inf.h /usr/include/bits/nan.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/mathdef.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/mathcalls.h
objs/gp2x/src/imagedialog.o: /usr/include/sys/stat.h /usr/include/bits/stat.h
objs/gp2x/src/imagedialog.o: /usr/include/dirent.h /usr/include/bits/dirent.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/posix1_lim.h
objs/gp2x/src/imagedialog.o: /usr/include/bits/local_lim.h
objs/gp2x/src/imagedialog.o: /usr/include/linux/limits.h src/imagedialog.h
objs/gp2x/src/imagedialog.o: src/filedialog.h src/browsedialog.h
objs/gp2x/src/imagedialog.o: src/filelister.h src/gmenu2x.h
objs/gp2x/src/imagedialog.o: src/surfacecollection.h src/iconbutton.h
objs/gp2x/src/imagedialog.o: src/button.h src/FastDelegate.h
objs/gp2x/src/imagedialog.o: /usr/include/memory.h src/translator.h
objs/gp2x/src/imagedialog.o: src/utilities.h src/touchscreen.h
objs/gp2x/src/imagedialog.o: /usr/include/fcntl.h /usr/include/bits/fcntl.h
objs/gp2x/src/imagedialog.o: src/inputmanager.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/imagedialog.o: src/surface.h src/sfontplus.h
objs/gp2x/src/imagedialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/imagedialog.o: src/buttonbox.h src/dialog.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/inputdialog.o: /usr/include/sys/types.h /usr/include/features.h
objs/gp2x/src/inputdialog.o: /usr/include/sys/cdefs.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/wordsize.h
objs/gp2x/src/inputdialog.o: /usr/include/gnu/stubs.h
objs/gp2x/src/inputdialog.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/types.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/typesizes.h
objs/gp2x/src/inputdialog.o: /usr/include/time.h /usr/include/endian.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/endian.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/byteswap.h
objs/gp2x/src/inputdialog.o: /usr/include/sys/select.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/select.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/sigset.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/time.h
objs/gp2x/src/inputdialog.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/inputdialog.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/inputdialog.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/inputdialog.o: /usr/include/stdlib.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/waitflags.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/inputdialog.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/inputdialog.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/inputdialog.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/wchar.h /usr/include/ctype.h
objs/gp2x/src/inputdialog.o: /usr/include/iconv.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_gfxPrimitives.h
objs/gp2x/src/inputdialog.o: /usr/include/math.h /usr/include/bits/huge_val.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/huge_valf.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/huge_vall.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/inf.h /usr/include/bits/nan.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/mathdef.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/mathcalls.h src/inputdialog.h
objs/gp2x/src/inputdialog.o: src/gmenu2x.h src/surfacecollection.h
objs/gp2x/src/inputdialog.o: src/iconbutton.h src/button.h src/FastDelegate.h
objs/gp2x/src/inputdialog.o: /usr/include/memory.h src/translator.h
objs/gp2x/src/inputdialog.o: src/utilities.h src/touchscreen.h
objs/gp2x/src/inputdialog.o: /usr/include/fcntl.h /usr/include/bits/fcntl.h
objs/gp2x/src/inputdialog.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/inputdialog.o: src/surface.h src/sfontplus.h
objs/gp2x/src/inputdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/inputdialog.o: src/dialog.h
objs/gp2x/src/inputmanager.o: src/inputmanager.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/inputmanager.o: /usr/include/sys/types.h
objs/gp2x/src/inputmanager.o: /usr/include/features.h
objs/gp2x/src/inputmanager.o: /usr/include/sys/cdefs.h
objs/gp2x/src/inputmanager.o: /usr/include/bits/wordsize.h
objs/gp2x/src/inputmanager.o: /usr/include/gnu/stubs.h
objs/gp2x/src/inputmanager.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/inputmanager.o: /usr/include/bits/types.h
objs/gp2x/src/inputmanager.o: /usr/include/bits/typesizes.h
objs/gp2x/src/inputmanager.o: /usr/include/time.h /usr/include/endian.h
objs/gp2x/src/inputmanager.o: /usr/include/bits/endian.h
objs/gp2x/src/inputmanager.o: /usr/include/bits/byteswap.h
objs/gp2x/src/inputmanager.o: /usr/include/sys/select.h
objs/gp2x/src/inputmanager.o: /usr/include/bits/select.h
objs/gp2x/src/inputmanager.o: /usr/include/bits/sigset.h
objs/gp2x/src/inputmanager.o: /usr/include/bits/time.h
objs/gp2x/src/inputmanager.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/inputmanager.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/inputmanager.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/inputmanager.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/inputmanager.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/inputmanager.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/inputmanager.o: /usr/include/stdlib.h
objs/gp2x/src/inputmanager.o: /usr/include/bits/waitflags.h
objs/gp2x/src/inputmanager.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/inputmanager.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/inputmanager.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/inputmanager.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/inputmanager.o: /usr/include/bits/wchar.h /usr/include/ctype.h
objs/gp2x/src/inputmanager.o: /usr/include/iconv.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/inputmanager.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/inputmanager.o: src/utilities.h src/debug.h
objs/gp2x/src/linkaction.o: src/linkaction.h src/FastDelegate.h
objs/gp2x/src/linkaction.o: /usr/include/memory.h /usr/include/features.h
objs/gp2x/src/linkaction.o: /usr/include/sys/cdefs.h
objs/gp2x/src/linkaction.o: /usr/include/bits/wordsize.h
objs/gp2x/src/linkaction.o: /usr/include/gnu/stubs.h
objs/gp2x/src/linkaction.o: /usr/include/gnu/stubs-64.h src/link.h
objs/gp2x/src/linkaction.o: src/button.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/linkaction.o: /usr/include/sys/types.h
objs/gp2x/src/linkaction.o: /usr/include/bits/types.h
objs/gp2x/src/linkaction.o: /usr/include/bits/typesizes.h /usr/include/time.h
objs/gp2x/src/linkaction.o: /usr/include/endian.h /usr/include/bits/endian.h
objs/gp2x/src/linkaction.o: /usr/include/bits/byteswap.h
objs/gp2x/src/linkaction.o: /usr/include/sys/select.h
objs/gp2x/src/linkaction.o: /usr/include/bits/select.h
objs/gp2x/src/linkaction.o: /usr/include/bits/sigset.h
objs/gp2x/src/linkaction.o: /usr/include/bits/time.h
objs/gp2x/src/linkaction.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/linkaction.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/linkaction.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/linkaction.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/linkaction.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/linkaction.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/linkaction.o: /usr/include/stdlib.h
objs/gp2x/src/linkaction.o: /usr/include/bits/waitflags.h
objs/gp2x/src/linkaction.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/linkaction.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/linkaction.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/linkaction.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/linkaction.o: /usr/include/bits/wchar.h /usr/include/ctype.h
objs/gp2x/src/linkaction.o: /usr/include/iconv.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/linkaction.o: src/surface.h
objs/gp2x/src/linkaction.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/linkapp.o: /usr/include/sys/types.h /usr/include/features.h
objs/gp2x/src/linkapp.o: /usr/include/sys/cdefs.h
objs/gp2x/src/linkapp.o: /usr/include/bits/wordsize.h
objs/gp2x/src/linkapp.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
objs/gp2x/src/linkapp.o: /usr/include/bits/types.h
objs/gp2x/src/linkapp.o: /usr/include/bits/typesizes.h /usr/include/time.h
objs/gp2x/src/linkapp.o: /usr/include/endian.h /usr/include/bits/endian.h
objs/gp2x/src/linkapp.o: /usr/include/bits/byteswap.h
objs/gp2x/src/linkapp.o: /usr/include/sys/select.h /usr/include/bits/select.h
objs/gp2x/src/linkapp.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
objs/gp2x/src/linkapp.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/linkapp.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/linkapp.o: /usr/include/sys/stat.h /usr/include/bits/stat.h
objs/gp2x/src/linkapp.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
objs/gp2x/src/linkapp.o: /usr/include/bits/environments.h
objs/gp2x/src/linkapp.o: /usr/include/bits/confname.h /usr/include/getopt.h
objs/gp2x/src/linkapp.o: src/linkapp.h src/link.h src/button.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/linkapp.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/linkapp.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/linkapp.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/linkapp.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/linkapp.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
objs/gp2x/src/linkapp.o: /usr/include/bits/waitstatus.h /usr/include/alloca.h
objs/gp2x/src/linkapp.o: /usr/include/string.h /usr/include/xlocale.h
objs/gp2x/src/linkapp.o: /usr/include/strings.h /usr/include/inttypes.h
objs/gp2x/src/linkapp.o: /usr/include/stdint.h /usr/include/bits/wchar.h
objs/gp2x/src/linkapp.o: /usr/include/ctype.h /usr/include/iconv.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/linkapp.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/linkapp.o: src/surface.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/linkapp.o: src/menu.h src/linkaction.h src/selector.h
objs/gp2x/src/linkapp.o: src/gmenu2x.h src/surfacecollection.h
objs/gp2x/src/linkapp.o: src/iconbutton.h src/translator.h src/utilities.h
objs/gp2x/src/linkapp.o: src/touchscreen.h /usr/include/fcntl.h
objs/gp2x/src/linkapp.o: /usr/include/bits/fcntl.h src/inputmanager.h
objs/gp2x/src/linkapp.o: src/sfontplus.h
objs/gp2x/src/linkapp.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/linkapp.o: src/dialog.h src/textmanualdialog.h src/textdialog.h
objs/gp2x/src/linkapp.o: src/debug.h
objs/gp2x/src/link.o: src/link.h src/button.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/link.o: /usr/include/sys/types.h /usr/include/features.h
objs/gp2x/src/link.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
objs/gp2x/src/link.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
objs/gp2x/src/link.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
objs/gp2x/src/link.o: /usr/include/time.h /usr/include/endian.h
objs/gp2x/src/link.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
objs/gp2x/src/link.o: /usr/include/sys/select.h /usr/include/bits/select.h
objs/gp2x/src/link.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
objs/gp2x/src/link.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/link.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
objs/gp2x/src/link.o: /usr/include/libio.h /usr/include/_G_config.h
objs/gp2x/src/link.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
objs/gp2x/src/link.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
objs/gp2x/src/link.o: /usr/include/bits/waitflags.h
objs/gp2x/src/link.o: /usr/include/bits/waitstatus.h /usr/include/alloca.h
objs/gp2x/src/link.o: /usr/include/string.h /usr/include/xlocale.h
objs/gp2x/src/link.o: /usr/include/strings.h /usr/include/inttypes.h
objs/gp2x/src/link.o: /usr/include/stdint.h /usr/include/bits/wchar.h
objs/gp2x/src/link.o: /usr/include/ctype.h /usr/include/iconv.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/link.o: src/FastDelegate.h /usr/include/memory.h src/surface.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/link.o: src/menu.h src/linkaction.h src/selector.h
objs/gp2x/src/link.o: src/gmenu2x.h src/surfacecollection.h src/iconbutton.h
objs/gp2x/src/link.o: src/translator.h src/utilities.h src/touchscreen.h
objs/gp2x/src/link.o: /usr/include/fcntl.h /usr/include/bits/fcntl.h
objs/gp2x/src/link.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/link.o: src/sfontplus.h
objs/gp2x/src/link.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/link.o: src/dialog.h
objs/gp2x/src/listview.o: src/listview.h src/gmenu2x.h
objs/gp2x/src/listview.o: src/surfacecollection.h src/iconbutton.h
objs/gp2x/src/listview.o: src/button.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/listview.o: /usr/include/sys/types.h /usr/include/features.h
objs/gp2x/src/listview.o: /usr/include/sys/cdefs.h
objs/gp2x/src/listview.o: /usr/include/bits/wordsize.h
objs/gp2x/src/listview.o: /usr/include/gnu/stubs.h
objs/gp2x/src/listview.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/listview.o: /usr/include/bits/types.h
objs/gp2x/src/listview.o: /usr/include/bits/typesizes.h /usr/include/time.h
objs/gp2x/src/listview.o: /usr/include/endian.h /usr/include/bits/endian.h
objs/gp2x/src/listview.o: /usr/include/bits/byteswap.h
objs/gp2x/src/listview.o: /usr/include/sys/select.h
objs/gp2x/src/listview.o: /usr/include/bits/select.h
objs/gp2x/src/listview.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
objs/gp2x/src/listview.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/listview.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/listview.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/listview.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/listview.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/listview.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/listview.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
objs/gp2x/src/listview.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/listview.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/listview.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/listview.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/listview.o: /usr/include/bits/wchar.h /usr/include/ctype.h
objs/gp2x/src/listview.o: /usr/include/iconv.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/listview.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/listview.o: src/translator.h src/utilities.h src/touchscreen.h
objs/gp2x/src/listview.o: /usr/include/fcntl.h /usr/include/bits/fcntl.h
objs/gp2x/src/listview.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/listview.o: src/surface.h src/sfontplus.h
objs/gp2x/src/listview.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/listview.o: src/listviewitem.h
objs/gp2x/src/listviewitem.o: src/listview.h src/gmenu2x.h
objs/gp2x/src/listviewitem.o: src/surfacecollection.h src/iconbutton.h
objs/gp2x/src/listviewitem.o: src/button.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/listviewitem.o: /usr/include/sys/types.h
objs/gp2x/src/listviewitem.o: /usr/include/features.h
objs/gp2x/src/listviewitem.o: /usr/include/sys/cdefs.h
objs/gp2x/src/listviewitem.o: /usr/include/bits/wordsize.h
objs/gp2x/src/listviewitem.o: /usr/include/gnu/stubs.h
objs/gp2x/src/listviewitem.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/listviewitem.o: /usr/include/bits/types.h
objs/gp2x/src/listviewitem.o: /usr/include/bits/typesizes.h
objs/gp2x/src/listviewitem.o: /usr/include/time.h /usr/include/endian.h
objs/gp2x/src/listviewitem.o: /usr/include/bits/endian.h
objs/gp2x/src/listviewitem.o: /usr/include/bits/byteswap.h
objs/gp2x/src/listviewitem.o: /usr/include/sys/select.h
objs/gp2x/src/listviewitem.o: /usr/include/bits/select.h
objs/gp2x/src/listviewitem.o: /usr/include/bits/sigset.h
objs/gp2x/src/listviewitem.o: /usr/include/bits/time.h
objs/gp2x/src/listviewitem.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/listviewitem.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/listviewitem.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/listviewitem.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/listviewitem.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/listviewitem.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/listviewitem.o: /usr/include/stdlib.h
objs/gp2x/src/listviewitem.o: /usr/include/bits/waitflags.h
objs/gp2x/src/listviewitem.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/listviewitem.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/listviewitem.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/listviewitem.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/listviewitem.o: /usr/include/bits/wchar.h /usr/include/ctype.h
objs/gp2x/src/listviewitem.o: /usr/include/iconv.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/listviewitem.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/listviewitem.o: src/translator.h src/utilities.h
objs/gp2x/src/listviewitem.o: src/touchscreen.h /usr/include/fcntl.h
objs/gp2x/src/listviewitem.o: /usr/include/bits/fcntl.h
objs/gp2x/src/listviewitem.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/listviewitem.o: src/surface.h src/sfontplus.h
objs/gp2x/src/listviewitem.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/listviewitem.o: src/listviewitem.h
objs/gp2x/src/menu.o: /usr/include/sys/stat.h /usr/include/features.h
objs/gp2x/src/menu.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
objs/gp2x/src/menu.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
objs/gp2x/src/menu.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
objs/gp2x/src/menu.o: /usr/include/time.h /usr/include/bits/stat.h
objs/gp2x/src/menu.o: /usr/include/sys/types.h /usr/include/endian.h
objs/gp2x/src/menu.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
objs/gp2x/src/menu.o: /usr/include/sys/select.h /usr/include/bits/select.h
objs/gp2x/src/menu.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
objs/gp2x/src/menu.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/menu.o: /usr/include/bits/pthreadtypes.h /usr/include/dirent.h
objs/gp2x/src/menu.o: /usr/include/bits/dirent.h
objs/gp2x/src/menu.o: /usr/include/bits/posix1_lim.h
objs/gp2x/src/menu.o: /usr/include/bits/local_lim.h
objs/gp2x/src/menu.o: /usr/include/linux/limits.h /usr/include/math.h
objs/gp2x/src/menu.o: /usr/include/bits/huge_val.h
objs/gp2x/src/menu.o: /usr/include/bits/huge_valf.h
objs/gp2x/src/menu.o: /usr/include/bits/huge_vall.h /usr/include/bits/inf.h
objs/gp2x/src/menu.o: /usr/include/bits/nan.h /usr/include/bits/mathdef.h
objs/gp2x/src/menu.o: /usr/include/bits/mathcalls.h src/gmenu2x.h
objs/gp2x/src/menu.o: src/surfacecollection.h src/iconbutton.h src/button.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/menu.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/menu.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/menu.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/menu.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
objs/gp2x/src/menu.o: /usr/include/bits/waitflags.h
objs/gp2x/src/menu.o: /usr/include/bits/waitstatus.h /usr/include/alloca.h
objs/gp2x/src/menu.o: /usr/include/string.h /usr/include/xlocale.h
objs/gp2x/src/menu.o: /usr/include/strings.h /usr/include/inttypes.h
objs/gp2x/src/menu.o: /usr/include/stdint.h /usr/include/bits/wchar.h
objs/gp2x/src/menu.o: /usr/include/ctype.h /usr/include/iconv.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/menu.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/menu.o: src/translator.h src/utilities.h src/touchscreen.h
objs/gp2x/src/menu.o: /usr/include/fcntl.h /usr/include/bits/fcntl.h
objs/gp2x/src/menu.o: src/inputmanager.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/menu.o: src/surface.h src/sfontplus.h
objs/gp2x/src/menu.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/menu.o: src/linkapp.h src/link.h src/menu.h src/linkaction.h
objs/gp2x/src/menu.o: src/filelister.h src/debug.h
objs/gp2x/src/menusettingbool.o: src/menusettingbool.h src/menusetting.h
objs/gp2x/src/menusettingbool.o: src/buttonbox.h src/gmenu2x.h
objs/gp2x/src/menusettingbool.o: src/surfacecollection.h src/iconbutton.h
objs/gp2x/src/menusettingbool.o: src/button.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/menusettingbool.o: /usr/include/sys/types.h
objs/gp2x/src/menusettingbool.o: /usr/include/features.h
objs/gp2x/src/menusettingbool.o: /usr/include/sys/cdefs.h
objs/gp2x/src/menusettingbool.o: /usr/include/bits/wordsize.h
objs/gp2x/src/menusettingbool.o: /usr/include/gnu/stubs.h
objs/gp2x/src/menusettingbool.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/menusettingbool.o: /usr/include/bits/types.h
objs/gp2x/src/menusettingbool.o: /usr/include/bits/typesizes.h
objs/gp2x/src/menusettingbool.o: /usr/include/time.h /usr/include/endian.h
objs/gp2x/src/menusettingbool.o: /usr/include/bits/endian.h
objs/gp2x/src/menusettingbool.o: /usr/include/bits/byteswap.h
objs/gp2x/src/menusettingbool.o: /usr/include/sys/select.h
objs/gp2x/src/menusettingbool.o: /usr/include/bits/select.h
objs/gp2x/src/menusettingbool.o: /usr/include/bits/sigset.h
objs/gp2x/src/menusettingbool.o: /usr/include/bits/time.h
objs/gp2x/src/menusettingbool.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/menusettingbool.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/menusettingbool.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/menusettingbool.o: /usr/include/_G_config.h
objs/gp2x/src/menusettingbool.o: /usr/include/wchar.h
objs/gp2x/src/menusettingbool.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/menusettingbool.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/menusettingbool.o: /usr/include/stdlib.h
objs/gp2x/src/menusettingbool.o: /usr/include/bits/waitflags.h
objs/gp2x/src/menusettingbool.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/menusettingbool.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/menusettingbool.o: /usr/include/xlocale.h
objs/gp2x/src/menusettingbool.o: /usr/include/strings.h
objs/gp2x/src/menusettingbool.o: /usr/include/inttypes.h
objs/gp2x/src/menusettingbool.o: /usr/include/stdint.h
objs/gp2x/src/menusettingbool.o: /usr/include/bits/wchar.h
objs/gp2x/src/menusettingbool.o: /usr/include/ctype.h /usr/include/iconv.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/menusettingbool.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/menusettingbool.o: src/translator.h src/utilities.h
objs/gp2x/src/menusettingbool.o: src/touchscreen.h /usr/include/fcntl.h
objs/gp2x/src/menusettingbool.o: /usr/include/bits/fcntl.h
objs/gp2x/src/menusettingbool.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/menusettingbool.o: src/surface.h src/sfontplus.h
objs/gp2x/src/menusettingbool.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/menusetting.o: src/menusetting.h src/buttonbox.h
objs/gp2x/src/menusetting.o: src/sfontplus.h src/surface.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/menusetting.o: /usr/include/sys/types.h /usr/include/features.h
objs/gp2x/src/menusetting.o: /usr/include/sys/cdefs.h
objs/gp2x/src/menusetting.o: /usr/include/bits/wordsize.h
objs/gp2x/src/menusetting.o: /usr/include/gnu/stubs.h
objs/gp2x/src/menusetting.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/menusetting.o: /usr/include/bits/types.h
objs/gp2x/src/menusetting.o: /usr/include/bits/typesizes.h
objs/gp2x/src/menusetting.o: /usr/include/time.h /usr/include/endian.h
objs/gp2x/src/menusetting.o: /usr/include/bits/endian.h
objs/gp2x/src/menusetting.o: /usr/include/bits/byteswap.h
objs/gp2x/src/menusetting.o: /usr/include/sys/select.h
objs/gp2x/src/menusetting.o: /usr/include/bits/select.h
objs/gp2x/src/menusetting.o: /usr/include/bits/sigset.h
objs/gp2x/src/menusetting.o: /usr/include/bits/time.h
objs/gp2x/src/menusetting.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/menusetting.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/menusetting.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/menusetting.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/menusetting.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/menusetting.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/menusetting.o: /usr/include/stdlib.h
objs/gp2x/src/menusetting.o: /usr/include/bits/waitflags.h
objs/gp2x/src/menusetting.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/menusetting.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/menusetting.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/menusetting.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/menusetting.o: /usr/include/bits/wchar.h /usr/include/ctype.h
objs/gp2x/src/menusetting.o: /usr/include/iconv.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/menusetting.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/menusetting.o: src/gmenu2x.h src/surfacecollection.h
objs/gp2x/src/menusetting.o: src/iconbutton.h src/button.h src/FastDelegate.h
objs/gp2x/src/menusetting.o: /usr/include/memory.h src/translator.h
objs/gp2x/src/menusetting.o: src/utilities.h src/touchscreen.h
objs/gp2x/src/menusetting.o: /usr/include/fcntl.h /usr/include/bits/fcntl.h
objs/gp2x/src/menusetting.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/menusettingdir.o: src/menusettingdir.h
objs/gp2x/src/menusettingdir.o: src/menusettingstringbase.h src/menusetting.h
objs/gp2x/src/menusettingdir.o: src/buttonbox.h src/iconbutton.h src/button.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/menusettingdir.o: /usr/include/sys/types.h
objs/gp2x/src/menusettingdir.o: /usr/include/features.h
objs/gp2x/src/menusettingdir.o: /usr/include/sys/cdefs.h
objs/gp2x/src/menusettingdir.o: /usr/include/bits/wordsize.h
objs/gp2x/src/menusettingdir.o: /usr/include/gnu/stubs.h
objs/gp2x/src/menusettingdir.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/menusettingdir.o: /usr/include/bits/types.h
objs/gp2x/src/menusettingdir.o: /usr/include/bits/typesizes.h
objs/gp2x/src/menusettingdir.o: /usr/include/time.h /usr/include/endian.h
objs/gp2x/src/menusettingdir.o: /usr/include/bits/endian.h
objs/gp2x/src/menusettingdir.o: /usr/include/bits/byteswap.h
objs/gp2x/src/menusettingdir.o: /usr/include/sys/select.h
objs/gp2x/src/menusettingdir.o: /usr/include/bits/select.h
objs/gp2x/src/menusettingdir.o: /usr/include/bits/sigset.h
objs/gp2x/src/menusettingdir.o: /usr/include/bits/time.h
objs/gp2x/src/menusettingdir.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/menusettingdir.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/menusettingdir.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/menusettingdir.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/menusettingdir.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/menusettingdir.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/menusettingdir.o: /usr/include/stdlib.h
objs/gp2x/src/menusettingdir.o: /usr/include/bits/waitflags.h
objs/gp2x/src/menusettingdir.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/menusettingdir.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/menusettingdir.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/menusettingdir.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/menusettingdir.o: /usr/include/bits/wchar.h
objs/gp2x/src/menusettingdir.o: /usr/include/ctype.h /usr/include/iconv.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/menusettingdir.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/menusettingdir.o: src/dirdialog.h src/gmenu2x.h
objs/gp2x/src/menusettingdir.o: src/surfacecollection.h src/translator.h
objs/gp2x/src/menusettingdir.o: src/utilities.h src/touchscreen.h
objs/gp2x/src/menusettingdir.o: /usr/include/fcntl.h
objs/gp2x/src/menusettingdir.o: /usr/include/bits/fcntl.h
objs/gp2x/src/menusettingdir.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/menusettingdir.o: src/surface.h src/sfontplus.h
objs/gp2x/src/menusettingdir.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/menusettingdir.o: src/browsedialog.h src/filelister.h
objs/gp2x/src/menusettingdir.o: src/dialog.h
objs/gp2x/src/menusettingfile.o: src/menusettingfile.h
objs/gp2x/src/menusettingfile.o: src/menusettingstringbase.h
objs/gp2x/src/menusettingfile.o: src/menusetting.h src/buttonbox.h
objs/gp2x/src/menusettingfile.o: src/iconbutton.h src/button.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/menusettingfile.o: /usr/include/sys/types.h
objs/gp2x/src/menusettingfile.o: /usr/include/features.h
objs/gp2x/src/menusettingfile.o: /usr/include/sys/cdefs.h
objs/gp2x/src/menusettingfile.o: /usr/include/bits/wordsize.h
objs/gp2x/src/menusettingfile.o: /usr/include/gnu/stubs.h
objs/gp2x/src/menusettingfile.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/menusettingfile.o: /usr/include/bits/types.h
objs/gp2x/src/menusettingfile.o: /usr/include/bits/typesizes.h
objs/gp2x/src/menusettingfile.o: /usr/include/time.h /usr/include/endian.h
objs/gp2x/src/menusettingfile.o: /usr/include/bits/endian.h
objs/gp2x/src/menusettingfile.o: /usr/include/bits/byteswap.h
objs/gp2x/src/menusettingfile.o: /usr/include/sys/select.h
objs/gp2x/src/menusettingfile.o: /usr/include/bits/select.h
objs/gp2x/src/menusettingfile.o: /usr/include/bits/sigset.h
objs/gp2x/src/menusettingfile.o: /usr/include/bits/time.h
objs/gp2x/src/menusettingfile.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/menusettingfile.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/menusettingfile.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/menusettingfile.o: /usr/include/_G_config.h
objs/gp2x/src/menusettingfile.o: /usr/include/wchar.h
objs/gp2x/src/menusettingfile.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/menusettingfile.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/menusettingfile.o: /usr/include/stdlib.h
objs/gp2x/src/menusettingfile.o: /usr/include/bits/waitflags.h
objs/gp2x/src/menusettingfile.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/menusettingfile.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/menusettingfile.o: /usr/include/xlocale.h
objs/gp2x/src/menusettingfile.o: /usr/include/strings.h
objs/gp2x/src/menusettingfile.o: /usr/include/inttypes.h
objs/gp2x/src/menusettingfile.o: /usr/include/stdint.h
objs/gp2x/src/menusettingfile.o: /usr/include/bits/wchar.h
objs/gp2x/src/menusettingfile.o: /usr/include/ctype.h /usr/include/iconv.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/menusettingfile.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/menusettingfile.o: src/filedialog.h src/browsedialog.h
objs/gp2x/src/menusettingfile.o: src/filelister.h src/gmenu2x.h
objs/gp2x/src/menusettingfile.o: src/surfacecollection.h src/translator.h
objs/gp2x/src/menusettingfile.o: src/utilities.h src/touchscreen.h
objs/gp2x/src/menusettingfile.o: /usr/include/fcntl.h
objs/gp2x/src/menusettingfile.o: /usr/include/bits/fcntl.h
objs/gp2x/src/menusettingfile.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/menusettingfile.o: src/surface.h src/sfontplus.h
objs/gp2x/src/menusettingfile.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/menusettingfile.o: src/dialog.h
objs/gp2x/src/menusettingimage.o: src/menusettingimage.h
objs/gp2x/src/menusettingimage.o: src/menusettingfile.h
objs/gp2x/src/menusettingimage.o: src/menusettingstringbase.h
objs/gp2x/src/menusettingimage.o: src/menusetting.h src/buttonbox.h
objs/gp2x/src/menusettingimage.o: src/imagedialog.h src/filedialog.h
objs/gp2x/src/menusettingimage.o: src/browsedialog.h src/filelister.h
objs/gp2x/src/menusettingimage.o: src/gmenu2x.h src/surfacecollection.h
objs/gp2x/src/menusettingimage.o: src/iconbutton.h src/button.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/menusettingimage.o: /usr/include/sys/types.h
objs/gp2x/src/menusettingimage.o: /usr/include/features.h
objs/gp2x/src/menusettingimage.o: /usr/include/sys/cdefs.h
objs/gp2x/src/menusettingimage.o: /usr/include/bits/wordsize.h
objs/gp2x/src/menusettingimage.o: /usr/include/gnu/stubs.h
objs/gp2x/src/menusettingimage.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/menusettingimage.o: /usr/include/bits/types.h
objs/gp2x/src/menusettingimage.o: /usr/include/bits/typesizes.h
objs/gp2x/src/menusettingimage.o: /usr/include/time.h /usr/include/endian.h
objs/gp2x/src/menusettingimage.o: /usr/include/bits/endian.h
objs/gp2x/src/menusettingimage.o: /usr/include/bits/byteswap.h
objs/gp2x/src/menusettingimage.o: /usr/include/sys/select.h
objs/gp2x/src/menusettingimage.o: /usr/include/bits/select.h
objs/gp2x/src/menusettingimage.o: /usr/include/bits/sigset.h
objs/gp2x/src/menusettingimage.o: /usr/include/bits/time.h
objs/gp2x/src/menusettingimage.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/menusettingimage.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/menusettingimage.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/menusettingimage.o: /usr/include/_G_config.h
objs/gp2x/src/menusettingimage.o: /usr/include/wchar.h
objs/gp2x/src/menusettingimage.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/menusettingimage.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/menusettingimage.o: /usr/include/stdlib.h
objs/gp2x/src/menusettingimage.o: /usr/include/bits/waitflags.h
objs/gp2x/src/menusettingimage.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/menusettingimage.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/menusettingimage.o: /usr/include/xlocale.h
objs/gp2x/src/menusettingimage.o: /usr/include/strings.h
objs/gp2x/src/menusettingimage.o: /usr/include/inttypes.h
objs/gp2x/src/menusettingimage.o: /usr/include/stdint.h
objs/gp2x/src/menusettingimage.o: /usr/include/bits/wchar.h
objs/gp2x/src/menusettingimage.o: /usr/include/ctype.h /usr/include/iconv.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/menusettingimage.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/menusettingimage.o: src/translator.h src/utilities.h
objs/gp2x/src/menusettingimage.o: src/touchscreen.h /usr/include/fcntl.h
objs/gp2x/src/menusettingimage.o: /usr/include/bits/fcntl.h
objs/gp2x/src/menusettingimage.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/menusettingimage.o: src/surface.h src/sfontplus.h
objs/gp2x/src/menusettingimage.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/menusettingimage.o: src/dialog.h
objs/gp2x/src/menusettingint.o: src/menusettingint.h src/menusetting.h
objs/gp2x/src/menusettingint.o: src/buttonbox.h src/gmenu2x.h
objs/gp2x/src/menusettingint.o: src/surfacecollection.h src/iconbutton.h
objs/gp2x/src/menusettingint.o: src/button.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/menusettingint.o: /usr/include/sys/types.h
objs/gp2x/src/menusettingint.o: /usr/include/features.h
objs/gp2x/src/menusettingint.o: /usr/include/sys/cdefs.h
objs/gp2x/src/menusettingint.o: /usr/include/bits/wordsize.h
objs/gp2x/src/menusettingint.o: /usr/include/gnu/stubs.h
objs/gp2x/src/menusettingint.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/menusettingint.o: /usr/include/bits/types.h
objs/gp2x/src/menusettingint.o: /usr/include/bits/typesizes.h
objs/gp2x/src/menusettingint.o: /usr/include/time.h /usr/include/endian.h
objs/gp2x/src/menusettingint.o: /usr/include/bits/endian.h
objs/gp2x/src/menusettingint.o: /usr/include/bits/byteswap.h
objs/gp2x/src/menusettingint.o: /usr/include/sys/select.h
objs/gp2x/src/menusettingint.o: /usr/include/bits/select.h
objs/gp2x/src/menusettingint.o: /usr/include/bits/sigset.h
objs/gp2x/src/menusettingint.o: /usr/include/bits/time.h
objs/gp2x/src/menusettingint.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/menusettingint.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/menusettingint.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/menusettingint.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/menusettingint.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/menusettingint.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/menusettingint.o: /usr/include/stdlib.h
objs/gp2x/src/menusettingint.o: /usr/include/bits/waitflags.h
objs/gp2x/src/menusettingint.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/menusettingint.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/menusettingint.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/menusettingint.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/menusettingint.o: /usr/include/bits/wchar.h
objs/gp2x/src/menusettingint.o: /usr/include/ctype.h /usr/include/iconv.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/menusettingint.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/menusettingint.o: src/translator.h src/utilities.h
objs/gp2x/src/menusettingint.o: src/touchscreen.h /usr/include/fcntl.h
objs/gp2x/src/menusettingint.o: /usr/include/bits/fcntl.h
objs/gp2x/src/menusettingint.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/menusettingint.o: src/surface.h src/sfontplus.h
objs/gp2x/src/menusettingint.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/menusettingmultistring.o: src/menusettingmultistring.h
objs/gp2x/src/menusettingmultistring.o: src/menusettingstringbase.h
objs/gp2x/src/menusettingmultistring.o: src/menusetting.h src/buttonbox.h
objs/gp2x/src/menusettingmultistring.o: src/gmenu2x.h src/surfacecollection.h
objs/gp2x/src/menusettingmultistring.o: src/iconbutton.h src/button.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/sys/types.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/features.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/sys/cdefs.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/bits/wordsize.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/gnu/stubs.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/bits/types.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/bits/typesizes.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/time.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/endian.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/bits/endian.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/bits/byteswap.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/sys/select.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/bits/select.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/bits/sigset.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/bits/time.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/stdio.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/libio.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/_G_config.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/wchar.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/stdlib.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/bits/waitflags.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/alloca.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/string.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/xlocale.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/strings.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/inttypes.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/stdint.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/bits/wchar.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/ctype.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/iconv.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/menusettingmultistring.o: src/FastDelegate.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/memory.h
objs/gp2x/src/menusettingmultistring.o: src/translator.h src/utilities.h
objs/gp2x/src/menusettingmultistring.o: src/touchscreen.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/fcntl.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/bits/fcntl.h
objs/gp2x/src/menusettingmultistring.o: /usr/include/bits/stat.h
objs/gp2x/src/menusettingmultistring.o: src/inputmanager.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/menusettingmultistring.o: src/surface.h src/sfontplus.h
objs/gp2x/src/menusettingmultistring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/menusettingrgba.o: src/menusettingrgba.h src/menusetting.h
objs/gp2x/src/menusettingrgba.o: src/buttonbox.h src/surface.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/menusettingrgba.o: /usr/include/sys/types.h
objs/gp2x/src/menusettingrgba.o: /usr/include/features.h
objs/gp2x/src/menusettingrgba.o: /usr/include/sys/cdefs.h
objs/gp2x/src/menusettingrgba.o: /usr/include/bits/wordsize.h
objs/gp2x/src/menusettingrgba.o: /usr/include/gnu/stubs.h
objs/gp2x/src/menusettingrgba.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/menusettingrgba.o: /usr/include/bits/types.h
objs/gp2x/src/menusettingrgba.o: /usr/include/bits/typesizes.h
objs/gp2x/src/menusettingrgba.o: /usr/include/time.h /usr/include/endian.h
objs/gp2x/src/menusettingrgba.o: /usr/include/bits/endian.h
objs/gp2x/src/menusettingrgba.o: /usr/include/bits/byteswap.h
objs/gp2x/src/menusettingrgba.o: /usr/include/sys/select.h
objs/gp2x/src/menusettingrgba.o: /usr/include/bits/select.h
objs/gp2x/src/menusettingrgba.o: /usr/include/bits/sigset.h
objs/gp2x/src/menusettingrgba.o: /usr/include/bits/time.h
objs/gp2x/src/menusettingrgba.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/menusettingrgba.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/menusettingrgba.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/menusettingrgba.o: /usr/include/_G_config.h
objs/gp2x/src/menusettingrgba.o: /usr/include/wchar.h
objs/gp2x/src/menusettingrgba.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/menusettingrgba.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/menusettingrgba.o: /usr/include/stdlib.h
objs/gp2x/src/menusettingrgba.o: /usr/include/bits/waitflags.h
objs/gp2x/src/menusettingrgba.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/menusettingrgba.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/menusettingrgba.o: /usr/include/xlocale.h
objs/gp2x/src/menusettingrgba.o: /usr/include/strings.h
objs/gp2x/src/menusettingrgba.o: /usr/include/inttypes.h
objs/gp2x/src/menusettingrgba.o: /usr/include/stdint.h
objs/gp2x/src/menusettingrgba.o: /usr/include/bits/wchar.h
objs/gp2x/src/menusettingrgba.o: /usr/include/ctype.h /usr/include/iconv.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/menusettingrgba.o: src/gmenu2x.h src/surfacecollection.h
objs/gp2x/src/menusettingrgba.o: src/iconbutton.h src/button.h
objs/gp2x/src/menusettingrgba.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/menusettingrgba.o: src/translator.h src/utilities.h
objs/gp2x/src/menusettingrgba.o: src/touchscreen.h /usr/include/fcntl.h
objs/gp2x/src/menusettingrgba.o: /usr/include/bits/fcntl.h
objs/gp2x/src/menusettingrgba.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/menusettingrgba.o: src/sfontplus.h
objs/gp2x/src/menusettingrgba.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/menusettingstringbase.o: src/menusettingstringbase.h
objs/gp2x/src/menusettingstringbase.o: src/menusetting.h src/buttonbox.h
objs/gp2x/src/menusettingstringbase.o: src/gmenu2x.h src/surfacecollection.h
objs/gp2x/src/menusettingstringbase.o: src/iconbutton.h src/button.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/sys/types.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/features.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/sys/cdefs.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/bits/wordsize.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/gnu/stubs.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/bits/types.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/bits/typesizes.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/time.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/endian.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/bits/endian.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/bits/byteswap.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/sys/select.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/bits/select.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/bits/sigset.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/bits/time.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/stdio.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/libio.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/_G_config.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/wchar.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/stdlib.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/bits/waitflags.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/alloca.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/string.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/xlocale.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/strings.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/inttypes.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/stdint.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/bits/wchar.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/ctype.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/iconv.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/menusettingstringbase.o: src/FastDelegate.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/memory.h src/translator.h
objs/gp2x/src/menusettingstringbase.o: src/utilities.h src/touchscreen.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/fcntl.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/bits/fcntl.h
objs/gp2x/src/menusettingstringbase.o: /usr/include/bits/stat.h
objs/gp2x/src/menusettingstringbase.o: src/inputmanager.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/menusettingstringbase.o: src/surface.h src/sfontplus.h
objs/gp2x/src/menusettingstringbase.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/menusettingstring.o: src/menusettingstring.h
objs/gp2x/src/menusettingstring.o: src/menusettingstringbase.h
objs/gp2x/src/menusettingstring.o: src/menusetting.h src/buttonbox.h
objs/gp2x/src/menusettingstring.o: src/iconbutton.h src/button.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/menusettingstring.o: /usr/include/sys/types.h
objs/gp2x/src/menusettingstring.o: /usr/include/features.h
objs/gp2x/src/menusettingstring.o: /usr/include/sys/cdefs.h
objs/gp2x/src/menusettingstring.o: /usr/include/bits/wordsize.h
objs/gp2x/src/menusettingstring.o: /usr/include/gnu/stubs.h
objs/gp2x/src/menusettingstring.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/menusettingstring.o: /usr/include/bits/types.h
objs/gp2x/src/menusettingstring.o: /usr/include/bits/typesizes.h
objs/gp2x/src/menusettingstring.o: /usr/include/time.h /usr/include/endian.h
objs/gp2x/src/menusettingstring.o: /usr/include/bits/endian.h
objs/gp2x/src/menusettingstring.o: /usr/include/bits/byteswap.h
objs/gp2x/src/menusettingstring.o: /usr/include/sys/select.h
objs/gp2x/src/menusettingstring.o: /usr/include/bits/select.h
objs/gp2x/src/menusettingstring.o: /usr/include/bits/sigset.h
objs/gp2x/src/menusettingstring.o: /usr/include/bits/time.h
objs/gp2x/src/menusettingstring.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/menusettingstring.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/menusettingstring.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/menusettingstring.o: /usr/include/_G_config.h
objs/gp2x/src/menusettingstring.o: /usr/include/wchar.h
objs/gp2x/src/menusettingstring.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/menusettingstring.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/menusettingstring.o: /usr/include/stdlib.h
objs/gp2x/src/menusettingstring.o: /usr/include/bits/waitflags.h
objs/gp2x/src/menusettingstring.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/menusettingstring.o: /usr/include/alloca.h
objs/gp2x/src/menusettingstring.o: /usr/include/string.h
objs/gp2x/src/menusettingstring.o: /usr/include/xlocale.h
objs/gp2x/src/menusettingstring.o: /usr/include/strings.h
objs/gp2x/src/menusettingstring.o: /usr/include/inttypes.h
objs/gp2x/src/menusettingstring.o: /usr/include/stdint.h
objs/gp2x/src/menusettingstring.o: /usr/include/bits/wchar.h
objs/gp2x/src/menusettingstring.o: /usr/include/ctype.h /usr/include/iconv.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/menusettingstring.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/menusettingstring.o: src/inputdialog.h src/gmenu2x.h
objs/gp2x/src/menusettingstring.o: src/surfacecollection.h src/translator.h
objs/gp2x/src/menusettingstring.o: src/utilities.h src/touchscreen.h
objs/gp2x/src/menusettingstring.o: /usr/include/fcntl.h
objs/gp2x/src/menusettingstring.o: /usr/include/bits/fcntl.h
objs/gp2x/src/menusettingstring.o: /usr/include/bits/stat.h
objs/gp2x/src/menusettingstring.o: src/inputmanager.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/menusettingstring.o: src/surface.h src/sfontplus.h
objs/gp2x/src/menusettingstring.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/menusettingstring.o: src/dialog.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/messagebox.o: /usr/include/sys/types.h /usr/include/features.h
objs/gp2x/src/messagebox.o: /usr/include/sys/cdefs.h
objs/gp2x/src/messagebox.o: /usr/include/bits/wordsize.h
objs/gp2x/src/messagebox.o: /usr/include/gnu/stubs.h
objs/gp2x/src/messagebox.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/messagebox.o: /usr/include/bits/types.h
objs/gp2x/src/messagebox.o: /usr/include/bits/typesizes.h /usr/include/time.h
objs/gp2x/src/messagebox.o: /usr/include/endian.h /usr/include/bits/endian.h
objs/gp2x/src/messagebox.o: /usr/include/bits/byteswap.h
objs/gp2x/src/messagebox.o: /usr/include/sys/select.h
objs/gp2x/src/messagebox.o: /usr/include/bits/select.h
objs/gp2x/src/messagebox.o: /usr/include/bits/sigset.h
objs/gp2x/src/messagebox.o: /usr/include/bits/time.h
objs/gp2x/src/messagebox.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/messagebox.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/messagebox.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/messagebox.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/messagebox.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/messagebox.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/messagebox.o: /usr/include/stdlib.h
objs/gp2x/src/messagebox.o: /usr/include/bits/waitflags.h
objs/gp2x/src/messagebox.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/messagebox.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/messagebox.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/messagebox.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/messagebox.o: /usr/include/bits/wchar.h /usr/include/ctype.h
objs/gp2x/src/messagebox.o: /usr/include/iconv.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_gfxPrimitives.h
objs/gp2x/src/messagebox.o: /usr/include/math.h /usr/include/bits/huge_val.h
objs/gp2x/src/messagebox.o: /usr/include/bits/huge_valf.h
objs/gp2x/src/messagebox.o: /usr/include/bits/huge_vall.h
objs/gp2x/src/messagebox.o: /usr/include/bits/inf.h /usr/include/bits/nan.h
objs/gp2x/src/messagebox.o: /usr/include/bits/mathdef.h
objs/gp2x/src/messagebox.o: /usr/include/bits/mathcalls.h src/messagebox.h
objs/gp2x/src/messagebox.o: src/gmenu2x.h src/surfacecollection.h
objs/gp2x/src/messagebox.o: src/iconbutton.h src/button.h src/FastDelegate.h
objs/gp2x/src/messagebox.o: /usr/include/memory.h src/translator.h
objs/gp2x/src/messagebox.o: src/utilities.h src/touchscreen.h
objs/gp2x/src/messagebox.o: /usr/include/fcntl.h /usr/include/bits/fcntl.h
objs/gp2x/src/messagebox.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/messagebox.o: src/surface.h src/sfontplus.h
objs/gp2x/src/messagebox.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/selector.o: /usr/include/sys/types.h /usr/include/features.h
objs/gp2x/src/selector.o: /usr/include/sys/cdefs.h
objs/gp2x/src/selector.o: /usr/include/bits/wordsize.h
objs/gp2x/src/selector.o: /usr/include/gnu/stubs.h
objs/gp2x/src/selector.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/selector.o: /usr/include/bits/types.h
objs/gp2x/src/selector.o: /usr/include/bits/typesizes.h /usr/include/time.h
objs/gp2x/src/selector.o: /usr/include/endian.h /usr/include/bits/endian.h
objs/gp2x/src/selector.o: /usr/include/bits/byteswap.h
objs/gp2x/src/selector.o: /usr/include/sys/select.h
objs/gp2x/src/selector.o: /usr/include/bits/select.h
objs/gp2x/src/selector.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
objs/gp2x/src/selector.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/selector.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/selector.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/selector.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/selector.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/selector.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/selector.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
objs/gp2x/src/selector.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/selector.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/selector.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/selector.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/selector.o: /usr/include/bits/wchar.h /usr/include/ctype.h
objs/gp2x/src/selector.o: /usr/include/iconv.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_gfxPrimitives.h
objs/gp2x/src/selector.o: /usr/include/math.h /usr/include/bits/huge_val.h
objs/gp2x/src/selector.o: /usr/include/bits/huge_valf.h
objs/gp2x/src/selector.o: /usr/include/bits/huge_vall.h
objs/gp2x/src/selector.o: /usr/include/bits/inf.h /usr/include/bits/nan.h
objs/gp2x/src/selector.o: /usr/include/bits/mathdef.h
objs/gp2x/src/selector.o: /usr/include/bits/mathcalls.h
objs/gp2x/src/selector.o: /usr/include/sys/stat.h /usr/include/bits/stat.h
objs/gp2x/src/selector.o: /usr/include/dirent.h /usr/include/bits/dirent.h
objs/gp2x/src/selector.o: /usr/include/bits/posix1_lim.h
objs/gp2x/src/selector.o: /usr/include/bits/local_lim.h
objs/gp2x/src/selector.o: /usr/include/linux/limits.h src/menu.h
objs/gp2x/src/selector.o: src/linkaction.h src/FastDelegate.h
objs/gp2x/src/selector.o: /usr/include/memory.h src/link.h src/button.h
objs/gp2x/src/selector.o: src/surface.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/selector.o: src/linkapp.h src/selector.h src/gmenu2x.h
objs/gp2x/src/selector.o: src/surfacecollection.h src/iconbutton.h
objs/gp2x/src/selector.o: src/translator.h src/utilities.h src/touchscreen.h
objs/gp2x/src/selector.o: /usr/include/fcntl.h /usr/include/bits/fcntl.h
objs/gp2x/src/selector.o: src/inputmanager.h src/sfontplus.h
objs/gp2x/src/selector.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/selector.o: src/dialog.h src/filelister.h src/debug.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/settingsdialog.o: /usr/include/sys/types.h
objs/gp2x/src/settingsdialog.o: /usr/include/features.h
objs/gp2x/src/settingsdialog.o: /usr/include/sys/cdefs.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/wordsize.h
objs/gp2x/src/settingsdialog.o: /usr/include/gnu/stubs.h
objs/gp2x/src/settingsdialog.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/types.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/typesizes.h
objs/gp2x/src/settingsdialog.o: /usr/include/time.h /usr/include/endian.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/endian.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/byteswap.h
objs/gp2x/src/settingsdialog.o: /usr/include/sys/select.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/select.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/sigset.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/time.h
objs/gp2x/src/settingsdialog.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/settingsdialog.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/settingsdialog.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/settingsdialog.o: /usr/include/stdlib.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/waitflags.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/settingsdialog.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/settingsdialog.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/settingsdialog.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/wchar.h
objs/gp2x/src/settingsdialog.o: /usr/include/ctype.h /usr/include/iconv.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_gfxPrimitives.h
objs/gp2x/src/settingsdialog.o: /usr/include/math.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/huge_val.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/huge_valf.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/huge_vall.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/inf.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/nan.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/mathdef.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/mathcalls.h
objs/gp2x/src/settingsdialog.o: src/settingsdialog.h src/gmenu2x.h
objs/gp2x/src/settingsdialog.o: src/surfacecollection.h src/iconbutton.h
objs/gp2x/src/settingsdialog.o: src/button.h src/FastDelegate.h
objs/gp2x/src/settingsdialog.o: /usr/include/memory.h src/translator.h
objs/gp2x/src/settingsdialog.o: src/utilities.h src/touchscreen.h
objs/gp2x/src/settingsdialog.o: /usr/include/fcntl.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/fcntl.h
objs/gp2x/src/settingsdialog.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/settingsdialog.o: src/surface.h src/sfontplus.h
objs/gp2x/src/settingsdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/settingsdialog.o: src/menusetting.h src/buttonbox.h
objs/gp2x/src/settingsdialog.o: src/dialog.h
objs/gp2x/src/sfontplus.o: src/sfontplus.h src/surface.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/sfontplus.o: /usr/include/sys/types.h /usr/include/features.h
objs/gp2x/src/sfontplus.o: /usr/include/sys/cdefs.h
objs/gp2x/src/sfontplus.o: /usr/include/bits/wordsize.h
objs/gp2x/src/sfontplus.o: /usr/include/gnu/stubs.h
objs/gp2x/src/sfontplus.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/sfontplus.o: /usr/include/bits/types.h
objs/gp2x/src/sfontplus.o: /usr/include/bits/typesizes.h /usr/include/time.h
objs/gp2x/src/sfontplus.o: /usr/include/endian.h /usr/include/bits/endian.h
objs/gp2x/src/sfontplus.o: /usr/include/bits/byteswap.h
objs/gp2x/src/sfontplus.o: /usr/include/sys/select.h
objs/gp2x/src/sfontplus.o: /usr/include/bits/select.h
objs/gp2x/src/sfontplus.o: /usr/include/bits/sigset.h
objs/gp2x/src/sfontplus.o: /usr/include/bits/time.h
objs/gp2x/src/sfontplus.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/sfontplus.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/sfontplus.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/sfontplus.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/sfontplus.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/sfontplus.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/sfontplus.o: /usr/include/stdlib.h
objs/gp2x/src/sfontplus.o: /usr/include/bits/waitflags.h
objs/gp2x/src/sfontplus.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/sfontplus.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/sfontplus.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/sfontplus.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/sfontplus.o: /usr/include/bits/wchar.h /usr/include/ctype.h
objs/gp2x/src/sfontplus.o: /usr/include/iconv.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/sfontplus.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/sfontplus.o: src/utilities.h src/debug.h
objs/gp2x/src/surfacecollection.o: src/surfacecollection.h src/surface.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/surfacecollection.o: /usr/include/sys/types.h
objs/gp2x/src/surfacecollection.o: /usr/include/features.h
objs/gp2x/src/surfacecollection.o: /usr/include/sys/cdefs.h
objs/gp2x/src/surfacecollection.o: /usr/include/bits/wordsize.h
objs/gp2x/src/surfacecollection.o: /usr/include/gnu/stubs.h
objs/gp2x/src/surfacecollection.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/surfacecollection.o: /usr/include/bits/types.h
objs/gp2x/src/surfacecollection.o: /usr/include/bits/typesizes.h
objs/gp2x/src/surfacecollection.o: /usr/include/time.h /usr/include/endian.h
objs/gp2x/src/surfacecollection.o: /usr/include/bits/endian.h
objs/gp2x/src/surfacecollection.o: /usr/include/bits/byteswap.h
objs/gp2x/src/surfacecollection.o: /usr/include/sys/select.h
objs/gp2x/src/surfacecollection.o: /usr/include/bits/select.h
objs/gp2x/src/surfacecollection.o: /usr/include/bits/sigset.h
objs/gp2x/src/surfacecollection.o: /usr/include/bits/time.h
objs/gp2x/src/surfacecollection.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/surfacecollection.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/surfacecollection.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/surfacecollection.o: /usr/include/_G_config.h
objs/gp2x/src/surfacecollection.o: /usr/include/wchar.h
objs/gp2x/src/surfacecollection.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/surfacecollection.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/surfacecollection.o: /usr/include/stdlib.h
objs/gp2x/src/surfacecollection.o: /usr/include/bits/waitflags.h
objs/gp2x/src/surfacecollection.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/surfacecollection.o: /usr/include/alloca.h
objs/gp2x/src/surfacecollection.o: /usr/include/string.h
objs/gp2x/src/surfacecollection.o: /usr/include/xlocale.h
objs/gp2x/src/surfacecollection.o: /usr/include/strings.h
objs/gp2x/src/surfacecollection.o: /usr/include/inttypes.h
objs/gp2x/src/surfacecollection.o: /usr/include/stdint.h
objs/gp2x/src/surfacecollection.o: /usr/include/bits/wchar.h
objs/gp2x/src/surfacecollection.o: /usr/include/ctype.h /usr/include/iconv.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/surfacecollection.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/surfacecollection.o: src/utilities.h src/debug.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_gfxPrimitives.h
objs/gp2x/src/surface.o: /usr/include/math.h /usr/include/features.h
objs/gp2x/src/surface.o: /usr/include/sys/cdefs.h
objs/gp2x/src/surface.o: /usr/include/bits/wordsize.h
objs/gp2x/src/surface.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
objs/gp2x/src/surface.o: /usr/include/bits/huge_val.h
objs/gp2x/src/surface.o: /usr/include/bits/huge_valf.h
objs/gp2x/src/surface.o: /usr/include/bits/huge_vall.h
objs/gp2x/src/surface.o: /usr/include/bits/inf.h /usr/include/bits/nan.h
objs/gp2x/src/surface.o: /usr/include/bits/mathdef.h
objs/gp2x/src/surface.o: /usr/include/bits/mathcalls.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/surface.o: /usr/include/sys/types.h /usr/include/bits/types.h
objs/gp2x/src/surface.o: /usr/include/bits/typesizes.h /usr/include/time.h
objs/gp2x/src/surface.o: /usr/include/endian.h /usr/include/bits/endian.h
objs/gp2x/src/surface.o: /usr/include/bits/byteswap.h
objs/gp2x/src/surface.o: /usr/include/sys/select.h /usr/include/bits/select.h
objs/gp2x/src/surface.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
objs/gp2x/src/surface.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/surface.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/surface.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/surface.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/surface.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/surface.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/surface.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
objs/gp2x/src/surface.o: /usr/include/bits/waitstatus.h /usr/include/alloca.h
objs/gp2x/src/surface.o: /usr/include/string.h /usr/include/xlocale.h
objs/gp2x/src/surface.o: /usr/include/strings.h /usr/include/inttypes.h
objs/gp2x/src/surface.o: /usr/include/stdint.h /usr/include/bits/wchar.h
objs/gp2x/src/surface.o: /usr/include/ctype.h /usr/include/iconv.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/surface.o: src/surface.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/surface.o: src/sfontplus.h
objs/gp2x/src/surface.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/surface.o: src/utilities.h src/debug.h
objs/gp2x/src/textdialog.o: src/textdialog.h src/gmenu2x.h
objs/gp2x/src/textdialog.o: src/surfacecollection.h src/iconbutton.h
objs/gp2x/src/textdialog.o: src/button.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/textdialog.o: /usr/include/sys/types.h /usr/include/features.h
objs/gp2x/src/textdialog.o: /usr/include/sys/cdefs.h
objs/gp2x/src/textdialog.o: /usr/include/bits/wordsize.h
objs/gp2x/src/textdialog.o: /usr/include/gnu/stubs.h
objs/gp2x/src/textdialog.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/textdialog.o: /usr/include/bits/types.h
objs/gp2x/src/textdialog.o: /usr/include/bits/typesizes.h /usr/include/time.h
objs/gp2x/src/textdialog.o: /usr/include/endian.h /usr/include/bits/endian.h
objs/gp2x/src/textdialog.o: /usr/include/bits/byteswap.h
objs/gp2x/src/textdialog.o: /usr/include/sys/select.h
objs/gp2x/src/textdialog.o: /usr/include/bits/select.h
objs/gp2x/src/textdialog.o: /usr/include/bits/sigset.h
objs/gp2x/src/textdialog.o: /usr/include/bits/time.h
objs/gp2x/src/textdialog.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/textdialog.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/textdialog.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/textdialog.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/textdialog.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/textdialog.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/textdialog.o: /usr/include/stdlib.h
objs/gp2x/src/textdialog.o: /usr/include/bits/waitflags.h
objs/gp2x/src/textdialog.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/textdialog.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/textdialog.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/textdialog.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/textdialog.o: /usr/include/bits/wchar.h /usr/include/ctype.h
objs/gp2x/src/textdialog.o: /usr/include/iconv.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/textdialog.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/textdialog.o: src/translator.h src/utilities.h
objs/gp2x/src/textdialog.o: src/touchscreen.h /usr/include/fcntl.h
objs/gp2x/src/textdialog.o: /usr/include/bits/fcntl.h
objs/gp2x/src/textdialog.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/textdialog.o: src/surface.h src/sfontplus.h
objs/gp2x/src/textdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/textdialog.o: src/dialog.h
objs/gp2x/src/textmanualdialog.o: src/textmanualdialog.h src/textdialog.h
objs/gp2x/src/textmanualdialog.o: src/gmenu2x.h src/surfacecollection.h
objs/gp2x/src/textmanualdialog.o: src/iconbutton.h src/button.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/textmanualdialog.o: /usr/include/sys/types.h
objs/gp2x/src/textmanualdialog.o: /usr/include/features.h
objs/gp2x/src/textmanualdialog.o: /usr/include/sys/cdefs.h
objs/gp2x/src/textmanualdialog.o: /usr/include/bits/wordsize.h
objs/gp2x/src/textmanualdialog.o: /usr/include/gnu/stubs.h
objs/gp2x/src/textmanualdialog.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/textmanualdialog.o: /usr/include/bits/types.h
objs/gp2x/src/textmanualdialog.o: /usr/include/bits/typesizes.h
objs/gp2x/src/textmanualdialog.o: /usr/include/time.h /usr/include/endian.h
objs/gp2x/src/textmanualdialog.o: /usr/include/bits/endian.h
objs/gp2x/src/textmanualdialog.o: /usr/include/bits/byteswap.h
objs/gp2x/src/textmanualdialog.o: /usr/include/sys/select.h
objs/gp2x/src/textmanualdialog.o: /usr/include/bits/select.h
objs/gp2x/src/textmanualdialog.o: /usr/include/bits/sigset.h
objs/gp2x/src/textmanualdialog.o: /usr/include/bits/time.h
objs/gp2x/src/textmanualdialog.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/textmanualdialog.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/textmanualdialog.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/textmanualdialog.o: /usr/include/_G_config.h
objs/gp2x/src/textmanualdialog.o: /usr/include/wchar.h
objs/gp2x/src/textmanualdialog.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/textmanualdialog.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/textmanualdialog.o: /usr/include/stdlib.h
objs/gp2x/src/textmanualdialog.o: /usr/include/bits/waitflags.h
objs/gp2x/src/textmanualdialog.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/textmanualdialog.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/textmanualdialog.o: /usr/include/xlocale.h
objs/gp2x/src/textmanualdialog.o: /usr/include/strings.h
objs/gp2x/src/textmanualdialog.o: /usr/include/inttypes.h
objs/gp2x/src/textmanualdialog.o: /usr/include/stdint.h
objs/gp2x/src/textmanualdialog.o: /usr/include/bits/wchar.h
objs/gp2x/src/textmanualdialog.o: /usr/include/ctype.h /usr/include/iconv.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/textmanualdialog.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/textmanualdialog.o: src/translator.h src/utilities.h
objs/gp2x/src/textmanualdialog.o: src/touchscreen.h /usr/include/fcntl.h
objs/gp2x/src/textmanualdialog.o: /usr/include/bits/fcntl.h
objs/gp2x/src/textmanualdialog.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/textmanualdialog.o: src/surface.h src/sfontplus.h
objs/gp2x/src/textmanualdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/textmanualdialog.o: src/dialog.h
objs/gp2x/src/touchscreen.o: /usr/include/unistd.h /usr/include/features.h
objs/gp2x/src/touchscreen.o: /usr/include/sys/cdefs.h
objs/gp2x/src/touchscreen.o: /usr/include/bits/wordsize.h
objs/gp2x/src/touchscreen.o: /usr/include/gnu/stubs.h
objs/gp2x/src/touchscreen.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/touchscreen.o: /usr/include/bits/posix_opt.h
objs/gp2x/src/touchscreen.o: /usr/include/bits/environments.h
objs/gp2x/src/touchscreen.o: /usr/include/bits/types.h
objs/gp2x/src/touchscreen.o: /usr/include/bits/typesizes.h
objs/gp2x/src/touchscreen.o: /usr/include/bits/confname.h
objs/gp2x/src/touchscreen.o: /usr/include/getopt.h src/touchscreen.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/touchscreen.o: /usr/include/sys/types.h /usr/include/time.h
objs/gp2x/src/touchscreen.o: /usr/include/endian.h /usr/include/bits/endian.h
objs/gp2x/src/touchscreen.o: /usr/include/bits/byteswap.h
objs/gp2x/src/touchscreen.o: /usr/include/sys/select.h
objs/gp2x/src/touchscreen.o: /usr/include/bits/select.h
objs/gp2x/src/touchscreen.o: /usr/include/bits/sigset.h
objs/gp2x/src/touchscreen.o: /usr/include/bits/time.h
objs/gp2x/src/touchscreen.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/touchscreen.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/touchscreen.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/touchscreen.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/touchscreen.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/touchscreen.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/touchscreen.o: /usr/include/stdlib.h
objs/gp2x/src/touchscreen.o: /usr/include/bits/waitflags.h
objs/gp2x/src/touchscreen.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/touchscreen.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/touchscreen.o: /usr/include/xlocale.h /usr/include/strings.h
objs/gp2x/src/touchscreen.o: /usr/include/inttypes.h /usr/include/stdint.h
objs/gp2x/src/touchscreen.o: /usr/include/bits/wchar.h /usr/include/ctype.h
objs/gp2x/src/touchscreen.o: /usr/include/iconv.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/touchscreen.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/touchscreen.o: /usr/include/fcntl.h /usr/include/bits/fcntl.h
objs/gp2x/src/touchscreen.o: /usr/include/bits/stat.h
objs/gp2x/src/translator.o: src/translator.h src/utilities.h src/debug.h
objs/gp2x/src/utilities.o: /usr/include/sys/stat.h /usr/include/features.h
objs/gp2x/src/utilities.o: /usr/include/sys/cdefs.h
objs/gp2x/src/utilities.o: /usr/include/bits/wordsize.h
objs/gp2x/src/utilities.o: /usr/include/gnu/stubs.h
objs/gp2x/src/utilities.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/utilities.o: /usr/include/bits/types.h
objs/gp2x/src/utilities.o: /usr/include/bits/typesizes.h /usr/include/time.h
objs/gp2x/src/utilities.o: /usr/include/bits/stat.h /usr/include/sys/types.h
objs/gp2x/src/utilities.o: /usr/include/endian.h /usr/include/bits/endian.h
objs/gp2x/src/utilities.o: /usr/include/bits/byteswap.h
objs/gp2x/src/utilities.o: /usr/include/sys/select.h
objs/gp2x/src/utilities.o: /usr/include/bits/select.h
objs/gp2x/src/utilities.o: /usr/include/bits/sigset.h
objs/gp2x/src/utilities.o: /usr/include/bits/time.h
objs/gp2x/src/utilities.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/utilities.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/utilities.o: /usr/include/dirent.h /usr/include/bits/dirent.h
objs/gp2x/src/utilities.o: /usr/include/bits/posix1_lim.h
objs/gp2x/src/utilities.o: /usr/include/bits/local_lim.h
objs/gp2x/src/utilities.o: /usr/include/linux/limits.h /usr/include/strings.h
objs/gp2x/src/utilities.o: /usr/include/math.h /usr/include/bits/huge_val.h
objs/gp2x/src/utilities.o: /usr/include/bits/huge_valf.h
objs/gp2x/src/utilities.o: /usr/include/bits/huge_vall.h
objs/gp2x/src/utilities.o: /usr/include/bits/inf.h /usr/include/bits/nan.h
objs/gp2x/src/utilities.o: /usr/include/bits/mathdef.h
objs/gp2x/src/utilities.o: /usr/include/bits/mathcalls.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/utilities.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/utilities.o: /usr/include/_G_config.h /usr/include/wchar.h
objs/gp2x/src/utilities.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/utilities.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/utilities.o: /usr/include/stdlib.h
objs/gp2x/src/utilities.o: /usr/include/bits/waitflags.h
objs/gp2x/src/utilities.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/utilities.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/utilities.o: /usr/include/xlocale.h /usr/include/inttypes.h
objs/gp2x/src/utilities.o: /usr/include/stdint.h /usr/include/bits/wchar.h
objs/gp2x/src/utilities.o: /usr/include/ctype.h /usr/include/iconv.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/utilities.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/utilities.o: src/utilities.h src/debug.h
objs/gp2x/src/wallpaperdialog.o: src/wallpaperdialog.h src/gmenu2x.h
objs/gp2x/src/wallpaperdialog.o: src/surfacecollection.h src/iconbutton.h
objs/gp2x/src/wallpaperdialog.o: src/button.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_main.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_stdinc.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_config.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_platform.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/sys/types.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/features.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/sys/cdefs.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/bits/wordsize.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/gnu/stubs.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/gnu/stubs-64.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/bits/types.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/bits/typesizes.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/time.h /usr/include/endian.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/bits/endian.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/bits/byteswap.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/sys/select.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/bits/select.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/bits/sigset.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/bits/time.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/sys/sysmacros.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/bits/pthreadtypes.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/stdio.h /usr/include/libio.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/_G_config.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/wchar.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/bits/stdio_lim.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/bits/sys_errlist.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/stdlib.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/bits/waitflags.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/bits/waitstatus.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/alloca.h /usr/include/string.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/xlocale.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/strings.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/inttypes.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/stdint.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/bits/wchar.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/ctype.h /usr/include/iconv.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/begin_code.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/close_code.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_audio.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_error.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_endian.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mutex.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_thread.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_rwops.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cdrom.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_cpuinfo.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_events.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_active.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keyboard.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_keysym.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_mouse.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_video.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_joystick.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_quit.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_loadso.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_timer.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_version.h
objs/gp2x/src/wallpaperdialog.o: src/FastDelegate.h /usr/include/memory.h
objs/gp2x/src/wallpaperdialog.o: src/translator.h src/utilities.h
objs/gp2x/src/wallpaperdialog.o: src/touchscreen.h /usr/include/fcntl.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/bits/fcntl.h
objs/gp2x/src/wallpaperdialog.o: /usr/include/bits/stat.h src/inputmanager.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_image.h
objs/gp2x/src/wallpaperdialog.o: src/surface.h src/sfontplus.h
objs/gp2x/src/wallpaperdialog.o: /opt/open2x/gcc-4.1.1-glibc-2.3.6/include/SDL/SDL_ttf.h
objs/gp2x/src/wallpaperdialog.o: src/dialog.h src/filelister.h src/debug.h