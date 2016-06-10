//
//  ViewController.swift
//  myLittleMonster
//
//  Created by skwong on 5/30/16.
//  Copyright © 2016 fedup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var monsterImg: MonsterImg!
    
    @IBOutlet weak var heartImg: DragImage!
    @IBOutlet weak var foodImg: DragImage!
    
    @IBOutlet weak var penalty1Img: UIImageView!
    
    @IBOutlet weak var penalty2Img: UIImageView!

    @IBOutlet weak var pentalty3Img: UIImageView!
    
    let DIM_ALPHA: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    let MAX_PENALTIES = 3
    
    var penalties = 0
    var timer: NSTimer!
    
    var monsterHappy = false
    
    var currentItem: UInt32 = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        penalty1Img.alpha = DIM_ALPHA
        penalty2Img.alpha = DIM_ALPHA
        pentalty3Img.alpha = DIM_ALPHA
        
        foodImg.droppedTarget = monsterImg
        heartImg.droppedTarget = monsterImg
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(itemDroppedOnCharacter), name: "onTargetDropped", object: nil)
        
        startTimer()
  
    }


    func itemDroppedOnCharacter(notif: AnyObject)
    {
       monsterHappy = true
        startTimer()
        
        foodImg.alpha = DIM_ALPHA
        foodImg.userInteractionEnabled = false
        heartImg.alpha = DIM_ALPHA
        heartImg.userInteractionEnabled = false
    }

    func startTimer()
    {
        
        if timer != nil
        {
            timer.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "changeGameState", userInfo: nil, repeats: true)
    }

    func changeGameState()
    {
        if !monsterHappy
        {
            penalties++
        
            if penalties == 1
            {
                penalty1Img.alpha = OPAQUE
                penalty2Img.alpha = DIM_ALPHA
                
            }
            else if penalties == 2
            {
                penalty2Img.alpha = OPAQUE
                pentalty3Img.alpha = DIM_ALPHA
            }
            else if penalties >= 3
            {
                pentalty3Img.alpha = OPAQUE
            }
            
            else
            {
                penalty1Img.alpha = DIM_ALPHA
                penalty2Img.alpha = DIM_ALPHA
                pentalty3Img.alpha = DIM_ALPHA
            }
            
            if penalties >= MAX_PENALTIES
            {
                gameOver()
            }

        }
        
        let rand = arc4random_uniform(2)
        
        if rand == 0
        {
            foodImg.alpha = DIM_ALPHA
            foodImg.userInteractionEnabled = false
            
            heartImg.alpha = OPAQUE
            heartImg.userInteractionEnabled = true
        }
        else
        {
            heartImg.alpha = DIM_ALPHA
            heartImg.userInteractionEnabled = false
            
            foodImg.alpha = OPAQUE
            foodImg.userInteractionEnabled = true
        }
        
        currentItem = rand
        monsterHappy = false
    }
    
    
   
    
    func gameOver()
    {
        timer.invalidate()
        monsterImg.playDeathAnimation()
    }
    

}

