#include "minds.h"
#include <QDebug>
#include <QString>
#include <QFile>
#include <QProcess>

minds::minds(QObject *parent): QObject{parent}{

}

QList<QString> minds::c_cmd(){
    QList<QString> err;
    system("iwlist wlan0 scanning | grep ESSID > tes.minds");
    QFile file("tes.minds");
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)){return err;}
    QTextStream in(&file);
    QList<QString> res;
    while (!in.atEnd()){QString line = in.readLine();res.append(line);}
    return res;
}

QList<QString> minds::qt_cmd2(QString cmd,QString arg){
    QProcess shell;
    QList<QString> err("An error occured");
    shell.start(cmd,QStringList()<<arg);
    if (!shell.waitForStarted()){return err;}
    if (!shell.waitForFinished()){return err;}
    QList<QString> res;
    while (!shell.atEnd()){QString line = shell.readLine();res.append(line);}
    return res;
}
QList<QString> minds::qt_cmd1(QString cmd){
    QProcess shell;
    QList<QString> err("An error occured");
    shell.startCommand(cmd);
    if (!shell.waitForStarted()){return err;}
    if (!shell.waitForFinished()){return err;}
    QList<QString> res;
    while (!shell.atEnd()){QString line = shell.readLine();res.append(line);}
    return res;
}
