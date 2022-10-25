//
//  HomeViewController.swift
//  RemindLearnEnglish
//
//  Created by HaiPD1 on 10/24/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    var listContent: [HomeContentModel] = []
    
    static func navigationController() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let nvc:UINavigationController = storyboard.instantiateViewController(withIdentifier: "HomeNaviController") as! UINavigationController
        return nvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Localizable.home.localized()
        registerContent()
        registerTabeleView()
       
        // Do any additional setup after loading the view.
    }
    
    // MARK: Register Table -
    func registerTabeleView() {
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
        self.homeTableView.bounces = false
        let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        self.homeTableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        homeTableView.reloadData()
    }
    
    // MARK: Register Content -
    func registerContent() {
        //numberContent = [Localizable.vocabulary.localized(), Localizable.listening.localized(),Localizable.speaking.localized(),Localizable.grammar.localized()]
        let homeContent1 =  HomeContentModel()
        homeContent1.titleContent = Localizable.vocabulary.localized()
        //homeContent.imageContent =
        listContent.append(homeContent1)
        let homeContent2 =  HomeContentModel()
        homeContent2.titleContent = Localizable.listening.localized()
        //homeContent.imageContent =
        listContent.append(homeContent2)
        let homeContent3 =  HomeContentModel()
        homeContent3.titleContent = Localizable.speaking.localized()
        //homeContent.imageContent =
        listContent.append(homeContent3)
        let homeContent4 =  HomeContentModel()
        homeContent4.titleContent = Localizable.grammar.localized()
        //homeContent.imageContent =
        listContent.append(homeContent4)
    }
}

// MARK: UITableViewDelegate - UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        let cellData = self.listContent[indexPath.row]
        cell.setCell(data: cellData)
        cell.layoutMargins = UIEdgeInsets.zero
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
}


