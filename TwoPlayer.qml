import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

GridView {
    property bool player: true
    function clearBoard() {
        for (var i = 0; i < 9; i++) {
            board.currentIndex = i
            board.currentItem.space = ""
        } board.currentIndex = -1
        backend.clearBoard()
    }
    id: board
    anchors.centerIn: parent // centers board
    width: parent.width>parent.height?parent.height:parent.width // set width to 3 rectangles wide
    height: width // set height to width
    cellWidth: width/3
    cellHeight: cellWidth
    model: 9 // 9 rectangles
    delegate: Rectangle {
        property alias space: text.text
        width: board.cellWidth // fill cell
        height: width
        border.color: 'black' // make a cell border
        Text {
            id: text
            text: ""
            anchors.centerIn: parent
            font.pixelSize: 0
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (text.text=="") {
                    text.color = player ? 'red' : 'blue'
                    text.text = player ? 'X' : 'O'
                    backend.setSpace(index,player)
                    switch (backend.checkBoard(index,player)) {
                    case -1:
                        console.debug('game still going')
                        break
                    case 0:
                        alertText = "Player 2 Wins!"
                        alertDialog.open()
                        break
                    case 1:
                        alertText = "Player 1 Wins!"
                        alertDialog.open()
                        break;
                    case 2:
                        alertText = "Cat's Game!"
                        alertDialog.open()
                        break;
                    default:
                        console.debug('um....error?');
                    } player = !player
                } else {
                    alertDialog.open()
                }
            }
        }
    }
}
