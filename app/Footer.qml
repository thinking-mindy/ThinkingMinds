import QtQuick 2.9
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts

ToolBar{
    RowLayout{id:sLay;anchors.fill: parent
        ToolButton{text:new Date().getFullYear()+" @ THINKING MINDS LLC";
            Layout.alignment:Qt.AlignCenter;Layout.fillWidth: true
        }
    }
}
