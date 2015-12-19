//
//  InterfaceController.swift
//  SlotWatch WatchKit Extension
//
//  Created by SHLEE on 12/11/15.
//  Copyright © 2015 SHLEE. All rights reserved.
//

import WatchKit
import Foundation



class InterfaceController: WKInterfaceController {
    
    
    @IBOutlet var spinButton : WKInterfaceButton!
    @IBOutlet var scoreLabel : WKInterfaceLabel!
    
    @IBOutlet var slotLeft1 : WKInterfaceImage!
    @IBOutlet var slotLeft2 : WKInterfaceImage!
    @IBOutlet var slotLeft3 : WKInterfaceImage!
    @IBOutlet var slotLeft4 : WKInterfaceImage!
    
    @IBOutlet var slotMiddle1 : WKInterfaceImage!
    @IBOutlet var slotMiddle2 : WKInterfaceImage!
    @IBOutlet var slotMiddle3 : WKInterfaceImage!
    @IBOutlet var slotMiddle4 : WKInterfaceImage!
    
    @IBOutlet var slotRight1 : WKInterfaceImage!
    @IBOutlet var slotRight2 : WKInterfaceImage!
    @IBOutlet var slotRight3 : WKInterfaceImage!
    @IBOutlet var slotRight4 : WKInterfaceImage!

    
    
    
    
    var timer : NSTimer!
    var isSpinning : Bool! = false
    var gamePlayedCount : Int! = 0
    var totalScore : Int! = 100
    
    
    var numberOfTimesToSpinColumnLeft : Int! = 0
    var numberOfTimesToSpinColumnMiddle : Int! = 0
    var numberOfTimesToSpinColumnRight : Int! = 0
    
    var columnLeftCurrentSpinCount : Int! = 0
    var columnMiddleCurrentSpinCount : Int! = 0
    var columnRightCurrentSpinCount : Int! = 0
    
    var maxSpinCount : Int! = 130
    var minSpinCount : Int! = 115
    
    var itemsLeft : [Int] = [0,1,2,3,4,5,6,7,8,9]
    var itemsMiddle : [Int] = [0,1,2,3,4,5,6,7,8,9]
    var itemsRight : [Int] = [0,1,2,3,4,5,6,7,8,9]
    
    var selectedItemLeft : Int! = 19
    var selectedItemMiddle : Int! = 13
    var selectedItemRight : Int! = 15
    
    var namesOfItems: [String] = [ "slot-A-up", "slot-A-down",
        "slot-bonus-up", "slot-bonus-down",
        "slot-gem-up", "slot-gem-down",
        "slot-J-up", "slot-J-down",
        "slot-K-up", "slot-K-down",
        "slot-L-up", "slot-L-down",
        "slot-Q-up", "slot-Q-down",
        "slot-star-up", "slot-star-down",
        "slot-wild-up", "slot-wild-down",
        "slot-7-up", "slot-7-down"
        
    ]
    
    var valuesOfItemsX3: [String] = ["3","3",
        "50","50",
        "10","10",
        "70","70",
        "100","100",
        "25","25",
        "80","80",
        "500","500",
        "200","200",
        "1000","1000"]
    
    var valuesOfItemsX2: [String] = ["2","2",
        "25","25",
        "5","5",
        "35","35",
        "50","50",
        "12","12",
        "40","40",
        "250","250",
        "100","100",
        "300","300"]
    
    var winTextForItemsX3: [String] = ["3 pots","3 pots",
        "3 bonuses","3 bonuses",
        "3 diamonds","3 diamonds",
        "3 jacks","3 jacks",
        "3 kings","3 kings",
        "3 helmets","3 helmets",
        "3 queens","3 queens",
        "3 stars","3 stars",
        "3 wilds","3 wilds",
        "3 sevens","3 sevens"]
    
    var winTextForItemsX2: [String] = ["2 pots","2 pots",
        "2 bonuses","2 bonuses",
        "2 diamonds","2 diamonds",
        "2 jacks","2 jacks",
        "2 kings","2 kings",
        "2 helmets","2 helmets",
        "2 queens","2 queens",
        "2 stars","2 stars",
        "2 wilds","2 wilds",
        "2 sevens","2 sevens"]
    
    var blinkDuration: Float! = 1.8
    var timerWin : NSTimer!
    var blinkISON : Bool! = false
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func SpinNow(_: AnyObject){
        
        //wheels are spinning
        //increase count
        //decrease score by the bet
        //timer that animates sipnning
        
        
        
        if(isSpinning == true){
            
            return
            
        }
        
        PrepareNextSpin()
        
        gamePlayedCount = gamePlayedCount + 1
        totalScore = totalScore - 1
        scoreLabel.setText(String(format:"%d", totalScore))
        spinButton.setTitle("Good Luck!!!")
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        isSpinning = true
        
    }
    func PrepareNextSpin(){
        
        //todo
        
        let variation : Int = maxSpinCount - minSpinCount
        let rndNum1 = Int( arc4random_uniform( UInt32(variation) ) )
        numberOfTimesToSpinColumnLeft = minSpinCount  + rndNum1
        if((numberOfTimesToSpinColumnLeft % 20) % 2  == 1){
            
            numberOfTimesToSpinColumnLeft = numberOfTimesToSpinColumnLeft + 1
            
        }
        
        let rndNum2 = Int( arc4random_uniform( UInt32(variation) ) )
        numberOfTimesToSpinColumnMiddle = minSpinCount  + rndNum2
        if((numberOfTimesToSpinColumnMiddle % 20) % 2  == 1){
            
            numberOfTimesToSpinColumnMiddle = numberOfTimesToSpinColumnMiddle + 1
            
        }
        
        
        let rndNum3 = Int( arc4random_uniform( UInt32(variation) ) )
        numberOfTimesToSpinColumnRight = minSpinCount  + rndNum3
        if((numberOfTimesToSpinColumnRight % 20) % 2  == 1){
            
            numberOfTimesToSpinColumnRight = numberOfTimesToSpinColumnRight + 1
            
        }
        
        columnLeftCurrentSpinCount = 0
        columnMiddleCurrentSpinCount = 0
        columnRightCurrentSpinCount = 0
        
        
        
        
    }
    
    
    
    func update(){
        
        //todo
        if(isSpinning == false){
            
            return
        }
        
        selectedItemLeft = selectedItemLeft - 1
        selectedItemMiddle = selectedItemMiddle - 1
        selectedItemRight = selectedItemRight - 1
        
        if ( selectedItemLeft < 0){
            
            selectedItemLeft = 19
        }
        
        if ( selectedItemMiddle < 0){
            
            selectedItemMiddle = 19
        }
        
        if ( selectedItemRight < 0){
            
            selectedItemRight = 19
        }
        
        columnLeftCurrentSpinCount = columnLeftCurrentSpinCount + 1
        columnMiddleCurrentSpinCount = columnMiddleCurrentSpinCount + 1
        columnRightCurrentSpinCount = columnRightCurrentSpinCount + 1
        
        if(columnLeftCurrentSpinCount <= numberOfTimesToSpinColumnLeft){
            
            RotateSlotItemsToIndex(selectedItemLeft, columnIndex:0)
        }
        if(columnMiddleCurrentSpinCount <= numberOfTimesToSpinColumnMiddle){
            
            RotateSlotItemsToIndex(selectedItemMiddle, columnIndex:1)
        }
        if(columnRightCurrentSpinCount <= numberOfTimesToSpinColumnRight){
            
            RotateSlotItemsToIndex(selectedItemRight, columnIndex:2)
        }
        
        if(columnLeftCurrentSpinCount >= numberOfTimesToSpinColumnLeft &&
            columnMiddleCurrentSpinCount >= numberOfTimesToSpinColumnMiddle &&
            columnRightCurrentSpinCount >= numberOfTimesToSpinColumnRight){
                
                timer.invalidate()
                CalculateScore()
        }
    }
    
    func RotateSlotItemsToIndex(index:Int!, columnIndex:Int!)
    {
        var image1 : WKInterfaceImage!
        var image2 : WKInterfaceImage!
        var image3 : WKInterfaceImage!
        var image4 : WKInterfaceImage!
        
        if(columnIndex == 0)
        {
            // left column
            image1 = slotLeft1
            image2 = slotLeft2
            image3 = slotLeft3
            image4 = slotLeft4
        }
        else if (columnIndex == 1)
        {
            // middle column
            image1 = slotMiddle1
            image2 = slotMiddle2
            image3 = slotMiddle3
            image4 = slotMiddle4
        }
        else if(columnIndex == 2)
        {
            // right column
            image1 = slotRight1
            image2 = slotRight2
            image3 = slotRight3
            image4 = slotRight4
        }
        
        var IndexRow1 = index - 2
        if(IndexRow1 == -1)
        {
            IndexRow1 = 19
        }
        if(IndexRow1 == -2)
        {
            IndexRow1 = 18
        }
        let image1Name = namesOfItems[IndexRow1] + ".png"
        image1.setImageNamed(image1Name)
        
        
        
        var IndexRow2 = index - 1
        if(IndexRow2 == -1)
        {
            IndexRow2 = 19
        }
        let image2Name = namesOfItems[IndexRow2] + ".png"
        image2.setImageNamed(image2Name)
        
        let image3Name = namesOfItems[index] + ".png"
        image3.setImageNamed(image3Name)
        
        var IndexRow4 = index + 1
        if(IndexRow4 > 19)
        {
            IndexRow4 = 0
        }
        let image4Name = namesOfItems[IndexRow4] + ".png"
        image4.setImageNamed(image4Name)
        
        
    }
    
    func CalculateScore()
    {
        // how many points? collection for 3 in a row, 2 in a row
        // what feedback to say? 3 7s, 3 bonuses, 3 Jacks, 2 Queens
        
        if(selectedItemLeft == selectedItemMiddle && selectedItemMiddle == selectedItemRight)
        {
            // we have a row
            let points : Int! = Int((valuesOfItemsX3[selectedItemLeft]))
            let winText : String! = winTextForItemsX3[selectedItemLeft]
            IncreaseScoreBy(points)
            spinButton.setTitle(String(format: "%@ +%d", winText, points))
            spinButton.setBackgroundColor(UIColor.whiteColor())
            
            StartBlinkingAllSlotsInMiddleRow()
        }
        else if (selectedItemLeft == selectedItemMiddle || selectedItemLeft == selectedItemRight || selectedItemMiddle == selectedItemRight)
        {
            let points : Int! = Int((valuesOfItemsX2[selectedItemLeft]))
            let winText : String! = winTextForItemsX2[selectedItemLeft]
            IncreaseScoreBy(points)
            spinButton.setTitle(String(format: "%@ +%d", winText, points))
            spinButton.setBackgroundColor(UIColor.whiteColor())
            
            StartBlinkingAllSlotsInMiddleRow()
        }
        
        // DEBUG!! Remove this for live version
        let points : Int! = Int((valuesOfItemsX3[selectedItemLeft]))
        let winText : String! = winTextForItemsX3[selectedItemLeft]
        IncreaseScoreBy(points)
        spinButton.setTitle(String(format: "%@ +%d", winText, points))
        spinButton.setBackgroundColor(UIColor.whiteColor())
        
        StartBlinkingAllSlotsInMiddleRow()
        
        
        
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("GetReadyForNextSpin"), userInfo: nil, repeats: false)
        
    }
    
    func IncreaseScoreBy(points :Int!){
        
        totalScore = totalScore + points
        scoreLabel.setText(String (format: "%d", totalScore))
        
    }
    
    func GetReadyForNextSpin(){
        
        isSpinning = false
        spinButton.setTitle("SPIN")
        spinButton.setBackgroundColor(UIColor.clearColor())
    }
    func StartBlinkingAllSlotsInMiddleRow()
    {
        blinkDuration = 1.8
        timerWin = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("Blink"), userInfo: nil, repeats: true)
    }
    
    func Blink()
    {
        // todo
        blinkDuration = blinkDuration - 0.2
        if(blinkDuration <= 0)
        {
            timerWin.invalidate()
            let imageNameUp : String! = namesOfItems[selectedItemLeft-1] + ".png"
            let imageNameDown : String! = namesOfItems[selectedItemLeft] + ".png"
            slotLeft2.setImageNamed(imageNameUp)
            slotLeft3.setImageNamed(imageNameDown)
            slotMiddle2.setImageNamed(imageNameUp)
            slotMiddle3.setImageNamed(imageNameDown)
            slotRight2.setImageNamed(imageNameUp)
            slotRight3.setImageNamed(imageNameDown)
        }
        else
        {
            blinkISON = !blinkISON
            if(blinkISON == true)
            {
                let imageName : String! = "slot-empty.png"
                slotLeft2.setImageNamed(imageName)
                slotLeft3.setImageNamed(imageName)
                slotMiddle2.setImageNamed(imageName)
                slotMiddle3.setImageNamed(imageName)
                slotRight2.setImageNamed(imageName)
                slotRight3.setImageNamed(imageName)
            }
            else
            {
                let imageNameUp : String! = namesOfItems[selectedItemLeft-1] + ".png"
                let imageNameDown : String! = namesOfItems[selectedItemLeft] + ".png"
                slotLeft2.setImageNamed(imageNameUp)
                slotLeft3.setImageNamed(imageNameDown)
                slotMiddle2.setImageNamed(imageNameUp)
                slotMiddle3.setImageNamed(imageNameDown)
                slotRight2.setImageNamed(imageNameUp)
                slotRight3.setImageNamed(imageNameDown)
            }
        }
    }

}
