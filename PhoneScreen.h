#ifndef PHONESCREEN_H
#define PHONESCREEN_H

#include <QObject>
#include <QQmlApplicationEngine>
#include <HomeScreen.h>
#include <QQuickWindow>
#include <QQuickItem>
#include <MainScreen.h>

class HomeScreen;
class MainScreen;
class PhoneScreen : public QObject
{
    Q_OBJECT

public:
    explicit PhoneScreen(QObject *parent = nullptr);
    HomeScreen* homeScreen;
    void setEngine(QQmlApplicationEngine* engine);
    void show();


private:
    QQmlApplicationEngine* m_engine;
    QQuickWindow* m_window;
    QQuickItem* PhoneScreenRootItem;
    QQuickItem* dial;
    QQuickItem* contacts;
    QQuickItem* homeButton;
    MainScreen* mainScreen2;

public slots:
    void onRefresh(QVariant value);
    void showNextScreen();
    void onBack();
};

#endif // PHONESCREEN_H
