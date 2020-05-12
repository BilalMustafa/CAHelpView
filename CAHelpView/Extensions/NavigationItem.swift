//
//  NavigationItem.swift
//  CAHelpView
//
//  Created by Bilal Mustafa on 5/12/20.
//  Copyright © 2020 Content Arcade. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationItem {
    func addLeftBarButtonItemWithImage(_ image: UIImage, target: UIViewController, action: Selector) {
        let leftBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        leftBtn.setImage(image, for: .normal)
        leftBtn.addTarget(target, action: action, for: .touchUpInside)
        let leftBarButton = UIBarButtonItem()
        leftBarButton.customView = leftBtn
        self.leftBarButtonItem = leftBarButton
    }
}
