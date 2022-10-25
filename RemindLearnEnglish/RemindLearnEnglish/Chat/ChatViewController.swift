//
//  ChatViewController.swift
//  RemindLearnEnglish
//
//  Created by HaiPD1 on 10/24/22.
//

import Foundation
import UIKit

class ChatViewController: UIViewController {

    static func navigationController() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Chat", bundle: nil)
        let nvc:UINavigationController = storyboard.instantiateViewController(withIdentifier: "ChatNaviController") as! UINavigationController
        return nvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Localizable.chat.localized()
        // Do any additional setup after loading the view.
    }
}
