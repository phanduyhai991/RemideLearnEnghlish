//
//  SplashViewController.swift
//  RemindLearnEnglish
//
//  Created by HaiPD1 on 10/24/22.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var sloganLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sloganLabel.text = Localizable.slogan.localized()
        // Do any additional setup after loading the view.
    }
    
     
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            let tabbarVC = MainTabBarController.instanceVC()
            self.present(tabbarVC, animated: true, completion: nil)
        }
    }
}
