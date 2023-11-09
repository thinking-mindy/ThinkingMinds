import QtQuick
import QtQuick.Controls.Material 2.3
import Minds 1.0

Component{
    Page{
        title:"Wifi"
        id:main

        Minds{id:minds}

        Column{
            id:loading
            spacing:2
            anchors{centerIn:parent}
            visible:true
            Text{text:"Gathering available networks...";font.bold:true;}
            ProgressBar{id:p;value:0;}
            Timer{id:timer;interval:1000;running:true;repeat:true;
                onTriggered:()=>{
                                if(p.value>0.90){loading.visible=false;res.visible=true;timer.stop();}
                                else{p.value=p.value+0.9}}}
        }
        Column{
            id:res
            spacing:2
            anchors{centerIn:parent}
            visible:false

            Text{text:"Selecting a network to exploit";font.bold:true;}
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
}
