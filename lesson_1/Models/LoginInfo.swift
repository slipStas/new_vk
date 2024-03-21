//
//  LoginInfo.swift
//  lesson_1
//
//  Created by Stanislav on 06.03.2024.
//

import Foundation

class LoginInfo {
    private let login = "qwe"
    private let password = "123"
    
    func check(login: String, and password: String) -> Bool {
        self.login == login && self.password == password
    }
}
