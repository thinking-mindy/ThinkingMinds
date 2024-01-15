import QtQuick
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3


ApplicationWindow {
    id:win
    width: 1080
    height: 675
    visible: true
    title: qsTr("Thinking Minds")
    property bool showBar: false
    Material.theme: Material.Light
    Material.accent:Qt.hsla(0.42,1,0.5,1)
    Material.background:Qt.hsla(0.41,1,1,0.9)
    Material.foreground:Qt.hsla(0.42,1,0.4,1)
    Material.primary:Qt.hsla(0.42,0.8,0.5,1)

    header:TabBar {
        id: bar
        width: parent.width
        TabButton {
            text: qsTr("Welcome")
            onClicked: nav.replace(dash)
        }
        TabButton {
            text: qsTr("Wifi")
            onClicked: nav.replace(wifi)
        }
        TabButton {
            text: qsTr("Android")
            onClicked: nav.replace(android)
        }
        TabButton {
            text: qsTr("Servers")
            onClicked: nav.replace(server)
        }
        TabButton {
            text: qsTr("IOT")
            onClicked: nav.replace(iot)
        }
        TabButton {
            text: qsTr("Satellite")
            onClicked: nav.replace(set)
        }
        TabButton {
            text: qsTr("Get Help")
            onClicked: nav.replace(help)
        }
        TabButton {
            text: qsTr("About")
            onClicked: nav.replace(about)
        }


    }
    footer: Footer{id:foo}
    StackView {
        id: nav
        anchors.fill: parent
        initialItem:dash
        pushEnter:Transition {
            PropertyAnimation {
                property:"opacity"
                from:0
                to:1
                duration:200
            }
        }
        pushExit:Transition {
            PropertyAnimation {
                property:"opacity"
                from:1
                to:0
                duration:200
            }
        }
        popEnter:Transition {
            PropertyAnimation {
                property:"opacity"
                from:0
                to:1
                duration:200
            }
        }
        popExit:Transition {
            PropertyAnimation {
                property:"opacity"
                from:1
                to:0
                duration:200
            }
        }
    }
    Component{id:wifi;Wifi{}}
    Component{id:android;Android{}}
    Component{id:iot;IOT{}}
    Component{id:server;Server{}}
    Component{id:set;Set{}}
    Component{id:about;About{}}
    Component{id:rage;MyRage{}}
    Component{id:wexploit;WLExploit{}}
    Component{id:help;Help{}}
    Component{id:dash;Dashboard{}}
    Component{id:w_linux;WLExploit{}}
}
