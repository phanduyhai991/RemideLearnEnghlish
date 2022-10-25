//
//  UserDefaultConfig.swift
//  RemindLearnEnglish
//
//  Created by HaiPD1 on 10/24/22.
//

import Foundation

struct UserDefaultsKey {
    //1: En, 2: Vi
    static let kLanguage = "kLanguage"
}

@objcMembers class UserDefaultConfig: NSObject {
    
    static func isSavedString(key:String) -> Bool {
        let ud = UserDefaults.standard
        
        guard let value = ud.string(forKey: key) else {
            return false
        }
        
        if value.count < 0 {
            return false
        }
        
        return true
    }
    
    static func saveString(key: String, value: String) {
        let ud = UserDefaults.standard
        
        ud.set(value, forKey: key)
        if ud.synchronize() == false {
            print("userdefault save error")
        }
    }
    
    static func loadString(key: String) -> String {
        let ud = UserDefaults.standard
        
        guard let value = ud.string(forKey: key) else {
            return ""
        }
        
        return value
    }
    
    static func removeString(key: String) {
        let ud = UserDefaults.standard
        
        ud.removeObject(forKey: key)
    }
    
    static func resetUserData() {
        
        // remove UserDefaults
        let ud = UserDefaults.standard
        let dict = ud.dictionaryRepresentation()
        dict.forEach({ (d:(key: String, value: Any)) in
            ud.removeObject(forKey: d.key)
        })
    }
    
    static func isFlagOn(key: String) -> Bool {
        let value = self.loadString(key: key)
        if value == "1" {
            return true
        }
        return false
    }
    
    static func setFlag(key: String, dir: Bool) {
        if dir {
            self.saveString(key: key, value: "1")
        } else {
            self.removeString(key: key)
        }
    }
}
