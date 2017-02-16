#include "board.hxx"

#include <QQmlContext>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    Board board;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("backend", &board);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
