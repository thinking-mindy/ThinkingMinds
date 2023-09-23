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
            Text{id:txt;text:"Enter wifi name below:" ; }
            TextField{id:txt2; placeholderText:"Wifi name"}
            Button{id:but;text:"Exploit";onClicked:()=>{main.show=false}}
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
