//
//  StringExtentsion.swift
//  RemindLearnEnglish
//
//  Created by HaiPD1 on 10/24/22.
//

import UIKit

extension String {
    func localized() ->String {
        let language = UserDefaultConfig.loadString(key: UserDefaultsKey.kLanguage)

        let path = Bundle.main.path(forResource: language, ofType: "lproj")
        let bundle = Bundle(path: path!)

        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
