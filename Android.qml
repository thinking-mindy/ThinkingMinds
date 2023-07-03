import QtQuick
import QtQuick.Controls.Material 2.3

Component{
    Page{
        title: "Android"
        Column{
            spacing:2
            anchors{centerIn: parent}
            Text{id:txt;text:"I'm android"}
            Text{id:txt2;text:"I'm nothing"}
            Button{id:but;text:"Exit";onClicked: Qt.quit()}
            Button{id:butt;text:"Try wifi";onClicked: nav.push(w)}
        }

        TextEdit {
            id: textEdit
            x: 272
            y: 124
            width: 80
            height: 20
            text: qsTr("Text Edit")
            font.pixelSize: 12
        }
    }
}
