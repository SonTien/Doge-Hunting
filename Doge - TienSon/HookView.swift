//
//  HookView.swift
//  Doge - TienSon
//
//  Created by HoangHai on 6/22/16.
//  Copyright © 2016 Tien Son. All rights reserved.
//

import UIKit

class HookView: UIImageView {
    let PREPARE = 0
    let DROP = 1
    let DRAWUP = 2
    let CAUGHTD = 3
    var status : Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named: "pizzaHook.png")
        self.status = PREPARE
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateMove() {
        if (self.status == DROP) {
            self.center = CGPointMake(self.center.x, self.center.y + 10)
            if (self.frame.origin.y + self.frame.height > 480) {
                self.status = DRAWUP
            }
        }
        else if (self.status == DRAWUP) {
            self.center = CGPointMake(self.center.x, self.center.y - 50)
            if (self.frame.origin.y + self.frame.height < 0) {
                self.status = PREPARE
            }
        }
        else if (self.status == CAUGHTD) {
            self.center = CGPointMake(self.center.x, self.center.y - 2.5)
            if (self.frame.origin.y + self.frame.height < 0) {
                self.status = PREPARE
            }
        }
    }

    func dropDownAtX(x: Int) {
        if (self.status == PREPARE) {
            self.center = CGPointMake(CGFloat(x), self.center.y)
            self.status = DROP
        }
    }


}
