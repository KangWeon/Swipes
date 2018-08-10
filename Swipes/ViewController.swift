//
//  ViewController.swift
//  Swipes
//
//  Created by klarheit on 10/08/2018.
//  Copyright © 2018 klarheit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for touchCount in 0..<5 {
            let vertical = UISwipeGestureRecognizer(target: self, action: #selector(reportVerticalSwipe))
            vertical.direction = [.up, .down]
            vertical.numberOfTouchesRequired = touchCount
            view.addGestureRecognizer(vertical)

            let horizontal = UISwipeGestureRecognizer(target: self, action: #selector(reportHorizontalSwipe))
            horizontal.direction = [.left, .right]
            horizontal.numberOfTouchesRequired = touchCount
            view.addGestureRecognizer(horizontal)
        }
    }

    @objc func reportHorizontalSwipe(_ recognizer:UIGestureRecognizer) {
        let count = descriptionForTouchCount(recognizer.numberOfTouches)
        label.text = "\(count)-finger horizontal swipe detected"
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)) {
            self.label.text = ""
        }
    }
    
    @objc func reportVerticalSwipe(_ recognizer:UIGestureRecognizer) {
        let count = descriptionForTouchCount(recognizer.numberOfTouches)
        label.text = "\(count)-finger vertical swipe detected"
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)) {
            self.label.text = ""
        }
    }
    
    @objc func descriptionForTouchCount(_ touchCount:Int) -> String {
        switch touchCount {
        case 1:
            return "Single"
        case 2:
            return "Double"
        case 3:
            return "Triple"
        case 4:
            return "Quadruple"
        case 5:
            return "Quintuple"
        default:
            return "Default"
        }
        
    }

}

