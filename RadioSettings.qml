import QtQuick 2.8
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.3

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
            anchors.leftMargin:window.width *120/1000
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
//                    rootWindow.changeScreen("SettingsScreen.qml")
                }
            }

        }
        Text{
            id:headingSettings
            text:"SETTINGS  >  RADIO"
            font.bold: true
            font.family: "Arial"
            font.pointSize: window.width * 18/1000
            color: "white"
            anchors.left:settingsIcon.right
            anchors.leftMargin: window.width*10/1000
            anchors.top:parent.top
            anchors.topMargin: window.height * 45/600
        }

//----TA----//
        ExclusiveGroup{
            id:tabPositionGroup
        }
        ExclusiveGroup{
            id:tabPositionGroup2
        }
        ExclusiveGroup{
            id:tabPositionGroup3
        }

        Rectangle{
            id: taRect
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
                anchors.verticalCenter: taRect.verticalCenter
                anchors.horizontalCenter: taRect.horizontalCenter
                color: "white"
                text: "Traffic Announcements"
                font.bold: true
                font.pixelSize: window.width * 30/1000
            }
        }

        Rectangle{
            id: onRect
            height: window.height * 75/600
            width: window.width*  50/1000
            anchors.left: taRect.right
            anchors.leftMargin: window.width*  50/1000
            anchors.top: horizontalLine.bottom
            anchors.topMargin: window.height * 45/600
            color: "transparent"
            Text{
                anchors.centerIn: onRect
                color: "white"
                text: "On"
                font.bold: true
                font.pixelSize: window.width * 30/1000
            }

        }

        RadioButton{
            id: onButton
            anchors.left: onRect.right
            anchors.leftMargin: window.width*  50/1000
            anchors.top: horizontalLine.bottom
            anchors.topMargin: window.height * 67.5/600

            style:RadioButtonStyle
            {
            indicator: Rectangle {
                      width: window.width * 32/1000
                      height: width
//                     x: onButton.leftPadding
                      y: parent.height / 2 - height / 2
                      radius: width/2
                      color: "transparent"
                      border.width: window.width*2/1000
                      border.color: "white"

                      Rectangle {
                          width: window.width * 14/1000
                          height: width
                          anchors.centerIn: parent
                          radius: width/2
                          color: onButton.down ? "transparent" : "blue"
                          visible: onButton.checked
                      }
                  }

            }
            exclusiveGroup: tabPositionGroup


       }

        Rectangle{
            id: offRect
            height: window.height * 75/600
            width: window.width*  50/1000
            anchors.left: onButton.right
            anchors.leftMargin: window.width*  50/1000
            anchors.top: horizontalLine.bottom
            anchors.topMargin: window.height * 45/600
            color: "transparent"
            Text{
                anchors.centerIn: offRect
                color: "white"
                text: "Off"
                font.bold: true
                font.pixelSize: window.width * 30/1000
            }

        }

        RadioButton{
            id: offButton
            anchors.left: offRect.right
            anchors.leftMargin: window.width*  50/1000
            anchors.top: horizontalLine.bottom
            anchors.topMargin: window.height * 67.5/600
            style:RadioButtonStyle{

            indicator: Rectangle {
                      width: window.width * 32/1000
                      height: width
//                     x: offButton.leftPadding
                     y: parent.height / 2 - height / 2
                      radius: width/2
                      color: "transparent"
                      border.width: 2
                      border.color: "white"

                      Rectangle {
                          width: window.width * 14/1000
                          height: width
                          anchors.centerIn: parent
                          radius: width/2
                          color: offButton.down ? "transparent" : "blue"
                          visible: offButton.checked
                      }
                  }
            }
            exclusiveGroup: tabPositionGroup


       }




//----TP---//

        Rectangle{
            id: tpRect
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
                anchors.verticalCenter: tpRect.verticalCenter
                anchors.horizontalCenter: tpRect.horizontalCenter
                color: "white"
                text: "TP Volume"
                font.bold: true
                font.pixelSize: window.width * 30/1000
            }
        }

        Slider{
            id:slider
            width:window.width *300/1000
            height:window.height * 10/600
            anchors.topMargin: window.height*163/600
            minimumValue:0
            maximumValue:100
            anchors.top: horizontalLine.bottom
            anchors.left: tpRect.right
            anchors.leftMargin: window.width*  50/1000

           style: SliderStyle
           {
            groove: Rectangle {
//                    x: slider.leftPadding
                    y: slider.topPadding + slider.availableHeight / 2 - height / 2
                    implicitWidth: window.width * 200/1000
                    implicitHeight: window.height * 4/600
                    width: slider.availableWidth
                    height: implicitHeight
                    radius: window.width * 0.002
                    color: "#bdbebf"

                    Rectangle {
                        height: parent.height
                        width: styleData.handlePosition

                        color: "blue"
                        radius: window.width * 0.002
                    }
                }

                handle: Rectangle {
                    x: slider.leftPadding + slider.visualPosition * (slider.availableWidth - width)
                    y: slider.topPadding + slider.availableHeight / 2 - height / 2
                    implicitWidth: window.width * 26/1000
                    implicitHeight: implicitWidth
                    radius: implicitWidth/2
                    color: slider.pressed ? "#f0f0f0" : "#f6f6f6"
                    border.color: "#bdbebf"
                }
        }
        }

               Text{
                   id:lowText
                anchors.left:slider.left
                anchors.top:slider.bottom
                anchors.topMargin: window.height * 5/1000
                font.bold: true
                text:"0"
                color:"white"
                font.pixelSize: window.width * 18/1000
                }


               Text{
                   id:highText
                 anchors.left:slider.right
                 anchors.top:slider.bottom
                 anchors.topMargin: window.height * 5/1000
                 text: "100"
                 color: "white"
                 font.pixelSize: window.width * 18/1000

             }

 //       }

//---Radio Text---//

        Rectangle{
            id: radioTextRect
            height: window.height * 75/600
            width: window.width*  400/1000
            anchors.left: verticalLine.right
            anchors.leftMargin: window.width * 45/1000
            anchors.top: horizontalLine.bottom
            anchors.topMargin: window.height * 235/600
            color: "transparent"
            border.color: "white"
            border.width: window.width*1/1000
            Text{
                anchors.verticalCenter: radioTextRect.verticalCenter
                anchors.horizontalCenter: radioTextRect.horizontalCenter
                color: "white"
                text: "Radio Text"
                font.bold: true
                font.pixelSize: window.width * 30/1000
            }

           }

        Rectangle{
            id: onRect2
            height: window.height * 75/600
            width: window.width*  50/1000
            anchors.left: radioTextRect.right
            anchors.leftMargin: window.width*  50/1000
            anchors.top: horizontalLine.bottom
            anchors.topMargin: window.height * 235/600
            color: "transparent"
            Text{
                anchors.centerIn: onRect2
                color: "white"
                text: "On"
                font.bold: true
                font.pixelSize: window.width * 30/1000
            }

        }

        RadioButton{
            id: onButton2
            anchors.left: onRect2.right
            anchors.leftMargin: window.width*  50/1000
            anchors.top: horizontalLine.bottom
            anchors.topMargin: window.height * 257.5/600
            style:RadioButtonStyle{
            indicator: Rectangle {
                      width: window.width * 32/1000
                      height: width
//                     x: onButton2.leftPadding
                     y: parent.height / 2 - height / 2
                      radius: width/2
                      color: "transparent"
                      border.width: window.width*2/1000
                      border.color: "white"

                      Rectangle {
                          width: window.width * 14/1000
                          height: width
                          anchors.centerIn: parent
                          radius: width/2
                          color: onButton2.down ? "transparent" : "blue"
                          visible: onButton2.checked
                      }
                  }
}
            exclusiveGroup: tabPositionGroup2

       }

        Rectangle{
            id: offRect2
            height: window.height * 75/600
            width: window.width*  50/1000
            anchors.left: onButton2.right
            anchors.leftMargin: window.width*  50/1000
            anchors.top: horizontalLine.bottom
            anchors.topMargin: window.height * 235/600
            color: "transparent"
            Text{
                anchors.centerIn: offRect2
                color: "white"
                text: "Off"
                font.bold: true
                font.pixelSize: window.width * 30/1000
            }

        }



        RadioButton{
            id: offButton2
            anchors.left: offRect2.right
            anchors.leftMargin: window.width*  50/1000
            anchors.top: horizontalLine.bottom
            anchors.topMargin: window.height * 257.5/600

           style:RadioButtonStyle{

            indicator: Rectangle {
                      width: window.width * 32/1000
                      height: width
//                     x: offButton2.leftPadding
                     y: parent.height / 2 - height / 2
                      radius: width/2
                      color: "transparent"
                      border.width: window.width*2/1000
                      border.color: "white"

                      Rectangle {
                          width: window.width * 14/1000
                          height: width
                          anchors.centerIn: parent
                          radius: width/2
                          color: offButton2.down ? "transparent" : "blue"
                          visible: offButton2.checked
                      }
                  }
}
           exclusiveGroup: tabPositionGroup2


        }




//---Regional Stations---//

        Rectangle{
            id: stationsRect
            height: window.height * 75/600
            width: window.width*  400/1000
            anchors.left: verticalLine.right
            anchors.leftMargin: window.width * 45/1000
            anchors.top: horizontalLine.bottom
            anchors.topMargin: window.height * 330/600
            color: "transparent"
            border.color: "white"
            border.width: window.width*1/1000
            Text{
                anchors.verticalCenter: stationsRect.verticalCenter
                anchors.horizontalCenter: stationsRect.horizontalCenter
                color: "white"
                text: "Regional Stations"
                font.bold: true
                font.pixelSize: window.width * 30/1000
            }
        }

        Rectangle{
            id: onRect3
            height: window.height * 75/600
            width: window.width*  50/1000
            anchors.left: stationsRect.right
            anchors.leftMargin: window.width*  50/1000
            anchors.top: horizontalLine.bottom
            anchors.topMargin: window.height * 330/600
            color: "transparent"
            Text{
                anchors.centerIn: onRect3
                color: "white"
                text: "On"
                font.bold: true
                font.pixelSize: window.width * 30/1000
            }

        }

        RadioButton{
            id: onButton3
            anchors.left: onRect3.right
            anchors.leftMargin: window.width*  50/1000
            anchors.top: horizontalLine.bottom
            anchors.topMargin: window.height * 352.5/600

           style:RadioButtonStyle{
            indicator: Rectangle {
                      width: window.width * 32/1000
                      height: width
//                     x: onButton3.leftPadding
                     y: parent.height / 2 - height / 2
                      radius: width/2
                      color: "transparent"
                      border.width: window.width*2/1000
                      border.color: "white"

                      Rectangle {
                          width: window.width * 14/1000
                          height: width
                          anchors.centerIn: parent
                          radius: width/2
                          color: onButton3.down ? "transparent" : "blue"
                          visible: onButton3.checked
                      }
                  }
           }
           exclusiveGroup: tabPositionGroup3


       }

        Rectangle{
            id: offRect3
            height: window.height * 75/600
            width: window.width*  50/1000
            anchors.left: onButton2.right
            anchors.leftMargin: window.width*  50/1000
            anchors.top: horizontalLine.bottom
            anchors.topMargin: window.height * 330/600
            color: "transparent"
            Text{
                anchors.centerIn: offRect3
                color: "white"
                text: "Off"
                font.bold: true
                font.pixelSize: window.width * 30/1000
            }

        }



        RadioButton{
            id: offButton3
            anchors.left: offRect3.right
            anchors.leftMargin: window.width*  50/1000
            anchors.top: horizontalLine.bottom
            anchors.topMargin: window.height * 352.5/600

            style:RadioButtonStyle{
            indicator: Rectangle {
                      width: window.width * 32/1000
                      height: width
//                     x: offButton3.leftPadding
                     y: parent.height / 2 - height / 2
                      radius: width/2
                      color: "transparent"
                      border.width: window.width*2/1000
                      border.color: "white"

                      Rectangle {
                          width: window.width * 14/1000
                          height: width
                          anchors.centerIn: parent
                          radius: width/2
                          color: offButton3.down ? "transparent" : "blue"
                          visible: offButton3.checked
                      }
                  }


        }
            exclusiveGroup: tabPositionGroup3

        }
}
