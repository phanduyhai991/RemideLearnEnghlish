//
//  Const.swift
//  RemindLearnEnglish
//
//  Created by HaiPD1 on 10/24/22.
//

import Foundation
import UIKit

enum LanguageApp: String {
    case EngLish = "en"
    case VietNam = "vi"
}

struct Localizable {
    //tabbar
    static let home = "Home"
    static let setting = "Setting"
    static let movie = "Movie"
    static let chat = "Chat"
    static let slogan = "slogan"
    static let vocabulary = "Vocabulary";
    static let listening = "Listening";
    static let speaking = "Speaking";
    static let grammar = "Grammar";
}

struct AppImage {
    static let iconHomeOn = "icon_Home_On"
    static let iconHomeOff = "icon_Home_Off"
    static let iconSettingOn = "icon_setting_on"
    static let iconSettingOff = "icon_setting_off"
    static let iconMovieOn = "icon_movie_on"
    static let iconMovieOff = "icon_movie_off"
    static let iconChatOn = "icon_chat_on"
    static let iconChatOff = "icon_chat_off"
}

struct AppColor {
    
    // タイトルバー背景（ステータスバーの背景色）
    static let titleBarColor = UIColor.gray
    
    // ステータスバーの文字色
    static let statusbarTextColler: UIStatusBarStyle = .default
    
    // タイトルバーのタイトル文字色
    static let titleBarTextColor =  UIColor.rgbaColor(r: 0, g: 0, b: 0, a: 0.87)
    // Tabbarテキスト
    static let tabbarTextSelectedColor = UIColor.rgbaColorFromCode(code: "0x2FBBBA", alpha: 1.0)
    static let tabbarTextColor         = UIColor.rgbaColor(r: 0, g: 0, b: 0, a: 0.54)
}
