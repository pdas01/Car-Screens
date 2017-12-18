#include "MediaScreen.h"
#include <QDebug>
#include<iostream>

using namespace std;
MediaScreen::MediaScreen(QObject *parent) : QObject(parent)
{
    homeScreen = new HomeScreen();

}
void MediaScreen::show()
{
    QQmlComponent* MediaScreenComponent = new QQmlComponent(m_engine,QUrl("qrc:/MediaScreen.qml"));
    QQuickItem* MediaScreenRootItem = qobject_cast <QQuickItem*> (MediaScreenComponent->create());
    MediaScreenRootItem->setParentItem(m_window->contentItem());

    homeButton = MediaScreenRootItem->findChild<QQuickItem*>("homeButton");
    playMusic = MediaScreenRootItem->findChild<QQuickItem*>("playButton");


    showNextScreen();
    }

void MediaScreen::setEngine(QQmlApplicationEngine* engine)
{
    m_engine = engine;
    QObject *object = engine->rootObjects().at(0);
    m_window = qobject_cast <QQuickWindow*> (object);
}


void MediaScreen::showNextScreen()
{
    if(playMusic!=nullptr)
    {
        cout<<"The duration of the file"<<endl;
        QObject::connect(playMusic, SIGNAL(playDuration(QVariant)), this, SLOT(getDuration(QVariant)));
    }
    if(homeButton != nullptr)
    {
        cout << "home refresh found"<<endl;

        QObject::connect(homeButton, SIGNAL(refresh()), homeScreen, SLOT(onRefresh()));
    }
    homeScreen->setEngine(m_engine);
}

void MediaScreen::onRefresh(QVariant value)
{

    if(value=="home")
    {
        cout << "inside home"<<endl;
        mainScreen2 = new MainScreen();
        mainScreen2->setEngine(m_engine);
        mainScreen2->show();
//            delete MediaScreenRootItem;

    }
}

void MediaScreen::onBack()
{
  show();
}

void MediaScreen::getDuration(QVariant value)
{
//    cout<<"In getDuration function";
    QString s = value.toString();
//  cout<<s.toStdString();
}
MediaScreen::~MediaScreen()
{
    delete mainScreen2;
    delete MediaScreenRootItem;
}
