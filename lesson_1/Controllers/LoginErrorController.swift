//
//  LoginErrorController.swift
//  lesson_1
//
//  Created by Stanislav on 23.03.2024.
//

import UIKit

class LoginErrorController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Incorrect login or password"
        let action = UIAlertAction(title: "Ok", style: .cancel)
        self.addAction(action)
    }
    
}
