import QtQuick
import QtQuick.Controls.Material 2.3
import Minds 1.0

Component{
    Page{
        title:"Wifi"
        id:main
        property bool show : true
        Minds{id:minds}
        Rectangle{id:sub_main;anchors.fill: parent
        Column{
            id: column
            spacing:2
            anchors{centerIn:parent}
            visible:main.show
            Text{id:txt;text:"Enter your rage:" ; }
            TextField{id:rage; placeholderText:"Rage name"}
            Button{id:but;text:"Ragefully Exploit";
                onClicked:()=>{if(rage.text==="twd"){main.show=false}else{but.text="No rage found in that."}}
            }
        }

        //twd
        Column{
            id:res
            property bool show : true
            property bool color_c : false
            property bool die_app : false
            spacing:2
            anchors{centerIn:parent}
            visible:!main.show
            Text{id:etxt;visible:!res.show;font.bold:true;text:"This is my rage."}
            Text{id:etxtt;visible:res.show;font.bold:true;text:"Getting ready..."}
            ProgressBar{id:p;value:0;visible:res.show}
            Timer{id:timer;interval:1000;running:true;repeat:true;
                onTriggered:()=>{if(!main.show){if(p.value>0.90){res.show=false;timer.stop();timer2.running=true}else{p.value=p.value+0.3}}}
            }
            Timer{id:timer2;interval:3000;repeat:false;
                onTriggered:()=>{sub_main.color="red";timer3.running=true}
            }
            Timer{id:timer3;interval:2000;repeat:true;
                onTriggered:()=>{Qt.quit()}
            }
        }
        }
    }
}
