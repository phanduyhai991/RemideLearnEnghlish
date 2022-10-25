//
//  MainTabBarController.swift
//  RemindLearnEnglish
//
//  Created by HaiPD1 on 10/24/22.
//

import UIKit

class MainTabBarController: UITabBarController {

    class func instanceVC() -> MainTabBarController {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UserDefaultConfig.saveString(key: UserDefaultsKey.kLanguage, value: "en")
        setupViewControllers()
    }

    func setupViewControllers () {
        
        self.tabBar.tintColor = AppColor.tabbarTextSelectedColor
        if #available(iOS 13, *) {
            let appearance = UITabBarAppearance()
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: AppColor.tabbarTextSelectedColor]
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: AppColor.tabbarTextColor]
            tabBar.standardAppearance = appearance
            
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
            
        } else {
            let normalAttr:[NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: AppColor.tabbarTextColor]
            UITabBarItem.appearance().setTitleTextAttributes(normalAttr, for: .normal)
            let selectedAttr:[NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: AppColor.tabbarTextSelectedColor]
            UITabBarItem.appearance().setTitleTextAttributes(selectedAttr, for: .selected)
        }
        
        // TOP
        let homeViewController = HomeViewController.navigationController()
        var homeImageOn = UIImage(named: AppImage.iconHomeOn)
        var homeImageOff = UIImage(named: AppImage.iconHomeOff)
        homeImageOn = homeImageOn?.resizeImageAutoScale(size: CGSize(width: 20, height: 20))
        homeImageOff = homeImageOff?.resizeImageAutoScale(size: CGSize(width: 20, height: 20))
        homeViewController.tabBarItem = UITabBarItem(title: Localizable.home.localized(), image: homeImageOff?.withRenderingMode(.alwaysOriginal), selectedImage: homeImageOn?.withRenderingMode(.alwaysOriginal))
        homeViewController.tabBarItem.tag = 0
        
        let movieViewController = MovieViewController.navigationController()
        var movieImageOn = UIImage(named: AppImage.iconMovieOn)
        var movieImageOff = UIImage(named: AppImage.iconMovieOff)
        movieImageOn = movieImageOn?.resizeImageAutoScale(size: CGSize(width: 20, height: 20))
        movieImageOff = movieImageOff?.resizeImageAutoScale(size: CGSize(width: 20, height: 20))
        movieViewController.tabBarItem = UITabBarItem(title: Localizable.movie.localized(), image: movieImageOff?.withRenderingMode(.alwaysOriginal), selectedImage: movieImageOn?.withRenderingMode(.alwaysOriginal))
        movieViewController.tabBarItem.tag = 1
        
        // Chat
        let chatViewController = ChatViewController.navigationController()
        var chatImageOn = UIImage(named: AppImage.iconChatOn)
        var chatImageOff = UIImage(named: AppImage.iconChatOff)
        chatImageOn = chatImageOn?.resizeImageAutoScale(size: CGSize(width: 20, height: 20))
        chatImageOff = chatImageOff?.resizeImageAutoScale(size: CGSize(width: 20, height: 20))
        chatViewController.tabBarItem = UITabBarItem(title: Localizable.chat.localized(), image: chatImageOff?.withRenderingMode(.alwaysOriginal), selectedImage: chatImageOn?.withRenderingMode(.alwaysOriginal))
        chatViewController.tabBarItem.tag = 2
        
        // Setting
        let settingViewController = SettingViewController.navigationController()
        var settingImageOn = UIImage(named: AppImage.iconSettingOn)
        var settingImageOff = UIImage(named: AppImage.iconSettingOff)
        settingImageOn = settingImageOn?.resizeImageAutoScale(size: CGSize(width: 20, height: 20))
        settingImageOff = settingImageOff?.resizeImageAutoScale(size: CGSize(width: 20, height: 20))
        settingViewController.tabBarItem = UITabBarItem(title: Localizable.setting.localized(), image: settingImageOff?.withRenderingMode(.alwaysOriginal), selectedImage: settingImageOn?.withRenderingMode(.alwaysOriginal))
        settingViewController.tabBarItem.tag = 3
        
//        // 店舗ATM
//        let atmViewController = UIViewController()
//        atmViewController.tabBarItem = UITabBarItem(title: "店舗ATM", image: UIImage(named:"f000_ic_store")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named:"f000_ic_store_selected")?.withRenderingMode(.alwaysOriginal))
//        atmViewController.tabBarItem.tag = 2
//
//        // 公式ホームページ
//        let officialPageViewController = UIViewController()
//        officialPageViewController.tabBarItem = UITabBarItem(title: "ホームページ", image: UIImage(named:"f000_ic_web")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named:"f000_ic_web_selected")?.withRenderingMode(.alwaysOriginal))
//        officialPageViewController.tabBarItem.tag = 3
//
//        // お知らせ
//        let newsViewController = F000NewsViewController.viewController()
//        newsViewController.tabBarItem = UITabBarItem(title: "お知らせ", image: UIImage(named:"f000_ic_info")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named:"f000_ic_info_selected")?.withRenderingMode(.alwaysOriginal))
//        newsViewController.tabBarItem.tag = 4
        
 
        let viewControllers = [homeViewController,movieViewController, chatViewController, settingViewController]
        self.setViewControllers(viewControllers, animated: true)
        
        // 初期表示はHOME
        self.selectedIndex = 0

    }

}
