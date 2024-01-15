import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material 2.3


ToolBar {
    width:60
    ColumnLayout {
        anchors.fill: parent;
        Repeater{
            model:[
                {name:"Setup",pagey:dash},
                {name:"Wireless",pagey:wifi},
                {name:"Servers",pagey:server},
                {name:"IOT",pagey:iot},
                {name:"Setellite",pagey:set},
                {name:"Help",pagey:help},
                {name:"About",pagey:about}
            ]
            Layout.alignment: Qt.AlignBottom
            delegate:
                ToolButton {
                text:modelData.name
                Layout.fillWidth: true
                onClicked: nav.push(modelData.pagey)
            }
        }
    }
}
