import QtQuick
import QtQuick.Controls.Material 2.3
import Minds 1.0


Page{
    title: "Android"
    Minds{id:minds}
    Column{
        spacing:2
        anchors{centerIn: parent}
        Row{
        Text{font.bold:true;text:"Network not working?"}
        Button{text:"Reset Network";onClicked:()=>{minds.reset()}}
        }
        Row{
            Text{font.bold:true;text:"Can't quit app?"}
            Button{text:"Quit";onClicked:()=>{Qt.quit()}}
        }
    }
}

