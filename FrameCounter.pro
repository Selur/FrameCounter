CONFIG += console

win32-msvc* {
    message(Building for Windows using Qt $$QT_VERSION)
    lessThan(QT_MAJOR_VERSION, 6) {
      CONFIG += c++11 # C++11 support
    } else {
      CONFIG += c++17 # C++17 support
      QMAKE_CXXFLAGS += /std:c++17
    }
    QMAKE_CXXFLAGS += /bigobj # allow big objects
    !contains(QMAKE_HOST.arch, x86_64):QMAKE_LFLAGS += /LARGEADDRESSAWARE # allow the use more of than 2GB of RAM on 32bit Windows

    # # add during static build
    # QMAKE_CFLAGS_RELEASE += -MT
    # QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += -MT
    # QMAKE_CFLAGS_DEBUG = -Zi -MTd
    # QMAKE_LFLAGS += /DYNAMICBASE:NO
    # for Windows XP compatibility
    contains(QMAKE_HOST.arch, x86_64):QMAKE_LFLAGS += /SUBSYSTEM:WINDOWS,5.02 # Windows XP 64bit
    else:QMAKE_LFLAGS += /SUBSYSTEM:WINDOWS,5.01 # Windows XP 32bit
} else:linux-* {
  message(Building for Linux using Qt $$QT_VERSION)
} else:macx {
    message(Building for Mac using Qt $$QT_VERSION)
    CONFIG-=app_bundle
    QMAKE_CFLAGS_RELEASE += -fvisibility=hidden
    QMAKE_CXXFLAGS += -std=c++0x
    QMAKE_CXXFLAGS_RELEASE += -fvisibility=hidden \
        -fvisibility-inlines-hidden
} else:message(Building for UNKNOWN using Qt $$QT_VERSION)



TARGET = FrameCounter

QT += core

SOURCES += main.cpp
