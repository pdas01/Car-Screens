#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickItem>
#include <QQuickWindow>
#include <iostream>
#include <MainScreen.h>
#include <QQmlContext>
#include <RootWindow.h>
using namespace std;


int main(int argc, char  *argv[])
{

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    RootWindow rootWindowObject;

    rootWindowObject.setHeight(600);
    rootWindowObject.setWidth(1000);

    engine.rootContext()->setContextProperty("rootWindowHeight",rootWindowObject.getHeight());
    engine.rootContext()->setContextProperty("rootWindowWidth",rootWindowObject.getWidth());

    if (engine.rootObjects().isEmpty())
      {  return -1;}

    //Show Main Screen
    MainScreen mainScreen;
    mainScreen.setEngine(&engine);
    mainScreen.show();

    return app.exec();
}
