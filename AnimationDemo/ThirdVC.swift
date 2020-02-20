//
//  ThirdVC.swift
//  AnimationDemo
//
//  Created by PC on 08/02/20.
//  Copyright © 2020 PC. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {
    @IBOutlet weak var basketTop: UIImageView!
    @IBOutlet weak var basketBottom: UIImageView!
    
    @IBOutlet weak var fabricTop: UIImageView!
    @IBOutlet weak var fabricBottom: UIImageView!
    
    @IBOutlet weak var basketTopConstraint : NSLayoutConstraint!
    @IBOutlet weak var basketBottomConstraint : NSLayoutConstraint!
    
    @IBOutlet weak var bug: UIImageView!
    
    var isBugDead = false
    var tap:UITapGestureRecognizer!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_ :)))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        openBasket()
        openNapkins()
        moveBugLeft()
        view.addGestureRecognizer(tap)
    }
    func openBasket(){
        basketTopConstraint.constant -= basketTop.frame.size.height
        basketBottomConstraint.constant -= basketBottom.frame.size.height
        
        UIView.animate(withDuration: 0.7, delay: 1.0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    func openNapkins(){
        UIView.animate(withDuration: 1.0,delay: 1.2,options: .curveEaseOut, animations: {
            var fabricTopFrame = self.fabricTop.frame
            fabricTopFrame.origin.y -= fabricTopFrame.size.height
            
            var fabricBottomFrame = self.fabricBottom.frame
            fabricBottomFrame.origin.y += fabricBottomFrame.size.height
            self.fabricTop.frame = fabricTopFrame
            self.fabricBottom.frame = fabricBottomFrame
        },completion: nil)
    }
    
    func moveBugLeft() {
        if isBugDead { return }
        UIView.animate(withDuration: 1.0,
                       delay: 2.0,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: {
                        self.bug.center = CGPoint(x: 75, y: 200)
        },
                       completion: { finished in
                        //print("Bug moved left!")
                        self.faceBugRight()
        })
    }
    
    func faceBugRight() {
        if isBugDead { return }
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: {
                        self.bug.transform = CGAffineTransform(rotationAngle: .pi)
        },
                       completion: { finished in
                        //print("Bug faced right!")
                        self.moveBugRight()
        })
    }
    
    func moveBugRight() {
        if isBugDead { return }
        UIView.animate(withDuration: 1.0,
                       delay: 2.0,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: {
                        self.bug.center = CGPoint(x: self.view.frame.width - 75, y: 250)
        },
                       completion: { finished in
                        //print("Bug moved right!")
                        self.faceBugLeft()
        })
    }
    
    func faceBugLeft() {
        if isBugDead { return }
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: {
                        self.bug.transform = CGAffineTransform(rotationAngle: 0.0)
        },
                       completion: { finished in
                        //print("Bug faced left!")
                        self.moveBugLeft()
        })
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        let tapLocation = gesture.location(in: bug.superview)
        if (bug.layer.presentation()?.frame.contains(tapLocation))! {
            if isBugDead { return }
            view.removeGestureRecognizer(tap)
            isBugDead = true
            UIView.animate(withDuration: 0.7, delay: 0.0,
                           options: [.curveEaseOut , .beginFromCurrentState], animations: {
                            self.bug.transform = CGAffineTransform(scaleX: 1.25, y: 0.75)
            }, completion: { finished in
                UIView.animate(withDuration: 2.0, delay: 2.0, options: [], animations: {
                    self.bug.alpha = 0.0
                }, completion: { finished in
                    self.bug.removeFromSuperview()
                })
            })
            //print("Bug tapped!")
        } else {
            //print("Bug not tapped!")
        }
    }
}
