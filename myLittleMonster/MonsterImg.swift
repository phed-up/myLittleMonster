//
//  MonsterImg.swift
//  myLittleMonster
//
//  Created by skwong on 6/2/16.
//  Copyright © 2016 fedup. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView

{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        playIdleAnimation()
    }
    

    func playIdleAnimation()
    {
        
        self.image = UIImage(named: "idle1.png")
        
        var imgArray = [UIImage](arrayLiteral: UIImage(named: "idle1.png")!, UIImage(named: "idle2.png")!, UIImage(named: "idle3.png")!, UIImage(named: "idle4.png")!)
    
    
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func playDeathAnimation()
    {
        
        self.image = UIImage(named: "dead5.png")
        
        var imgArray = [UIImage](arrayLiteral: UIImage(named: "dead1.png")!, UIImage(named: "dead2.png")!, UIImage(named: "dead3.png")!, UIImage(named: "dead4.png")!, UIImage(named: "dead5.png")!)
        
        self.animationImages = imgArray
        self.animationDuration = 1.0
        self.animationRepeatCount = 1
        self.startAnimating()
        
    }
    
}


