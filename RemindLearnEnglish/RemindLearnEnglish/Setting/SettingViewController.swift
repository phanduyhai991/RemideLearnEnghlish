//
//  SettingViewController.swift
//  RemindLearnEnglish
//
//  Created by HaiPD1 on 10/24/22.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {

    static func navigationController() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Setting", bundle: nil)
        let nvc:UINavigationController = storyboard.instantiateViewController(withIdentifier: "SettingNaviController") as! UINavigationController
        return nvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Localizable.setting.localized()
        // Do any additional setup after loading the view.
    }
}
