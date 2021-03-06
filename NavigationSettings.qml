import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1

Item {

    visible: true
    width: 1000
    height:600
//    width: parent ? parent.width : 0
//    height: parent ? parent.height : 0

    id: window

    Image
    {
        anchors.fill:parent
        source:"Images/backgroud screen1.jpg"
    }

    HomeButton
    {
        id: homeButton
        mainScreenHeight: window.height
        mainScreenWidth: window.width
    }

    Item {
        anchors.right:parent.right
        anchors.rightMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 16
        width: window.width*0.08
        height: window.height*0.13
        Text
        {
            id:time
           anchors.centerIn: parent
           color:"white"
           font.bold:true
           font.pixelSize: window.width*28/1000
          }

            Timer
            {
                interval: 500
                running:true
                repeat:true
                onTriggered:
                {
                    var date=new Date()
                    time.text=date.toLocaleTimeString(Qt.locale("en_US"),"hh:mm")
                }
            }
    }


    Rectangle
    {
        id:horizontalLine
        width:parent.width
        height:1
        color: "gray"
        anchors.top: parent.top
        anchors.topMargin: window.height*120/600
    }

    Rectangle
    {
        id:verticalLine
        width:1
        height:parent.height
        color: "gray"
        anchors.left: parent.left
        anchors.leftMargin:  window.width * 110/1000
    }

    Image{
            id:settingsIcon
            objectName: "settingsIcon"
            signal back()
            source:"Images/setting icon.png"
            width:window.width*0.1
            height:window.height/8.5
            anchors.top: parent.top
            anchors.topMargin: window.height * 25/600
            anchors.left: parent.left
            anchors.leftMargin:window.width * 120/1000
            fillMode: Image.PreserveAspectFit

            MouseArea{
                anchors.fill: settingsIcon
                objectName: settingsIcon.objectName
                onPressed: {
                    settingsIcon.height = settingsIcon.height * 0.75
                    settingsIcon.width = settingsIcon.weight * 0.75
                }
                onReleased: {
                    settingsIcon.height = window.height/6
                    settingsIcon.width = window.width*0.1
                    settingsIcon.back()
                }
            }

        }
        Text{
            id:headingSettings
            text:"SETTINGS  >  NAVIGATION"
            font.bold: true
            font.family: "Arial"
            font.pointSize: window.width * 18/1000
            color: "white"
            anchors.left:settingsIcon.right
            anchors.leftMargin: 10
            anchors.top:parent.top
            anchors.topMargin: window.height * 45/600
        }

//----Home----//
        Rectangle{
            id: homeRect
            //anchors.fill: radioButton
            height: window.height * 75/600
            width: window.width*  400/1000
            anchors.left: verticalLine.right
            anchors.leftMargin: window.width * 45/1000
            anchors.top: horizontalLine.bottom
            anchors.topMargin: window.height * 45/600
            color: "transparent"
            border.color: "white"
            border.width: 1
            Text{
                anchors.verticalCenter: homeRect.verticalCenter
                anchors.horizontalCenter: homeRect.horizontalCenter
                color: "white"
                text: "Home"
                font.bold: true
                font.pixelSize: window.width * 30/1000
            }
        }

        MouseArea
        {
            id: homeButton1
            anchors.fill: homeRect
            hoverEnabled: true
            onPressed: {
                homeRect.height = homeRect.height * 0.75
                homeRect.width = homeRect.width * 0.75
            }

            onReleased: {
                homeRect.height = homeRect.height / 0.75
                homeRect.width = homeRect.width / 0.75
            }

            onEntered: {
                homeRect.color="light blue"
            }

            onExited: {
                homeRect.color="transparent"
            }

    }

//----Destination---//

        Rectangle{
            id: destRect
            height: window.height * 75/600
            width: window.width*  400/1000
            anchors.left: verticalLine.right
            anchors.leftMargin: window.width * 45/1000
            anchors.top: horizontalLine.bottom
            anchors.topMargin: window.height * 140/600
            color: "transparent"
            border.color: "white"
            border.width: 1
            Text{

                anchors.verticalCenter: destRect.verticalCenter
                anchors.horizontalCenter: destRect.horizontalCenter
                color: "white"
                text: "Add Destination"
                font.bold: true
                font.pixelSize: window.width * 30/1000
            }
        }

        MouseArea
        {
            id: destButton
            anchors.fill: destRect
            hoverEnabled: true
            onPressed: {
                destRect.height = destRect.height * 0.75
                destRect.width = destRect.width * 0.75


            }

            onReleased: {
                destRect.height = destRect.height / 0.75
                destRect.width = destRect.width / 0.75

            }

            onEntered: {
                destRect.color="light blue"
            }

            onExited: {
                destRect.color="transparent"
            }

    }

//---Saved---//

        Rectangle{
            id: savedRect
            height: window.height * 75/600
            width: window.width*  400/1000
            anchors.left: verticalLine.right
            anchors.leftMargin: window.width * 45/1000
            anchors.top: horizontalLine.bottom
            anchors.topMargin: window.height * 235/600
            color: "transparent"
            border.color: "white"
            border.width: 1
            Text{
                id: connectText
                anchors.verticalCenter: savedRect.verticalCenter
                anchors.horizontalCenter: savedRect.horizontalCenter
                color: "white"
                text: "Saved Places"
                font.bold: true
                font.pixelSize: window.width * 30/1000
            }
        }

        MouseArea
        {
            id: savedButton
            anchors.fill: savedRect
            hoverEnabled: true
            onPressed: {
                savedRect.height = savedRect.height * 0.75
                savedRect.width = savedRect.width * 0.75
            }

            onReleased: {
                savedRect.height = savedRect.height / 0.75
                savedRect.width = savedRect.width / 0.75

            }

            onEntered: {
                savedRect.color="light blue"
            }

            onExited: {
                savedRect.color="transparent"
            }

    }


//---History---//

        Rectangle{
            id: historyRect
            height: window.height * 75/600
            width: window.width*  400/1000
            anchors.left: verticalLine.right
            anchors.leftMargin: window.width * 45/1000
            anchors.top: horizontalLine.bottom
            anchors.topMargin: window.height * 330/600
            color: "transparent"
            border.color: "white"
            border.width: 1
            Text{
                anchors.verticalCenter: historyRect.verticalCenter
                anchors.horizontalCenter: historyRect.horizontalCenter
                color: "white"
                text: "History"
                font.bold: true
                font.pixelSize: window.width * 30/1000
            }
        }

        MouseArea
        {
            id: historyButton
            anchors.fill: historyRect
            hoverEnabled: true
            onPressed: {
                historyRect.height = historyRect.height * 0.75
                historyRect.width = historyRect.width * 0.75
            }

            onReleased: {
                historyRect.height = historyRect.height / 0.75
                historyRect.width = historyRect.width / 0.75
            }

            onEntered: {
                historyRect.color="light blue"
            }

            onExited: {
                historyRect.color="transparent"
            }

    }
}
