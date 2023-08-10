//
//  InGameVC.swift
//  OneRowInLine
//
//  Created by gabriel Sazo on 2022-09-13.
//
import UIKit
// Created View Controller
class InGameVC: UIViewController {

    @IBOutlet weak var lblPlayeriD: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet var btnGameBoard: [UIButton]! // A colection of Buttons
    @IBOutlet weak var lblCurrentStatus: UILabel!
    
    //Initialise some Objects
    var mainGame = Game(gameStatus: "Playing", counterPlayersTries: 0)
    let winnerCordenates = WinnerCordenates()

    let player1 = Player(idPlayer: "Player X",labelPlayer: "X", selectedNumber: 0, yourTurn: true, winnerStatus: false)
    let player2 = Player(idPlayer: "Player O",labelPlayer: "O",selectedNumber: 0, yourTurn: false, winnerStatus: false)
    let arrayObjectsTest = [WinnerCordenates]()
    
    //Declarare some Constants type UIColor  .. Need organize
    
    let COLOR_PLAYER_X = UIColor.cyan //COLOR_PLAYER_X
    let COLOR_PLAYER_O = UIColor.magenta
    let C_GAME_OVER = UIColor.yellow
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        lblPlayeriD.text = player1.idPlayer
        lblCurrentStatus.text = mainGame.gameStatus
    }
    // Controll Which Player is Playing and if is the winner or not
    // finns Nested functions
    func playing(btnSelectedNumber : Int) -> String{
        if player1.yourTurn{
            mainGame.increaseTotalCounter() //works!
            mainGame.gameStatus = "Playing"
            player1.selectedNumber = btnSelectedNumber
            player1.addSelectedNumberToList()
            player1.sortNumberList()
            winnerCordenates.checkWinnerStatus(player: player1, game: mainGame)// Check if there is a winner
            if  player1.winnerStatus {
                lblStatus.text = "Winner"
                disableInvalidButtons() // testing
                lblPlayeriD.text = player1.idPlayer //return player1.labelPlayer
                lblPlayeriD.textColor = COLOR_PLAYER_X // change the color of The player-id Label
                }else {
                        player1.yourTurn = false // works!
                        player2.yourTurn = true
                        lblPlayeriD.text = player2.idPlayer
                        lblPlayeriD.textColor = COLOR_PLAYER_O // change the color of the player-id Label
                        lblStatus.textColor = COLOR_PLAYER_O
                        }
        return player1.labelPlayer
        }   else {
                mainGame.increaseTotalCounter()
                mainGame.gameStatus = "Playing"
                player2.selectedNumber = btnSelectedNumber
                player2.addSelectedNumberToList()
                player2.sortNumberList()
                winnerCordenates.checkWinnerStatus(player: player2, game: mainGame) //Check if Player winner
                    if  player2.winnerStatus {
                        lblStatus.text = "Winner"
                        lblPlayeriD.text = player2.idPlayer
                        disableInvalidButtons() // testing
                        lblPlayeriD.textColor = COLOR_PLAYER_O // fixed
                    }else{
                        player2.yourTurn = false // works!
                        player1.yourTurn = true
                        lblPlayeriD.text = player1.idPlayer
                        //return player2.labelPlayer
                        lblPlayeriD.textColor = COLOR_PLAYER_X // fixed
                        lblStatus.textColor = COLOR_PLAYER_X // fixed
                    }
            return player2.labelPlayer
            }
    }
    //If there is a winner before all places in the game-board are used so disable unuseless places (Buttons)
    func disableInvalidButtons(){
        for button in btnGameBoard{
            if mainGame.boardGame[button.tag] == 0 {
            button.isUserInteractionEnabled = false
            }
        }
    }
    // If there are no Winners and all places in game-board are use it so change some Labels and atributs
    func setGameOverLabelValues(){
        lblPlayeriD.text = " No Winners"
        lblPlayeriD.textColor = C_GAME_OVER
        lblCurrentStatus.text = "Game Over"
        lblCurrentStatus.textColor = C_GAME_OVER
    }
    // set Current player label in the current press Button
    func setColoursTextButtoms(sender: UIButton, playerLabel: String ){
        if playerLabel == "X"{
            sender.setTitleColor(COLOR_PLAYER_X , for: .normal)
        }else{
            sender.setTitleColor(COLOR_PLAYER_O , for: .normal)
            }
    }
    //Action Button will controll what button was pressed and dicede what Next
    @IBAction func onPress (sender: UIButton){
        var setPlayerLabel = ""
        
        switch sender.tag {
        case 0:
            //Sending the buttom index and recive the current player label
            setPlayerLabel = playing(btnSelectedNumber: 0)
            sender.setTitle(setPlayerLabel, for: .normal) // set a label for a buttom
            setColoursTextButtoms(sender: sender, playerLabel: setPlayerLabel)//clange the color of the Player Label
            mainGame.addUsedPlaceInBoard(index: 0) // Add a used place in the game-board
            sender.isUserInteractionEnabled = false // Disable the Button efter used It
            // check game over and set new values to Labels
            if mainGame.gameOverCheck(player1: player1,player2: player2) { setGameOverLabelValues()}
        case 1:
            setPlayerLabel = playing(btnSelectedNumber: 1)
            sender.setTitle(setPlayerLabel, for: .normal)
            setColoursTextButtoms(sender: sender, playerLabel: setPlayerLabel)
            mainGame.addUsedPlaceInBoard(index: 1)
            sender.isUserInteractionEnabled = false
            if mainGame.gameOverCheck(player1: player1,player2: player2){ setGameOverLabelValues()}
        case 2:
            setPlayerLabel = playing(btnSelectedNumber: 2)
            sender.setTitle(setPlayerLabel, for: .normal)
            setColoursTextButtoms(sender: sender, playerLabel: setPlayerLabel)
            mainGame.addUsedPlaceInBoard(index: 2)
            sender.isUserInteractionEnabled = false
            if mainGame.gameOverCheck(player1: player1,player2: player2){ setGameOverLabelValues()}
        case 3:
            setPlayerLabel = playing(btnSelectedNumber: 3)
            sender.setTitle(setPlayerLabel, for: .normal)
            setColoursTextButtoms(sender: sender, playerLabel: setPlayerLabel)
            mainGame.addUsedPlaceInBoard(index: 3)
            sender.isUserInteractionEnabled = false
            if mainGame.gameOverCheck(player1: player1,player2: player2){ setGameOverLabelValues()}
        case 4:
            setPlayerLabel = playing(btnSelectedNumber: 4)
            sender.setTitle(setPlayerLabel, for: .normal)
            setColoursTextButtoms(sender: sender, playerLabel: setPlayerLabel)
            mainGame.addUsedPlaceInBoard(index: 4)
            sender.isUserInteractionEnabled = false
            if mainGame.gameOverCheck(player1: player1,player2: player2){ setGameOverLabelValues()}
        case 5:
            setPlayerLabel = playing(btnSelectedNumber: 5)
            sender.setTitle(setPlayerLabel, for: .normal)
            setColoursTextButtoms(sender: sender, playerLabel: setPlayerLabel)
            mainGame.addUsedPlaceInBoard(index: 5)
            sender.isUserInteractionEnabled = false
            if mainGame.gameOverCheck(player1: player1,player2: player2){ setGameOverLabelValues()}
        case 6:
            setPlayerLabel = playing(btnSelectedNumber: 6)
            sender.setTitle(setPlayerLabel, for: .normal)
            setColoursTextButtoms(sender: sender, playerLabel: setPlayerLabel)
            mainGame.addUsedPlaceInBoard(index: 6)
            sender.isUserInteractionEnabled = false
            if mainGame.gameOverCheck(player1: player1,player2: player2){ setGameOverLabelValues()}
        case 7:
            setPlayerLabel = playing(btnSelectedNumber: 7)
            sender.setTitle(setPlayerLabel, for: .normal)
            setColoursTextButtoms(sender: sender, playerLabel: setPlayerLabel)
            mainGame.addUsedPlaceInBoard(index: 7)
            sender.isUserInteractionEnabled = false
            if mainGame.gameOverCheck(player1: player1,player2: player2){ setGameOverLabelValues()}
        case 8:
            setPlayerLabel = playing(btnSelectedNumber: 8)
            sender.setTitle(setPlayerLabel, for: .normal)
            setColoursTextButtoms(sender: sender, playerLabel: setPlayerLabel)
            mainGame.addUsedPlaceInBoard(index: 8)
            sender.isUserInteractionEnabled = false
            if mainGame.gameOverCheck(player1: player1,player2: player2){ setGameOverLabelValues()}
        default: print("No btn number")
        }
    }
}
