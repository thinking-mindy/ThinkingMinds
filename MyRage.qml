import QtQuick 2.9
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts

Component{
    Page{
        title: "Chat"
        ColumnLayout{
            id:lay
            spacing:2
            Layout.fillWidth:true
            Rectangle {
                     Layout.alignment: Qt.AlignRight
                     color: "green"
                     Layout.preferredWidth: 40
                     Layout.preferredHeight: 70
                 }
            ScrollView{
                id:scroll
                Layout.fillHeight:true
                Layout.fillWidth:true
                GridLayout {
                     id: grid
                     columns: 4
                     Layout.fillWidth:true
                    Repeater{
                        Layout.alignment:Qt.AlignCenter
                        model:[
                            {name:"Android",des:"This is the android pentesting",cback:apk},
                            {name:"Wifi",des:"Network<i>(<b>WIFI</b>)</i> hacking",cback:w},
                            {name:"My Rage",des:"Unleash your raging rage",cback:rage}
                        ]
                        delegate:ColumnLayout{Material.elevation:100;Layout.margins:10
                            Material.background:Qt.hsla(0.7,1,0.5,1)
                            Text{text:modelData.name;color:Qt.hsla(0.7,0.5,0.5,1)}
                            Text{text:modelData.des;Layout.maximumWidth:200;wrapMode:Text.Wrap}
                            RowLayout{Layout.fillWidth:true;Layout.alignment:Qt.AlignRight;Material.background:Qt.hsla(0.7,0.5,0.5,1)
                                Button{text:"Visit";onClicked:()=>{nav.push(modelData.cback)}}
                            }
                        }
                    }
                }
            }
            Footer{id:foo}
        }
    }
}

