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

QList<QString> minds::qt_cmd2(QString cmd,QStringList arg){
    QProcess shell;
    QList<QString> err("An error occured");
    shell.start(cmd,QStringList()<<arg);
    if (!shell.waitForStarted() || !shell.waitForFinished()){return err;}
    QList<QString> res;
    while (!shell.atEnd()){QString line = shell.readLine();res.append(line);}
    return res;
}
QList<QString> minds::qt_cmd1(QString cmd){
    QProcess shell;
    QList<QString> err("An error occured");
    shell.startCommand(cmd);
    if (!shell.waitForStarted() || !shell.waitForFinished()){return err;}
    QList<QString> res;
    while (!shell.atEnd()){QString line=shell.readLine();res.append(line);}
    return res;
}
QList<QString> minds::qt_wifi(QString cmd){
    QProcess shell;
    QList<QString> err("An error occured");
    //shell.startCommand("sudo airmon-ng start wlan0");
    shell.startCommand(cmd);
    if (!shell.waitForStarted() || !shell.waitForFinished()){return err;}
    QList<QString> res;
    while (!shell.atEnd()){QString line = shell.readLine();res.append(line);}
    return res;
}
QString minds::testing(){
    return "testing";
}
bool minds::reset(){
    QProcess shell;
    shell.startCommand("sudo airmon-ng stop wlan0");
    shell.startCommand("sudo airmon-ng stop wlan0mon");
    shell.startCommand("sudo airmon-ng stop wlan1");
    if (!shell.waitForStarted() || !shell.waitForFinished()){return false;}
    return true;
}

