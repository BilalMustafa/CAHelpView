//
//  CAHelpViewController.swift
//  CAHelpView
//
//  Created by Bilal Mustafa on 5/8/20.
//  Copyright © 2020 Content Arcade. All rights reserved.
//

import UIKit

public class CAHelpViewController: UIViewController {
    
    
   
    
    //MARK:- Instance Variable
    
   private var help: Help?
    
    
    private var caHelpViewDataSource: CAHelpViewDataSource? {
        return collectionView?.dataSource as? CAHelpViewDataSource
    }
    
    // MARK: Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
        
    override public func viewDidLoad() {
        super.viewDidLoad()       
        collectionView.delegate = self
        collectionView.dataSource = caHelpViewDataSource
        caHelpViewDataSource?.help = self.help
    }
    
    
    //Mark:- Helper Functions
    private func setCAHelpData(json: [String: Any]) {
        do {
            help = try Help(json: json)
        } catch {
            debugPrint("Unable to decode Json.")
        }
    }
            
    class public func CAHelpViewController(json: [String: Any]) -> UIViewController {
        let bundle = Bundle(for: self)
        let vc = UIStoryboard(name: Identifiers.Storyboard, bundle: bundle).instantiateViewController(withIdentifier: Identifiers.ViewControllerId) as! CAHelpViewController
        vc.setCAHelpData(json: json)
        let nav = UINavigationController(rootViewController: vc)
        return nav
        
    }
}

extension CAHelpViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView,
                               didSelectItemAt indexPath: IndexPath) {
        let vc = CAHelpDetailViewController.CAHelpDetailViewController()
        let question = help?.sections[indexPath.section].questions[indexPath.row].questionKey
        let details = help?.sections[indexPath.section].questions[indexPath.row].questionDictionary[question ?? ""]
        vc.configureDetailViewController(navTitle: question ?? "", details: details ?? [])
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.HelpCell, for: indexPath) as? HelpCell {
            let text = help?.sections[indexPath.section].questions[indexPath.row].questionKey
            var estimatedHeight = Utils.getEstimatedHeight(string: text ?? "", font: cell.helpLabel.font, padding: HelpCellProperties.CellPadding, margin: HelpCellProperties.HeightMargin)
            if estimatedHeight < HelpCellProperties.CellMinimumHeight {
                estimatedHeight = HelpCellProperties.CellMinimumHeight
            }
            return CGSize(width: collectionView.bounds.size.width, height: estimatedHeight)
        }
        return CGSize.zero
    }
}
