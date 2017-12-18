import QtQuick 2.8
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0


Item {

    objectName: "mainScreen"
    visible: true
    id: window
    width: 1000
    height: 600
//    width: parent ? parent.width : 0
//    height: parent ? parent.height : 0

  Component.onCompleted:
  {
//    console.log(width)
//    console.log(height)
   }
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
        anchors.right:window.right
        anchors.rightMargin: window.width*20/1000
        anchors.top: window.top
        anchors.topMargin: window.height*16/600
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
        id:borderLine
        width:window.width
        height:1
        color: "gray"
        anchors.top: window.top
        anchors.topMargin: window.height*125/600
    }



    Item
    {
        height: window.height* (0.7)
        width: window.width* (0.8)
        id: grid
        anchors.top: window.top
        anchors.topMargin: window.height*0.235
        anchors.left: window.left
        anchors.leftMargin: window.width*172/1000

           ListModel
            {
              id: appModel
              objectName: "appModel"
          }

        GridView {
            id:gridView
            objectName: "gridView"
            width: grid.width
            height: grid.height
            cellWidth: grid.width * (0.3)
            cellHeight: grid.height* (0.5)
            model: appModel
            clip: true
            signal released(int index)


            delegate:
                Item {
                  id:item1
                  width: grid.width*0.175
                  height: grid.height*0.35


                  Image {
                      Rectangle
                      {
                          id:backgroundRectangle
                          height: grid.height * 0.25 + 12
                          width: grid.width*120/800
                          opacity: 0.3
                          radius: grid.height*10/420
                          anchors.horizontalCenter: parent.horizontalCenter
                          color: "black"
                          border.color:"white"
                          border.width: grid.width*1.5/800
                          visible: false

                      }
                      RectangularGlow {
                            id: effect
                            anchors.fill: backgroundRectangle
                            glowRadius: grid.height*10/420
                            spread:grid.height* 0.2/420

                            color: "transparent"
                            cornerRadius: backgroundRectangle.radius + glowRadius
                        }



                      id: myIcon
                      anchors.horizontalCenter: parent.horizontalCenter
                      source: icon
                      width: grid.width*0.125
                      height: grid.height*0.25
                      fillMode: Image.PreserveAspectFit

                  }

                   Text {
                      id:textArea1
                      anchors
                      {
                          top: myIcon.bottom;
                          topMargin: parent.height* 20/600
                          horizontalCenter: myIcon.horizontalCenter
                      }
                      text: name
                      color: "white"
                      font.pointSize: grid.width*0.017
                      font.bold:true
                      font.family: "Arial"
                  }



                  MouseArea{
                      objectName: "gridMouse"
                      anchors.fill:myIcon
                      hoverEnabled: true
                      onEntered: {
                          backgroundRectangle.visible = true
                      }

                      onExited: {
                         backgroundRectangle.visible = false
                      }

                      onPressed: {

                          myIcon.width = myIcon.width * 0.75
                          myIcon.height = myIcon.height * 0.75
                          backgroundRectangle.height =  backgroundRectangle.height * 0.75
                          textArea1.font.pointSize = textArea1.font.pointSize * 0.6
                         gridView.currentIndex=index

                      }

                      onReleased: {
                          myIcon.width = grid.width*0.125
                          myIcon.height = grid.height*0.25
                          textArea1.font.pointSize = grid.width*0.017
                          backgroundRectangle.height = grid.height * 0.25
                          gridView.released(index)


                          }
                      }
                  }

              }

        }

            }
