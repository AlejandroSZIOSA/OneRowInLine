//
//  Player.swift
//  OneRowInLine
//
//  Created by gabriel Sazo on 2022-09-13.
//
import Foundation
//A Model
class Player{
    var idPlayer : String // Player + symbol
    var labelPlayer : String //The symbol of the player
    var selectedNumber : Int //Current Player try
    var listSelectedNumbers = Array<Int>() // Array will hold all Player tries (index or button.tag)
    var yourTurn : Bool // It is used for do want know what is the next turn
    var winnerStatus : Bool // If Player has win
    
    //Initialisation
        init(idPlayer: String,labelPlayer: String, selectedNumber:Int, yourTurn:Bool, winnerStatus:Bool) {
            self.idPlayer = idPlayer
            self.labelPlayer = labelPlayer
            self.selectedNumber = selectedNumber // self refers to the atribute in the class
            self.yourTurn = yourTurn
            self.winnerStatus = winnerStatus
            }
    //Add the current selected (index or button.tag) to the listSelectedNumbers
    func addSelectedNumberToList(){
        listSelectedNumbers.append(selectedNumber)
    }
    /* sort all selected Player tries List because after needs to be compared with the winnerCordenates secuences
       and because It is more organized */
    func sortNumberList(){
        listSelectedNumbers = listSelectedNumbers.sorted()
    }
}
