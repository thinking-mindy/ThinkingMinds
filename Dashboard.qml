import QtQuick
import QtQuick.Controls.Material 2.3
import Minds 1.0

Component{
    Page{
        title:"Wifi"
        id:main
        property bool show : true
        Minds{id:minds}
        Column{
            id: column
            spacing:2
            anchors{centerIn:parent}
            visible:main.show
            Text{id:txt;text:"Welcome";font.bold:true}
            Text{id:txt_des;width:600;wrapMode:Text.Wrap;text:
                    "Hello from the collectives, we are the <b>Thinking Minds</b> and this software is Open-Source"
                    +" thus you can do all as you please and you are fully responsible for all the actions"+
                    " and things you do. Else if you don't know what you are doing i highly recommend that"+
                    " you leave this software alone."

            }
            Button{id:but;text:"Next>>";onClicked:()=>{main.show=false}}
        }
        Column{
            id:res
            property bool show : true
            spacing:2
            anchors{centerIn:parent}
            visible:!main.show
            Text{id:etxt;visible:!res.show;text:"Some output from c++"}
            Text{visible:res.show;text:"Thinking Minds"}
            ProgressBar{id:p;value:0;visible:res.show}
            Timer{id:timer;interval:1000;running:true;repeat:true;onTriggered:()=>{if(p.value>0.90){res.show=false;timer.stop();}else{p.value=p.value+0.1}}}
        }
    }
}
