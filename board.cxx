#include "board.hxx"

bool Board::setSpace(int i, bool p)
{
    m_board[i/3][i%3] = p;
    return true;
}

void Board::printBoard()
{
    for(std::array<int,3> a : m_board) {
        for(int i : a) {
            qDebug() << i;
        }
    }
}

int Board::checkBoard(int i, bool p)
{
    if
    ( ( (p == m_board[i/3][0]) && (p == m_board[i/3][1]) && (p == m_board[i/3][2]) ) ||
    ( (p == m_board[0][i%3]) && (p == m_board[1][i%3]) && (p == m_board[2][i%3]) ) ||
    ( (p == m_board[0][0]) && (p == m_board[1][1]) && (p == m_board[2][2]) ) ||
    ( (p == m_board[0][2]) && (p == m_board[1][1]) && (p == m_board[2][0]) ) ) return p;

    for(std::array<int,3> a : m_board) {
        for(int i : a) {
            if (i == -1) return -1;
        }
    }

    return 2;
}

void Board::clearBoard()
{
    std::array<int,3> a;
    a.fill(-1);
    m_board.fill(a);
}

int Board::move()
{
    for(int i = 0; i < 9; i++)
        if (m_board[i/3][i%3] == -1) return i;
    return -1;
}

Board::Board(QObject *parent) : QObject(parent)
{
    clearBoard();
}
