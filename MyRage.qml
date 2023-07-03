import QtQuick
import QtQuick.Controls.Material 2.3

Component{
    Page{
        title: "Wifi"

        Column{
            spacing:2
            anchors{centerIn: parent}

            Text{id:txt;text:"This is my rage"}
            TextField{id:txt2;placeholderText:"I'm speaking"}
            Button{id:but;text:"Exit";onClicked: Qt.quit()}
            Button{id:butt;text:"Try Android";onClicked: nav.push(apk)}
        }
    }
}
