cmake_minimum_required(VERSION 3.16)

project(ThinkingMinds VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appThinkingMinds
    main.cpp minds.cpp minds.h
)

qt_add_qml_module(appThinkingMinds
    URI ThinkingMinds
    VERSION 1.0
    QML_FILES Main.qml Android.qml Wifi.qml Dashboard.qml MyRage.qml Footer.qml WLExploit.qml Testing.qml
)

set_target_properties(appThinkingMinds PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appThinkingMinds
    PRIVATE Qt6::Quick
)

install(TARGETS appThinkingMinds
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
