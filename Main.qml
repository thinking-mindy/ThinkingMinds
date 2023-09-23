import QtQuick
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3

ApplicationWindow {
    id:win
    width: 840
    height: 480
    visible: true
    title: qsTr("Hello World")
    property bool showBar: false
    Material.theme: Material.Light
    Material.accent:Qt.hsla(0.7,1,0.5,1)
    Material.background:'#f5f5f5'
    Material.foreground:Qt.hsla(0.7,1,0.5,1)
    Material.primary:Material.Pink

    header:TabBar {
        id: bar
        width: parent.width
        TabButton {
            text: qsTr("Home")
            onClicked: nav.push(dash)
        }
        TabButton {
            text: qsTr("Wifi")
            onClicked: nav.push(w)
        }
        TabButton {
            text: qsTr("Android")
            onClicked: nav.push(apk)
        }
        TabButton {
            text: qsTr("My Rage")
            onClicked: nav.push(rage)
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
    Android{id:apk}
    MyRage{id:rage}
}
