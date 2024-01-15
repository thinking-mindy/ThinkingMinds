#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QIcon>
#include "minds.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon("./ThinkingMinds/img/icon.ico"));
    qmlRegisterType<minds>("Minds",1,0,"Minds");
    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/ThinkingMinds/app/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
