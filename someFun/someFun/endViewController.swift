//
//  endViewController.swift
//  someFun
//
//  Created by Roman Kochnev on 26.01.2018.
//  Copyright © 2018 Roman Kochnev. All rights reserved.
//

import Foundation
import UIKit

class endVC: UIViewController {
    
    
    @IBOutlet weak var scoreResultLbl: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgainAction(_ sender: Any) {
        let viewControllerTemp = self.storyboard?.instantiateViewController(withIdentifier: "viewController") as! UIViewController
        
        self.present(viewControllerTemp as UIViewController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
       /* super.viewDidLoad()
        if scoreResultLbl != nil {
        scoreResultLbl = UILabel(frame: CGRect(x: 16, y: 20, width: 77, height: 21))
        scoreResultLbl.textAlignment = NSTextAlignment.center
        scoreResultLbl.text = "0"
        scoreResultLbl.font = UIFont(name: "Apple SD Gothic Neo", size: 25)
        scoreResultLbl.textColor = UIColor.white
        
        self.view.addSubview(scoreResultLbl)
        } */
    }
}
