import QtQuick
import QtQuick.Controls.Material 2.3
import Minds 1.0


Page{
    title:"Wifi"
    id:main

    Minds{id:minds}

    Column{
        id:wi
        spacing:2
        anchors{centerIn:parent}
        visible:true
        Text{text:"Welcome to wireless pentesting";font.bold:true;}
        Text{id:txt_des;width:600;wrapMode:Text.Wrap;text:
                "This is illegal if done without athorization from Network owner"
                +"The purpose is to test your network for weaknesses"
        }
        Button{id:but;text:"Start";onClicked:()=>{wi.visible=false;loading.visible=true}}
    }
    Column{
        id:loading
        spacing:2
        anchors{centerIn:parent}
        visible:false
        Text{text:"Gathering available networks...";font.bold:true;}
        ProgressBar{id:p;value:0;}
        Timer{id:timer;interval:1000;running:loading.visible;repeat:true;
            onTriggered:()=>{
                            if(p.value>0.90){loading.visible=false;res.visible=true;timer.stop();}
                            else{p.value=p.value+0.4}}}
    }
    Column{
        id:res
        spacing:2
        anchors{centerIn:parent}
        visible:false

        Text{text:"Select a network to exploit";font.bold:true;}
        Grid{spacing:5
            Repeater{
                model:minds.qt_cmd1("iwlist wlan0 scanning")

                // Timer{id:update;interval:1000;running:true;repeat:true;onTriggered:()=>{minds.my_cmd()}}
                delegate:Button{id:rr;text:/essid/i.test(modelData)?modelData.slice(modelData.indexOf('"')+1,modelData.lastIndexOf('"')):rr.visible=false;
                    onClicked:()=>{
                                  nav.replace(w_linux,{wifiName:modelData.slice(modelData.indexOf('"')+1,modelData.lastIndexOf('"'))})
                              }
                }
            }
        }
    }
}
