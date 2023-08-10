//
//  WinnerCordenates.swift
//  OneRowInLine
//
//  Created by gabriel Sazo on 2022-09-13.
//
import Foundation

//A Model
class WinnerCordenates{
    let H_0: [Int] = [0,1,2]
    let H_1: [Int] = [3,4,5]
    let H_2: [Int] = [6,7,8]
    
    let V_0: [Int] = [0,3,6]
    let V_1: [Int] = [1,4,7]
    let V_2: [Int] = [2,5,8]
    
    let D_0: [Int] = [0,4,8]
    let D_2: [Int] = [6,4,2]

    let WINNER_CORDENATES_LENGTH = 3 // Cordenate array length
    var allCordenatesTest : [[Int]] //will contains all Winner cordenates
    
    init(){
        allCordenatesTest = [H_0 , H_1 , H_2 , V_0 , V_1 , V_2 , D_0, D_2] // Initialice All Cordenates inside an Array
    }
    //Check Player Winner status - Compare Player tries with the Winner cordenates and decide
    func checkWinnerStatus(player: Player, game: Game){
        let cordenatesTest = WinnerCordenates()
        var matchWinnersCounter = 0 //must count to 3
        if game.counterTotalPlayersTries >= 5 {
            for i in cordenatesTest.allCordenatesTest.indices{
                matchWinnersCounter = 0
                for playerNumber in player.listSelectedNumbers{
                    //Must find 3 secuense of numbers (winner cordenates)
                    if cordenatesTest.allCordenatesTest[i].contains(playerNumber) {
                        matchWinnersCounter += 1
                    }
                    //Check if the Current player has win
                    if matchWinnersCounter == WINNER_CORDENATES_LENGTH {player.winnerStatus = true}
                }
            if player.winnerStatus {break;} // end the loop and go outside
            }
            //if player.winnerStatus {print("winner") }else {print("lose")}
            }
        }
}

