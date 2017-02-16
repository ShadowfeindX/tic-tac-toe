import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: app
    visible: true
    width: 640
    height: 480
    title: qsTr("Tic Tac Toe LITE")
    property bool twoplayer: true
    property string defaultAlert: "Someone Already Played There!"
    property string alertText: "Someone Already Played There!"
    function clearAll() {
        _1.clearBoard()
        _2.clearBoard()
    }
    Dialog {
        id: alertDialog
        title: "Hey!"
        x: parent.width/2 - width/2
        standardButtons: Dialog.Ok
        contentItem: Rectangle {
            color: "red"
            implicitWidth: 200
            implicitHeight: 100
            Text {
                text: alertText
                font.pointSize: 15
                color: "black"
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                wrapMode: Text.Wrap
            }
        }
        onClosed: {
            if (alertText != defaultAlert) {
                if (twoplayer) _2.player = !(_2.player)
                else _1.player = !(_1.player)
                alertText = defaultAlert
                clearAll()
            }
        }
    }
    Dialog {
        id: chooseDialog
        title: "Hey!"
        x: parent.width/2 - width/2
        standardButtons: Dialog.Yes | Dialog.No
        onAccepted: {
            _1.ai = false
            _1.player = true
        }
        onRejected: {
            _1.ai = true
            _1.player = true
        }
        contentItem: Rectangle {
            color: "lightskyblue"
            implicitWidth: 200
            implicitHeight: 100
            Text {
                text: "Do you want to go first?"
                font.pointSize: 15
                color: "black"
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                wrapMode: Text.Wrap
            }
        }
    }
    Button {
        id: debug
        text: "debug"
        onClicked: backend.printBoard()
    }
    Button {
        id: clear
        text: "clear"
        anchors.top: debug.bottom
        onClicked: clearAll()
    }
    Button {
        id: solo
        text: "Solo"
        anchors.top: clear.bottom
        onClicked: {
            twoplayer = false
            clearAll()
            chooseDialog.open()
        }
    }
    Button {
        id: pvp
        anchors.top: solo.bottom
        text: "PvP"
        onClicked: {
            twoplayer = true
            clearAll()
        }
    }
    SinglePlayer {
        id: _1
        visible: !twoplayer
    }
    TwoPlayer {
        id: _2
        visible: twoplayer
    }
}
