//
//  ViewController.swift
//  PodTeest
//
//  Created by Bilal Mustafa on 5/11/20.
//  Copyright © 2020 Content Arcade. All rights reserved.
//

import UIKit
import CAHelpView

class ViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
       
       
        
    }
    
    
    @IBAction func buttontapped(_ sender: Any) {
        if let file = Bundle.main.path(forResource: "questions", ofType: "json") {
            do {
                let url = URL.init(fileURLWithPath: file)
                if FileManager.default.fileExists(atPath: url.path) {
                    let data = try Data(contentsOf: url)
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    let vc = CAHelpViewController.CAHelpViewController(json: json as! [String : Any])
                    self.present(vc, animated: true, completion: nil)
                }
            }catch {
                
            }
        }
    }
    

}

