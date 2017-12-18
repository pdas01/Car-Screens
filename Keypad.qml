import QtQuick 2.0


    Rectangle
    {

        property string name
        property int keypadHeight
        property int keypadWidth
        id: rect
        height: keypadHeight
        width: height
        radius: keypadHeight
        color: "transparent"
        border.color: "white"
        border.width: 1

        Text
        {
                id:textArea1
                anchors.centerIn: parent
              text: name
              color: "white"
              font.pointSize: 16
              font.bold:true
              font.family: "Arial"


         }





    }
