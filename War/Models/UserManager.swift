//
//  UserManager.swift
//  War
//
//  Created by Student17 on 03/06/2025.
//
import Foundation

class UserManager {
    
    static let instance = UserManager()
    private let USER_DEFAULTS_USER_NAME_KEY = "userName"
    
    private init() {}
    
    func getUserName() -> String? {
        return UserDefaults.standard.string(forKey: USER_DEFAULTS_USER_NAME_KEY)
    }
    
    func setUserName(userName: String) {
        UserDefaults.standard.set(userName, forKey: USER_DEFAULTS_USER_NAME_KEY)
    }
}
