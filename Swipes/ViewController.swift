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
    private var gestureStartPoint: CGPoint!
    
    private static let minimumGestureLength = Float(25.0)
    private static let maximumVariance = Float(5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let vertical = UISwipeGestureRecognizer(target: self, action: #selector(reportVerticalSwipe))
        vertical.direction = [.up, .down]
        view.addGestureRecognizer(vertical)
        
        let horizontal = UISwipeGestureRecognizer(target: self, action: #selector(reportHorizontalSwipe))
        horizontal.direction = [.left, .right]
        view.addGestureRecognizer(horizontal)
    }

    @objc func reportHorizontalSwipe(_ recognizer:UIGestureRecognizer) {
        label.text = "Horizontal swipe detected"
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)) {
            self.label.text = ""
        }
    }
    
    @objc func reportVerticalSwipe(_ recognizer:UIGestureRecognizer) {
        label.text = "Vertical swipe detected"
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)) {
            self.label.text = ""
        }
    }

}

