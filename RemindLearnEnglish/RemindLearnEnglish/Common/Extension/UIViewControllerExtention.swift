//
//  UIViewControllerExtention.swift
//  RemindLearnEnglish
//
//  Created by HaiPD1 on 10/24/22.
//

import UIKit

extension UIViewController {
    
    func applyExclusiveTouchAll() {
        self.applyAllViews (execute: {
            $0.isExclusiveTouch = true
        })
    }
    
    private func applyAllViews(execute: (UIView) -> ()) {
        execute(self.view)
        self.applySubviewsRecursively(view: self.view, execute: execute)
    }
    
    private func applySubviewsRecursively(view: UIView, execute: (UIView) -> ()) {
        let subviews = view.subviews as [UIView]
        _ = subviews.map { (view: UIView) -> () in
            execute(view)
            self.applySubviewsRecursively(view: view, execute: execute)
        }
    }
    var safeArea: UIEdgeInsets {
        guard #available(iOS 11.0, *) else {
            // ノッチ付きの端末(iPhoneX等)はここを通らない(iOS11未満のノッチ端末が存在しない)からステータスバーの高さは20px固定でOK
            let top: CGFloat = UIApplication.shared.isStatusBarHidden ? 0 : 20
            return UIEdgeInsets(top: top, left: 0, bottom: 0, right: 0)
        }
        return self.view.safeAreaInsets
    }
    
    static let preventPageSheetPresentation: Void = {
        if #available(iOS 13, *) {
            _swizzling(forClass: UIViewController.self,
                       originalSelector: #selector(present(_: animated: completion:)),
                       swizzledSelector: #selector(_swizzledPresent(_: animated: completion:)))
        }
    }()

    @available(iOS 13.0, *)
    @objc private func _swizzledPresent(_ viewControllerToPresent: UIViewController,
                                        animated flag: Bool,
                                        completion: (() -> Void)? = nil) {
        if viewControllerToPresent.modalPresentationStyle == .pageSheet
                   || viewControllerToPresent.modalPresentationStyle == .automatic {
            viewControllerToPresent.modalPresentationStyle = .fullScreen
        }
        _swizzledPresent(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    func openURL(url:URL, completionHandler: @escaping ((Bool)->Void) = { success in }) {
        let app:UIApplication = UIApplication.shared
        if #available(iOS 10, *) {
            app.open(url, options: [:], completionHandler: completionHandler)
        } else {
            completionHandler(app.openURL(url))
        }
    }
}

private func _swizzling(forClass: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
    if let originalMethod = class_getInstanceMethod(forClass, originalSelector),
       let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector) {
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}
