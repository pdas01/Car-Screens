import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.3
import  QtMultimedia 5.8

Item
{
    visible: true
    property int screenHeight: 600
    property int screenWidth: 1000
    width: 1000
    height: 600
//    width: parent ? parent.width : 0
//    height: parent ? parent.height : 0

    id: window

    Image
    {
        id:background
        source:"Images/backgroud screen1.jpg"
        anchors.fill: window
    }
    HomeButton
    {
        id: homeButton
        mainScreenHeight: window.height
        mainScreenWidth: window.width
    }
    Image{
        id:mediaIcon
        objectName: "mediaIcon"
        source:"Images/media.png"
        width:window.width*0.1
        height:window.height/8.5
        anchors.top: parent.top
        anchors.topMargin: window.height*25/600
        anchors.left: parent.left
        anchors.leftMargin:window.width*120/1000
        fillMode: Image.PreserveAspectFit

    }
    Text{
        id:headingMedia
        text:"MEDIA"
        font.bold: true
        font.family: "Arial"
        font.pointSize: window.width*18/1000
        color: "white"
        anchors.left:mediaIcon.right
        anchors.leftMargin: window.width*10/1000
        anchors.top:parent.top
        anchors.topMargin:window.height* 45/600
    }


    Time
    {
        anchors.right:parent.right
        anchors.rightMargin: parent.width*20/1000
        anchors.top: parent.top
        anchors.topMargin: parent.height*16/600
        mainScreenWidth: window.width
        mainScreenHeight: window.height
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
        anchors.top: parent.top
        anchors.left:parent.left
        anchors.leftMargin: window.width*110/1000
    }


    Rectangle{id:usb
        height:parent.height*125/600
        width:parent.width*110/1000
        anchors.top:parent.top
        anchors.topMargin:window.height*120/600
        anchors.left:window.left
        color:"transparent"
        border.color:"gray"
        MouseArea{hoverEnabled:true
            anchors.fill:usb
            onPressed:{usb.color="lightblue"
            }
            onEntered:{usb.color="lightblue"}
            onExited:{usb.color="transparent"}
            onReleased:{usb.color="transparent"}

        }


    }
    Text{text:"USB"
        color:"white"
        anchors.top:usb.top
        anchors.topMargin:usb.height/2.5
        anchors.horizontalCenter:usb.horizontalCenter
        font.pointSize:window.height*14/600
        font.bold:true
        font.family: "Arial"
    }



    Rectangle
    {id:cd
        height:parent.height*125/600
        width:parent.width*110/1000
        anchors.top:usb.bottom
        anchors.left:window.left
        color:"transparent"
        border.color:"gray"

        MouseArea{hoverEnabled:true
            anchors.fill:cd
            onPressed:{cd.color="lightblue"

            }
            onEntered:{cd.color="lightblue"}
            onExited:{cd.color="transparent"}
            onReleased:{cd.color="transparent"}

        }


    }

    Text{text:"CD"
        color:"white"
        anchors.top:cd.top
        anchors.topMargin:cd.height/2.5
        anchors.horizontalCenter:cd.horizontalCenter
        font.pointSize:window.height*14/600
        font.bold:true
        font.family: "Arial"
    }


    Rectangle{id:dvd
        height:parent.height*125/600
        width:parent.width*110/1000
        anchors.top:cd.bottom
        anchors.left:window.left
        color:"transparent"
        border.color:"gray"
        MouseArea{hoverEnabled:true
            anchors.fill:dvd
            onPressed:{dvd.color="lightblue"}
            onEntered:{dvd.color="lightblue"}
            onExited:{dvd.color="transparent"}
            onReleased:{dvd.color="transparent"}

        }}

    Text{text:"DVD"
        color:"white"
        anchors.top:dvd.top
        anchors.topMargin:dvd.height/2.5
        anchors.horizontalCenter:dvd.horizontalCenter
        font.pointSize:window.height*14/600
        font.bold:true
        font.family: "Arial"
    }


    Rectangle{id:bt
        height:parent.height*125/600
        width:parent.width*110/1000
        anchors.top:dvd.bottom
        anchors.left:window.left
        color:"transparent"
        border.color:"gray"
        MouseArea{hoverEnabled:true
            anchors.fill:bt
            onPressed:{bt.color="lightblue"}
            onEntered:{bt.color="lightblue"}
            onExited:{bt.color="transparent"}
            onReleased:{bt.color="transparent"}


        }}

    Text{text:"BT"
        color:"white"
        anchors.top:bt.top
        anchors.topMargin:bt.height/2.5
        anchors.horizontalCenter:bt.horizontalCenter
        font.pointSize:window.height*14/600
        font.bold:true
        font.family: "Arial"
    }


    Audio{
        property string playTime
        id:playMusic
        source:"Music/Closer.mp3"
        volume:0.3
        playTime:playMusic.duration

}

        Image{
            id:forward
            height:window.height*60/600
            anchors.leftMargin: window.width*294/1000
            anchors.topMargin: window.height*512/600
            width:window.width*0.06
            anchors.top:parent.top
            anchors.left:parent.left
            source:"Images/forward .png"
            fillMode:Image.PreserveAspectFit

        }
        MouseArea{

            anchors.fill:forward

        }


        Image{
            id:pause
            source:"Images/123.png"
            height:window.height*60/600
            anchors.leftMargin: window.width*370/1000
            anchors.topMargin: window.height*512/600
            width:window.width*0.06
            anchors.top:parent.top
            anchors.left:parent.left
            fillMode:Image.PreserveAspectFit
        }
        MouseArea{

            anchors.fill:pause
            onClicked: {
                console.log("pause clicked")
                playMusic.pause()
            }

        }



            Image{
                id:play
                objectName: "playButton"
                signal playDuration(var value)
                source:"Images/play 123.png"
                height:window.height*60/600
                anchors.leftMargin:window.width* 447/1000
                anchors.topMargin: window.height*512/600
                width:window.width*0.06
                anchors.top:parent.top
                anchors.left:parent.left
                fillMode:Image.PreserveAspectFit
            }

        MouseArea{
            id:playArea
            objectName: play.objectName
            anchors.fill:play

            onClicked:  {
                console.log(getTimeFromMSec(playMusic.duration))

                //playMusic.position = slider.value
                playMusic.play()

            }

        }
        function getTimeFromMSec(msec) {
                if (msec <= 0 || msec === undefined) {
                    return ""

                } else {
                    var sec = "" + Math.floor(msec / 1000) % 60
                    if (sec.length == 1)
                        sec = "0" + sec

                    var hour = Math.floor(msec / 3600000)
                    if (hour < 1) {
                        return Math.floor(msec / 60000) + ":" + sec
                    } else {
                        var min = "" + Math.floor(msec / 60000) % 60
                        if (min.length == 1)
                            min = "0" + min

                        return hour + ":" + min + ":" + sec
                    }
                }
            }


        Image{
            id:backword
            source:"Images/backward.png"
            height:window.height*60/600
            anchors.leftMargin: window.width*525/1000
            anchors.topMargin: window.height*512/600
            width:window.width*0.06
            anchors.top:parent.top
            anchors.left:parent.left
            fillMode:Image.PreserveAspectFit
        }
        MouseArea{
            anchors.fill:backword
            onClicked: {
                playMusic.playing();
                playMusic.seek(5)
            }
        }
        Image {
            id: volume
            x: window.width*661/1000
            y: window.height*521/600
            width: window.width*45/1000
            source: "Images/loud.png"
            height: window.height*42/600
            fillMode:Image.PreserveAspectFit

        }
        Slider{
            id:volSlider
            width: window.width*179/1000
            height: window.height*40/600
            anchors.leftMargin: window.width*746/1000
            anchors.topMargin: window.height*523/600
            anchors.top:parent.top
            anchors.left:parent.left
            from:0
            stepSize: 0.1
            to:1
            onValueChanged: {
                playMusic.volume=volSlider.value
            }
        }


        Slider{
            anchors.top:parent.top
            anchors.left:parent.left
            id:slider
            width: window.width*250/1000
            height:window.height*50/600
            anchors.leftMargin: window.width*327/1000
            anchors.topMargin: window.height*397/600
            to: playMusic.duration
            from:0
            property bool sync: false
            stepSize: 500

            onValueChanged:
            {
                if(!sync)
                    playMusic.seek(value)
           }
            Connections{
                target: playMusic
                onPositionChanged:
                {
                    slider.sync = true
                    slider.value = playMusic.position
                    slider.sync = false
                }

            }
            background: Rectangle {
                x: slider.leftPadding
                y: slider.topPadding + slider.availableHeight / 2 - height / 2
                implicitWidth: window.width * 200/1000
                implicitHeight: window.height * 4/600
                width: slider.availableWidth
                height: implicitHeight
                radius: window.width * 0.002
                color: "#bdbebf"

               Rectangle {
                    width: slider.visualPosition * parent.width
                    height: parent.height
                    color: "#ff3232"
                    radius: window.width * 0.002
                }
            }


            handle: Rectangle {
                x: slider.leftPadding + slider.visualPosition * (slider.availableWidth - width)
                y: slider.topPadding + slider.availableHeight / 2 - height / 2
                implicitWidth: window.width * 22/1000
                implicitHeight: implicitWidth
                radius: implicitWidth/2
                color: "#ff3232"
                border.color: "#ff3232"
            }
         Text
         {
             id:lowtext
             anchors.top:slider.bottom
             anchors.left:slider.left
             anchors.topMargin:window.height*2/600
             function onGoingTime(){
                     var songTime=0
                    if (Math.round((slider.value/1000)%60).toString().length === 1)
                    {
                        songTime = Math.floor((slider.value/1000)/60)+":0" +Math.round((slider.value/1000)%60)
                    }
                    else
                    {
                         songTime=Math.floor((slider.value/1000)/60)+":" +Math.round((slider.value/1000)%60)
                    }

                 return songTime
                }
                text:onGoingTime()
                color:"white"

         }

            Text
            {
                id:hightext
                anchors.top:slider.bottom
                anchors.left:slider.left
                anchors.leftMargin:slider.width
                anchors.topMargin:window.height*2/600
                text:getTimeFromMSec(playMusic.duration)
                color:"white"

            }

        }

   Image
   {
        anchors.top: parent.top
        anchors.topMargin: window.height*150/600
        anchors.left: parent.left
        anchors.leftMargin: window.width*780/1000
        fillMode: Image.PreserveAspectFit
        source: "Images/Music-icon.png"
        height:window.height*15/60
        width:window.width*0.15
    }
    Text
    {
        id:text2
        text: "Closer-(feat Halsey)"
        font.pointSize:window.width*20/1000
        font.bold:true
        font.family: "Arial"
        color:"white"
        anchors.top:parent.top
        anchors.topMargin:window.height*200/600
        anchors.left:parent.left
        anchors.leftMargin:window.width*300/1000

    }

}
