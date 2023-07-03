import QtQuick 2.9
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts

Component{
    Page{
        title: "Chat"
        ColumnLayout{
            id:lay
            spacing:2
            anchors.fill:parent
            ScrollView{
                id:scroll
                Layout.fillHeight:true
                Layout.fillWidth:true
                GridLayout {
                     id: grid
                     columns: 3
                    Repeater{
                        Layout.alignment:Qt.AlignCenter
                        model:[
                            {name:"Android",des:"This is the android pentesting",cback:apk},
                            {name:"Wifi",des:"Network<i>(<b>WIFI</b>)</i> hacking",cback:w},
                            {name:"My Rage",des:"",cback:rage}
                        ]
                        Material.background: Qt.hsla(0.7,0.5,0.5,1)
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
            RowLayout{id:sLay;spacing:2;Layout.alignment:Qt.AlignBottom
                Text{text:"2023 @ THINKING MINDS INC";Layout.fillWidth:true}
                Text{text:"POWERED BY THINKING MINDS";}
            }
        }
    }
}

