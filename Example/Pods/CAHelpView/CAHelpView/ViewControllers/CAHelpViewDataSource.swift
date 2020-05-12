//
//  CAHelpViewDataSource.swift
//  CAHelpView
//
//  Created by Bilal Mustafa on 5/11/20.
//  Copyright © 2020 Content Arcade. All rights reserved.
//

import Foundation
import UIKit

class CAHelpViewDataSource: NSObject {
        
    // MARK:- Instance Variables
    
    var help: Help? {
        didSet {
            
        }
    }
    
    
    //MARK:- Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK:- Helper Functions
    private func helpCellAtIndexPath(indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Identifiers.HelpCell, for: indexPath) as? HelpCell else {
                return UICollectionViewCell()
        }
        
        //Configure the cell here
        cell.helpLabel.text = self.help?.sections[indexPath.section].questions[indexPath.row].questionKey
        return cell
    }
}

// MARK: UICollectionViewDataSource
extension CAHelpViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return help?.sections[section].questions.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return helpCellAtIndexPath(indexPath: indexPath)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return help?.sections.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        let sectionView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Identifiers.Section, for: indexPath) as! SectionHeaderView
        sectionView.sectionTitle.text = help?.sections[indexPath.section].key
        return sectionView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 64)
    }
}
