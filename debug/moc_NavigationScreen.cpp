/****************************************************************************
** Meta object code from reading C++ file 'NavigationScreen.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.9.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../NavigationScreen.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'NavigationScreen.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.9.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_NavigationScreen_t {
    QByteArrayData data[6];
    char stringdata0[56];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_NavigationScreen_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_NavigationScreen_t qt_meta_stringdata_NavigationScreen = {
    {
QT_MOC_LITERAL(0, 0, 16), // "NavigationScreen"
QT_MOC_LITERAL(1, 17, 9), // "onRefresh"
QT_MOC_LITERAL(2, 27, 0), // ""
QT_MOC_LITERAL(3, 28, 5), // "value"
QT_MOC_LITERAL(4, 34, 14), // "showNextScreen"
QT_MOC_LITERAL(5, 49, 6) // "onBack"

    },
    "NavigationScreen\0onRefresh\0\0value\0"
    "showNextScreen\0onBack"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_NavigationScreen[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    1,   29,    2, 0x0a /* Public */,
       4,    0,   32,    2, 0x0a /* Public */,
       5,    0,   33,    2, 0x0a /* Public */,

 // slots: parameters
    QMetaType::Void, QMetaType::QVariant,    3,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void NavigationScreen::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        NavigationScreen *_t = static_cast<NavigationScreen *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->onRefresh((*reinterpret_cast< QVariant(*)>(_a[1]))); break;
        case 1: _t->showNextScreen(); break;
        case 2: _t->onBack(); break;
        default: ;
        }
    }
}

const QMetaObject NavigationScreen::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_NavigationScreen.data,
      qt_meta_data_NavigationScreen,  qt_static_metacall, nullptr, nullptr}
};


const QMetaObject *NavigationScreen::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *NavigationScreen::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_NavigationScreen.stringdata0))
        return static_cast<void*>(const_cast< NavigationScreen*>(this));
    return QObject::qt_metacast(_clname);
}

int NavigationScreen::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 3)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 3;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
