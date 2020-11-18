//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    // time point: just before the view is displayed
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // remember to call super when overriding!
        navigationController?.isNavigationBarHidden = true
    }
    
    // time point: just before the current view disappears :D
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = ""
        let titleText = K.appName

        var index = 1.0
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * index, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            index += 1.0
        }
        
        // blink blink!
        Timer.scheduledTimer(withTimeInterval: 1.7, repeats: false) { (timer) in
            self.titleLabel.text = ""
        }
        Timer.scheduledTimer(withTimeInterval: 1.9, repeats: false) { (timer) in
            self.titleLabel.text = titleText
        }
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
            self.titleLabel.text = ""
        }
        Timer.scheduledTimer(withTimeInterval: 2.2, repeats: false) { (timer) in
            self.titleLabel.text = titleText
        }
    }
    

}
