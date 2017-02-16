#ifndef BOARD_HXX
#define BOARD_HXX

#include <QObject>
#include <array>
#include <QDebug>
#include <tuple>

class Board : public QObject
{
    Q_OBJECT
//    Q_PROPERTY(int space READ space WRITE space NOTIFY spaceChanged)
public:
    explicit Board(QObject *parent = 0);

    Q_INVOKABLE bool setSpace(int i, bool p);
    Q_INVOKABLE void printBoard();
    Q_INVOKABLE int checkBoard(int i, bool p);
    Q_INVOKABLE void clearBoard();
    Q_INVOKABLE int move();

private:
    std::array<std::array<int,3>,3> m_board; // matrix for board
};

#endif // BOARD_HXX
