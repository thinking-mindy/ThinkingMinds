import QtQuick
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3

ApplicationWindow {
    id:win
    width: 840
    height: 480
    visible: true
    title: qsTr("The Walking Dead")
    property bool showBar: false
    Material.theme: Material.Light
    Material.accent:Material.Red
    Material.background:'#f5f5f5'
    Material.foreground:Material.Red
    Material.primary:Material.Red

    header:TabBar {
        id: bar
        width: parent.width
        TabButton {
            text: qsTr("Welcome")
            onClicked: nav.replace(dash)
        }
        TabButton {
            text: qsTr("Wifi")
            onClicked: nav.replace(w)
        }
        TabButton {
            text: qsTr("Android")
            onClicked: nav.replace(apk)
        }
        TabButton {
            text: qsTr("My Rage")
            onClicked: nav.replace(rage)
        }
        TabButton {
            text: qsTr("Testing")
            onClicked: nav.replace(tes)
        }
    }
    footer: Footer{id:foo}
    StackView {
        id: nav
        anchors.fill: parent
        initialItem: dash


        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 200
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 200
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }
    }
    Dashboard{id:dash}
    Wifi{id:w}
    WLExploit{id:w_linux}
    Android{id:apk}
    MyRage{id:rage}
    Testing{id:tes}
}
