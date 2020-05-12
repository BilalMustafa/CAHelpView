//
//  CAHelpDetailViewController.swift
//  CAHelpView
//
//  Created by Bilal Mustafa on 5/12/20.
//  Copyright © 2020 Content Arcade. All rights reserved.
//

import UIKit

class CAHelpDetailViewController: UIViewController {
    
    
    //MARK:- Properties
    
    private var navTitle: String = "Help Detail"
    private var helpDetail: String = ""
    
    //MARK:- Outlets
    
    @IBOutlet weak var detailTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.navTitle
        self.detailTextView.attributedText = Utils.getAttributedString(text: self.helpDetail, lineSpacing: 15.0)
    }
    
    class public func CAHelpDetailViewController() -> CAHelpDetailViewController {
        let bundle = Bundle(for: self)
        let vc = UIStoryboard(name: Identifiers.Storyboard, bundle: bundle).instantiateViewController(withIdentifier: Identifiers.DetailViewControllerId) as! CAHelpDetailViewController
        return vc
    }
    
    
    //MARK:- Helper Functions
    
    func configureDetailViewController(navTitle: String, details: [String]) {
        guard !navTitle.isEmpty && details.count > 0 else {return}
        self.navTitle = navTitle
        self.helpDetail = self.setDetailString(strings: details)
    }
    
    private func setDetailString(strings: [String]) -> String {
        var detailString = ""
        for (index, string) in strings.enumerated() {
            detailString += "\(index + 1) - \(string) \n"
        }
        return detailString
    }
    
    
  
}
