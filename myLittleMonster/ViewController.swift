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
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        foodImg.droppedTarget = monsterImg
        heartImg.droppedTarget = monsterImg
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDroppedOnCharacter:", name: "onTargetDropped", object: nil)
  
    }


    func itemDroppedOnCharacter(notif: AnyObject)
    {
        print("Item dropped on character")
    }


}

