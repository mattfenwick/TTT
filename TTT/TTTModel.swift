//
//  TTTModel.swift
//  TTT
//
//  Created by MattF on 12/5/14.
//  Copyright (c) 2014 MattF. All rights reserved.
//

import Foundation


class TTTModel {
    
    var _board: [[Team?]]
    var _nextTeam: Team
    var _winner: Team?
    
    init(board: [[Team?]], nextTeam: Team) {
        self._board = board
        self._nextTeam = nextTeam
        self._winner = Optional.None
    }
    
    convenience init(nextTeam: Team) {
        var board : [[Team?]] = []
        for (var i:Int = 0; i < 3; i++) {
            board.append([])
            for (var j:Int = 0; j < 3; j++) {
                board[i].append(nil)
            }
        }
        self.init(board: board, nextTeam: nextTeam)
    }
    
    convenience init() {
        self.init(nextTeam: Team.Xs)
    }
    
    
    enum Team : Printable {
        case Xs
        case Os
        
        var description : String {
            get {
                switch self {
                case .Xs:
                    return "Xs"
                case .Os:
                    return "Os"
                }
            }
        }
        
        func flip() -> Team {
            switch (self) {
            case .Xs:
                return .Os
            case .Os:
                return .Xs
            }
        }
    }
    
    enum MoveResult {
        case Success
        case GameOver
        case SpotTaken
    }
    
    func checkMatch(row: [Team?]) -> Team? {
        let first = row[0]
        for (var i = 0; i < row.count; i++) {
            if ( row[i] == Optional.None ) {
                return nil
            }
            if ( row[i] != first ) {
                return nil
            }
        }
        return first
    }
    
    let _checks : [[(Int,Int)]] = [
        [(0,0), (0,1), (0,2)],
        [(1,0), (1,1), (1,2)],
        [(2,0), (2,1), (2,2)],
        [(0,0), (1,0), (2,0)],
        [(0,1), (1,1), (2,1)],
        [(0,2), (1,2), (2,2)],
        [(0,0), (1,1), (2,2)],
        [(0,2), (1,1), (2,0)]
    ]
    
    func _checkGameOver() -> Team? {
        for path in _checks {
            var items = path.map({(r,c) in self._board[r][c]})
            var result = self.checkMatch(items)
            if ( result != nil ) {
                return result
            }
        }
        return Optional.None
    }
    
    func getWinner() -> Team? {
        self._winner = self._checkGameOver()
        return self._winner
    }
    
    // how should result be communicated?
    //   sum type return value?
    func move(row: Int, column: Int) -> MoveResult {
        let winner = self.getWinner()
        if ( winner != nil ) {
            return .GameOver
        }
        let val : Team? = self._board[row][column]
        if ( val == Optional.None ) {
            self._board[row][column] = self._nextTeam
            self._nextTeam = self._nextTeam.flip()
            return .Success
        }
        return .SpotTaken
    }
}
