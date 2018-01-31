//
//  About.swift
//  Prices
//
//  Created by Sid Mogili on 1/8/18.
//  Copyright © 2018 Subramanyam Mogili. All rights reserved.
//

import UIKit

class About: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Cancel(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
