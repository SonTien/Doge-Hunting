//
//  ViewController.swift
//  Doge - TienSon
//
//  Created by HoangHai on 6/22/16.
//  Copyright © 2016 Tien Son. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gameManager : GameManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gameManager = GameManager()
        self.view.addSubview((self.gameManager?.hookView)!)
        self.gameManager?.addDoge(self, width: Int(self.view.bounds.width))
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("tapHandle:")))
        NSTimer.scheduledTimerWithTimeInterval(0.03, target: self.gameManager!, selector: Selector("updateMove"), userInfo: nil, repeats: true)
    }

    func tapHandle(sender: UITapGestureRecognizer) {
        let tapPoint = sender.locationInView(self.view)
        self.gameManager?.dropHookAtX(Int(tapPoint.x))
    }
    
    @IBAction func Reset(sender: AnyObject) {
        self.gameManager?.dogeViews?.removeAllObjects()
        for object in self.view.subviews {
            if (object.isKindOfClass(DogeView)) {
                object.removeFromSuperview()
            }
        }
        self.gameManager?.addDoge(self, width: Int(self.view.bounds.width))
    }

    @IBAction func addDoge(sender: AnyObject) {
        self.gameManager?.addDoge(self, width: Int(self.view.bounds.width))
    }
}

