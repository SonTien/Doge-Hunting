//
//  DogeView.swift
//  Doge - TienSon
//
//  Created by HoangHai on 6/22/16.
//  Copyright © 2016 Tien Son. All rights reserved.
//

import UIKit

class DogeView: UIImageView {
    var status : Int?
    var speed : Int?
    var vy = 0
    var widthFrame : Int?
    var heightFrame : Int?
    var widthDoge : Int?
    var heightDoge : Int?
    let MOVING : Int = 0
    let CAUGHT : Int = 1
    
    override init(frame: CGRect) {
        self.widthDoge = Int(frame.width)
        self.heightDoge = Int(frame.height)
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func generateDoge(width:Int) {
        self.widthFrame = width;
        self.vy = Int(arc4random_uniform(3)) - 1
        let y: Float = Float(arc4random_uniform(240) + 80)
        self.status = MOVING
        self.speed = Int(arc4random_uniform(5) + 2)
        
        if (Int(self.center.x) <= Int(self.widthDoge!/2)) {
            self.transform = CGAffineTransformIdentity
            self.image = UIImage(named: "dogeMove.png")
            self.frame = CGRectMake(-CGFloat(self.widthDoge!), CGFloat(y), CGFloat(self.widthDoge!), CGFloat(self.heightDoge!))
        }
    
        else {
            self.transform = CGAffineTransformIdentity
            self.image = UIImage(CGImage: UIImage(named: "dogeMove.png")!.CGImage!, scale: 1.0, orientation: UIImageOrientation.UpMirrored)
            self.frame = CGRectMake(CGFloat(self.widthFrame! + self.widthDoge!/(2)), CGFloat(y), CGFloat(self.widthDoge!), CGFloat(self.heightDoge!))
            self.speed = -Int(self.speed!)
        }
}

    func updateMove() {
        if (self.status == MOVING) {
            self.center = CGPointMake(self.center.x + CGFloat(self.speed!), self.center.y - CGFloat(self.vy))
            if (Int(self.center.y) < -Int(self.heightDoge!) || Int(self.center.y) > self.heightDoge! + 240) {
                self.vy = -self.vy
            }
            if ((Int(self.center.x) > self.widthFrame! && self.speed! > 0) || (Int(self.center.x) < -self.widthDoge! && self.speed! < 0)){
                generateDoge(self.widthFrame!)
            }
        }
        else if (self.status == CAUGHT) {
            self.center = CGPointMake(self.center.x, self.center.y - 3)
        }
        
}
 
    func caught () {
        if (self.status == MOVING) {
            self.status = CAUGHT
            self.image = UIImage(CGImage: UIImage(named: "dogeCaught.png")!.CGImage!, scale: 1.0, orientation: UIImageOrientation.UpMirrored)
            if (self.speed > 0) {
                self.transform = CGAffineTransformMakeRotation(CGFloat(-M_2_PI))
            }
            else {
                self.transform = CGAffineTransformMakeRotation(CGFloat(M_2_PI))
            }
        }
}
}
