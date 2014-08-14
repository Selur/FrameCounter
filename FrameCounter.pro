CONFIG += console

macx {
CONFIG-=app_bundle
}

TARGET = FrameCounter

QT += core

SOURCES += main.cpp
