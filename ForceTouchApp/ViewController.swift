//
//  ViewController.swift
//  ForceTouchApp
//
//  Created by Nobuhiro Takahashi on 2018/06/23.
//  Copyright © 2018年 Nobuhiro Takahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
            if touch.force >= touch.maximumPossibleForce {
                weightLabel.text = "385g+"
            } else {
                // https://medium.com/swlh/turning-the-iphone-6s-into-a-digital-scale-f2197dc2b6e7
                // 385 ~
                let force = touch.force / touch.maximumPossibleForce
                let grams = Int(force * 385)
                weightLabel.text = "\(grams)g"
                
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        weightLabel.text = "0g"
    }

}

