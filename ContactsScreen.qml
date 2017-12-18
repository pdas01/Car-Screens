import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Item {
    id:phoneScreen
    visible: true
    width: 1000
    height: 600
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
           objectName: "phoneIcon"
           signal back

           MouseArea{
               anchors.fill: phoneIcon
               objectName: phoneIcon.objectName
               onPressed: {
                   phoneIcon.height = phoneIcon.height * 0.75
                   phoneIcon.width = phoneIcon.weight * 0.75
               }
               onReleased: {
                   phoneIcon.height = parent.height/8.5
                   phoneIcon.width = parent.width*0.1
                   phoneIcon.back()
               }
           }

       }
       Text{
           id:phoneHeader
           text:"PHONE     >    CONTACTS"
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


       Item {

           height: phoneScreen.height*0.7
           width: phoneScreen.width*0.8
           id: grid
           anchors.top: parent.top
           anchors.topMargin: phoneScreen.height*0.235
           anchors.left: parent.left
           anchors.leftMargin: phoneScreen.width*172/1000


       Flickable{
           id:flickable
           anchors.fill:parent
           contentHeight:grid.height
           contentWidth:grid.width

           ListModel {
               id: appModel
               dynamicRoles: false
               ListElement { name: "Patty" }
                 ListElement { name: "Cindy"}
                 ListElement { name: "Chuck"}
                 ListElement { name: "Sherry"}
                 ListElement { name: "Rob"}
                 ListElement { name: "Josh"}
                 ListElement { name: "Nicole" }
                   ListElement { name: "Ken"}
                   ListElement { name: "Benny"}
                   ListElement { name: "Lucy"}
                   ListElement { name: "Kenneth"}
                   ListElement { name: "Jacob"}
                   ListElement { name: "Paulo" }
                     ListElement { name: "Alex"}
                     ListElement { name: "Carl"}
                     ListElement { name: "Robin"}
                     ListElement { name: "Barney"}
                     ListElement { name: "Rachel"}
             }


           ListView {
               width: grid.width
               height: grid.height
               model: appModel
               spacing: 10
                 delegate: Item
                 {
                     width: grid.width*0.6
                     height: grid.height*0.06


                     Rectangle
                     {
                         id: myIcon
                         anchors.horizontalCenter: parent.horizontalCenter
                         width: grid.width*0.6
                         height: grid.height*0.1
                         color: "black"



                     Text
                     {
                             id:textArea1
                            anchors.verticalCenter: myIcon.verticalCenter
                           text: name
                           color: "white"
                           font.pixelSize: grid.width*0.03
                           font.bold:true
                           font.family: "Arial"


                     }

                     }
                     MouseArea{
                         anchors.fill:myIcon
                         hoverEnabled: true
                         onEntered: {
                             myIcon.color="lightblue"
                         }
                         onExited: {
                             myIcon.color="transparent"
                         }

                         onPressed:
                         {  myIcon.width=(grid.width*0.6)*3/4
                             myIcon.height=(grid.height*0.06)*3/4
                             textArea1.font.pixelSize = textArea1.font.pixelSize * 0.75



                         }
                         onReleased: {
                             myIcon.width=grid.width*0.6
                              myIcon.height=grid.height*0.06

                             textArea1.font.pixelSize = grid.width*0.03

                         }



                         }
                     }

                 }



       }
       }


}
