//
//  GameManager.swift
//  Doge - TienSon
//
//  Created by HoangHai on 6/22/16.
//  Copyright © 2016 Tien Son. All rights reserved.
//

import UIKit

class GameManager: NSObject {
    var dogeViews : NSMutableArray?
    var hookView : HookView?
    override init() {
        self.dogeViews = NSMutableArray()
        self.hookView = HookView(frame: CGRectMake(0, -490, 20, 490))
    }

    func addDoge(viewcontroller: UIViewController, width: Int) {
        let dogeView = DogeView(frame: CGRectMake(0, 0, 40, 30))
        dogeView.generateDoge(width)
        self.dogeViews?.addObject(dogeView)
        viewcontroller.view.addSubview(dogeView)
    }

    func bite(dogeView: DogeView) {
        if (dogeView.status != dogeView.CAUGHT && self.hookView?.status != self.hookView?.DRAWUP && self.hookView?.status != self.hookView?.CAUGHTD) {
            dogeView.caught()
            dogeView.center = CGPointMake(self.hookView!.center.x, self.hookView!.frame.origin.y + self.hookView!.frame.height + dogeView.frame.width/2)
            self.hookView?.status = self.hookView?.CAUGHTD
        }
    }

    func updateMove() {
        self.hookView?.updateMove()
        for dogeView in self.dogeViews! {
            dogeView.updateMove()
        if (CGRectContainsPoint(dogeView.frame, CGPointMake(self.hookView!.center.x, self.hookView!.frame.origin.y + self.hookView!.frame.height + dogeView.frame.width/2))) {
                bite(dogeView as! DogeView)
            }
        }
    }

    func dropHookAtX(x: Int) {
        self.hookView?.dropDownAtX(x)
    }
}
