//
//  Game.swift
//  OneRowInLine
//
//  Created by gabriel Sazo on 2022-09-13.
//
import Foundation
//a Model
class Game{
    var gameStatus : String // Current Game status
    var counterTotalPlayersTries : Int // Current player tries
    let MAX_PLAYER_TRIES = 9 // Constant
    var boardGame = Array<Int>() //Declaration of and Array list atribut. It Will reflect Game-Board
    
        init(gameStatus : String, counterPlayersTries: Int){
            self.gameStatus = gameStatus
            self.counterTotalPlayersTries = counterPlayersTries
            self.boardGame=[0,0,0,0,0,0,0,0,0] //Game board
        }
    //Increase the total Player tries
    func increaseTotalCounter(){
        counterTotalPlayersTries += 1
    }
    //set a boked place in the Game-Board
    func addUsedPlaceInBoard(index: Int){
        boardGame[index] = 1
    }
    //Check if there is A winner or No winners at last
    func gameOverCheck(player1: Player, player2 : Player) -> Bool{
        if(counterTotalPlayersTries == MAX_PLAYER_TRIES  && player1.winnerStatus != true && player2.winnerStatus != true){
            return true
        } else {return false}
    }
    /*
    func testMainBoard(){
        for place in boardGame{
            print(place)
        }
    }
    */
}
