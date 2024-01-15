#ifndef MINDS_H
#define MINDS_H

#include <QObject>

class minds : public QObject
{
    Q_OBJECT
public:
    explicit minds(QObject *parent = nullptr);

signals:

public slots:
    QList<QString> c_cmd();
    QList<QString> qt_cmd2(QString,QStringList);
    QList<QString> qt_cmd1(QString cmd);
    QList<QString> qt_wifi(QString cmd);
    QString testing();
    bool reset();
};

#endif // MINDS_H
