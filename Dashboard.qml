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
                        delegate:
                            Rectangle {color:"white";width:200;height:100;Layout.margins:10
                            ColumnLayout{Layout.margins:10
                                Text{text:modelData.name}
                                Text{text:modelData.des;Layout.maximumWidth:200;wrapMode:Text.Wrap}
                                RowLayout{Layout.fillWidth:true;Layout.alignment:Qt.AlignRight;
                                    Button{text:"Visit";onClicked:()=>{nav.push(modelData.cback)}}
                                }
                            }
                        }
                    }
                }
        }
    }
}
