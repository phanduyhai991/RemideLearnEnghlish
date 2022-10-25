//
//  MovieViewController.swift
//  RemindLearnEnglish
//
//  Created by HaiPD1 on 10/24/22.
//

import UIKit

class MovieViewController: UIViewController {

    static func navigationController() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Movie", bundle: nil)
        let nvc:UINavigationController = storyboard.instantiateViewController(withIdentifier: "MovieNaviController") as! UINavigationController
        return nvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Localizable.movie.localized()
        // Do any additional setup after loading the view.
    }
}
