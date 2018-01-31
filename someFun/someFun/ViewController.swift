//
//  ViewController.swift
//  someFun
//
//  Created by Roman Kochnev on 24.01.2018.
//  Copyright © 2018 Roman Kochnev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Player: UIImageView!
    @IBOutlet weak var Platform: UIImageView!
    @IBOutlet var Landscape: [UIImageView]!
    
    var scoreLabel = UILabel()
    
   // @IBOutlet weak var scoreLabel: UILabel!
    var score = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scoreLabel = UILabel(frame: CGRect(x: 16, y: 20, width: 77, height: 21))
        scoreLabel.textAlignment = NSTextAlignment.center
        scoreLabel.text = "0"
        scoreLabel.font = UIFont(name: "Apple SD Gothic Neo", size: 25)
        scoreLabel.textColor = UIColor.white
        
        self.view.addSubview(scoreLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of anxy resources that can be recreated.
    }
    
    func move() {
        score += 5
        scoreLabel.text = "\(score)"
        
        if (score == 140) {
            let alertController = UIAlertController(title: "Congratulations!", message: "You've Got High Score!", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Nice", style: .default, handler: nil)
            
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
        
        UIView.animate(withDuration: 0.2, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.Player.center = CGPoint(x: self.Player.center.x, y: self.Player.center.y - 50)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.8, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.Player.center = CGPoint(x: self.Player.center.x, y: self.Player.center.y + 50)
            
            for i in 0...self.Landscape.count - 1 {
                self.Landscape[i].center = CGPoint(x: self.Landscape[i].center.x, y: self.Landscape[i].center.y + 50)
                
                if (self.Player.frame.intersects(self.Landscape[i].frame)) && (self.Landscape[i].backgroundColor == UIColor.blue) {
                    let EndViewControllerTemp = self.storyboard?.instantiateViewController(withIdentifier: "endVC") as! UIViewController
                    
                    self.present(EndViewControllerTemp as UIViewController, animated: true, completion: nil)
                }
            }
        }, completion: nil)
        
        for i in 0...self.Landscape.count - 1 {
            if(self.Landscape[i].center.y >= self.view.center.y * 2 + 100) {
                self.Landscape[i].center.y = -25
                
                let randomNumber = arc4random() % 7
                
                switch(randomNumber) {
                case 0:
                    Landscape[i].backgroundColor = UIColor.red
                    break
                case 1:
                    Landscape[i].backgroundColor = UIColor.brown
                    break
                case 2:
                    Landscape[i].backgroundColor = UIColor.blue
                    break
                case 3:
                    Landscape[i].backgroundColor = UIColor.purple
                    break
                case 4:
                    Landscape[i].backgroundColor = UIColor.green
                    break
                case 5:
                    Landscape[i].backgroundColor = UIColor.orange
                    break
                case 6:
                    Landscape[i].backgroundColor = UIColor.cyan
                    break
                default:
                    Landscape[i].backgroundColor = UIColor.black
                    break
                }
            }
        }
    }
    
    func moveLeft() {
        UIView.animate(withDuration: 0.1, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.Player.center = CGPoint(x: self.Player.center.x - 50, y: self.Player.center.y)
        }, completion: nil)
    }
    
    func moveRight() {
        UIView.animate(withDuration: 0.1, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.Player.center = CGPoint(x: self.Player.center.x + 50, y: self.Player.center.y)
        }, completion: nil)
    }
    
    /*
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       move()
    }
    */
  /*
    @IBAction func typeAction_(_ sender: UITapGestureRecognizer) {
        move()
    }
     */
    @IBAction func typeAction(_ sender: Any) {
        move()
    }
 
    
    @IBAction func swipedLeft(_ sender: Any) {
        moveLeft()
    }
    
    @IBAction func swipedRight(_ sender: Any) {
        moveRight()
    }
    
    override var prefersStatusBarHidden: Bool { // Скрыть верхнюю панель состояния.
        return true
    }
}

