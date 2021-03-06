import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Item {
    id:phoneScreen
    width: 1000
    height:600
//    width: parent ? parent.width : 0
//    height: parent ? parent.height : 0


    Background
    {
        mainScreenHeight: phoneScreen.height
        mainScreenWidth: phoneScreen.width
    }


    HomeButton
    {
        id: homeButton
        mainScreenHeight: phoneScreen.height
        mainScreenWidth: phoneScreen.width
    }

    Image{
        id:phoneIcon
        source:"Images/phone1.png"
        width: parent.width*0.1
        height: parent.height/8.5
        anchors.top: parent.top
        anchors.topMargin: parent.height*25/600
        anchors.left: parent.left
        anchors.leftMargin:parent.width*120/1000
        fillMode: Image.PreserveAspectFit
    }

    Text{
        id:phoneHeader
        text:"PHONE"
        font.bold: true
        font.family: "Arial"
        font.pointSize: parent.height*18/600
        color: "white"
        anchors.left:phoneIcon.right
        anchors.leftMargin: parent.width*10/1000
        anchors.top:parent.top
        anchors.topMargin: parent.height*45/600
    }


    Time
    {
        anchors.right:parent.right
        anchors.rightMargin: parent.width*20/1000
        anchors.top: parent.top
        anchors.topMargin: parent.height*16/600
        mainScreenWidth: parent.width
        mainScreenHeight: parent.height
    }

    Rectangle
    {
        id:horizontalLine
        width:parent.width
        height:1
        color: "gray"
        anchors.top: parent.top
        anchors.topMargin: phoneScreen.height*120/600
    }
    Rectangle
    {
        id:verticalLine
        width:1
        height:parent.height
        color: "gray"
        anchors.top: parent.top
        anchors.left:parent.left
        anchors.leftMargin: phoneScreen.width*110/1000
    }
    Text
    {
        anchors.centerIn: parent
        text: "S8 Connected"
        font.bold: true
        font.family: "Arial"
        font.pointSize: phoneScreen.height*24/600
        color: "white"
    }

    Button
    {
        id: dial
        objectName: "dial"
//        activeFocus: true
        signal refresh(var val)
        anchors.left: verticalLine.left
        anchors.leftMargin: parent.width*80/1000
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height*20/600
        height: parent.height*60/600
        width: parent.width*170/1000
        background: Rectangle{
            id:dialrect
            anchors.fill: dial
            color: "transparent"
            border.width:phoneScreen.width*1/1000
            border.color: "gray"

            Text
            {
                anchors.centerIn: parent
                text: "Dial"
                font.bold: true
                font.family: "Arial"
                font.pointSize: phoneScreen.height*24/600
                color: "white"
            }
        }

        onPressed:
        {
            dialrect.color = "steelblue"
        }

        onReleased: {
            dialrect.color = "transparent"
            dial.refresh("dial")
        }
    }


    Button
    {
        id: message
        anchors.left: dial.right
        anchors.leftMargin: parent.width*40/1000
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height*20/600
        height: parent.height*60/600
        width: parent.width*250/1000
        background: Rectangle{
            id: messagerect
            anchors.fill: message
            color: "transparent"
            border.width: phoneScreen.width*1/1000
            border.color: "gray"



            Text
            {
                anchors.centerIn: parent
                text: "Messages"
                font.bold: true
                font.family: "Arial"
                font.pointSize: phoneScreen.height*24/600
                color: "white"
            }
        }

        onPressed:
        {
            messagerect.color = "steelblue"
        }

        onReleased: {
            messagerect.color = "transparent"
        }
    }

    Button
    {
        id: contacts
//        activeFocus: true
        objectName: "contacts"
        signal refresh(var val)
        anchors.left: message.right
        anchors.leftMargin: parent.width*40/1000
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height*20/600
        height: parent.height*60/600
        width: parent.width*250/1000
        background: Rectangle{
            id:contactsrect
            anchors.fill: contacts
            color: "transparent"
            border.width: phoneScreen.width*1/1000
            border.color: "gray"


            Text
            {
                anchors.centerIn: parent
                text: "Contacts"
                font.bold: true
                font.family: "Arial"
                font.pointSize: phoneScreen.height*24/600
                color: "white"
            }
        }

        onPressed:
        {
            contactsrect.color = "steelblue"
        }

        onReleased: {
            contactsrect.color = "transparent"
            contacts.refresh("contacts")
        }
    }
}
