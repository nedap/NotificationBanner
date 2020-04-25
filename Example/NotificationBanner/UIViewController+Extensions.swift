//
//  UIViewController+Extensions.swift
//  NotificationBanner_Example
//
//  Created by Yulia Mykhailova on 20/04/2020.
//  Copyright © 2020 Yulia Mykhailova. All rights reserved.
//

import UIKit

extension UIViewController {

    open var isModal: Bool {

        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController

        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }

}
