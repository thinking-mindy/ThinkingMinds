import QtQuick
import QtQuick.Controls.Material 2.3
import Minds 1.0

Component{
    Page{
        title: "Android"
        Minds{id:minds}
        Column{
            spacing:2
            anchors{centerIn: parent}
            Text{id:txt2;font.bold:true;text:"Using QProcess"}

            Repeater{
                model:minds.qt_cmd1("iwlist wlan0 scanning");
                delegate:Text{id:t_o;font.bold:true;text:"NOW"+/essid/i.test(modelData)?modelData:"None"}
            }
        }
    }
}
