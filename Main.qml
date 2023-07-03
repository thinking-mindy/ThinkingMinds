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
    Material.accent: Material.Purple

    menuBar: MenuBar {
                visible:showBar
             Menu {
                 title: qsTr("&MINDS")
                 Action { text: qsTr("&Report bug") }
                 Action { text: qsTr("&Contact Us...") }
                 MenuSeparator{}
                 Action { text: qsTr("&Quit");onTriggered:Qt.quit()}
             }
             Menu {
                 title: qsTr("&Pages")
                 Action{text:qsTr("Home");onTriggered:()=>{nav.clear();nav.push(dash)}}
                 Action{text:qsTr("Android");onTriggered:()=>{nav.push(apk)}}
                 Action{text:qsTr("Wifi");onTriggered:()=>{nav.push(w)}}
                 Action{text:qsTr("&Rage");onTriggered:()=>{nav.push(rage)}}
             }
             Menu {
                 title: qsTr("&Edit")
                 Action { text: qsTr("Refresh") }
                 Action { text: qsTr("&Restart") }
                 Action { text: qsTr("&Paste") }
             }
             Menu {
                 title: qsTr("&Help")
                 Action { text: qsTr("&Docs") }
                 Action { text: qsTr("&About") }
             }
         }
    StackView{
     id:nav
     initialItem: welcome
     anchors.fill:parent
    }
    Component{
        id:welcome
        Page{
            title: "Welcome"
            ColumnLayout{id:sLay;spacing:2;anchors{centerIn:parent}
                Text{id:txt;text:"<b>Welcome user<b>";Layout.alignment:Qt.AlignCenter}
                Text{id:txt2;text:"Press the key below to continue";Layout.alignment:Qt.AlignCenter}
                Button{id:but;text:"Continue";Layout.alignment:Qt.AlignCenter;Material.background:Qt.hsla(243,100, 50,0.1);onClicked:()=>{nav.clear();nav.push(dash);showBar=true}}
            }
        }
    }
    Dashboard{id:dash}
    Wifi{id:w}
    Android{id:apk}
    MyRage{id:rage}
}
