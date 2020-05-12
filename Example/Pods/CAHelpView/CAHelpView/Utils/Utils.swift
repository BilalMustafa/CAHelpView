//
//  Utils.swift
//  CAHelpView
//
//  Created by Bilal Mustafa on 5/12/20.
//

import Foundation
import UIKit
class Utils: NSObject {
    class func getEstimatedHeight(string: String, font: UIFont, padding: CGFloat, margin: CGFloat) -> CGFloat {
        let size = CGSize(width: UIScreen.main.bounds.width - padding, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedFrame = NSString(string: string).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: font], context: nil)
        return estimatedFrame.height + margin
    }
    
    class func getAttributedString(text: String, lineSpacing: CGFloat = 10.0, font: UIFont = UIFont.systemFont(ofSize: 17)) -> NSAttributedString {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = lineSpacing
        let attributes = [NSAttributedString.Key.paragraphStyle : style, NSAttributedString.Key.font: font]
        return NSAttributedString(string: text, attributes: attributes)
    }
}
