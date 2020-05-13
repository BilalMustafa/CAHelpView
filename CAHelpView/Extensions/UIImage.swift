//
//  UIImage.swift
//  CAHelpView
//
//  Created by Bilal Mustafa on 5/13/20.
//  Copyright © 2020 Content Arcade. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    convenience init?(namedInCAHelpView: String) {
        self.init(named: namedInCAHelpView, in: Bundle(for: CAHelpViewController.self),
                  compatibleWith: nil)
    }
}
