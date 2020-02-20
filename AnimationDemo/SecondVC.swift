//
//  SecondVC.swift
//  AnimationDemo
//
//  Created by PC on 08/02/20.
//  Copyright © 2020 PC. All rights reserved.
//

import UIKit
import anim
class SecondVC: UIViewController {

    let circle = UIView()
    var displayLink: CADisplayLink!
    var value: CGFloat = 0.0
    var invert:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCircle()
//        anim {
//            self.circle.frame.origin = CGPoint(x:100, y:100)
//        }
        displayLink = CADisplayLink(target: self, selector: #selector(handleAnimation))
        displayLink.add(to: RunLoop.main, forMode: .default)
        
    }
    
    @objc func handleAnimation(){
        invert ? (value -= 1) : (value += 1)
        circle.backgroundColor = UIColor.red.withAlphaComponent(value/100)
        if value > 100 || value < 0{
            invert = !invert
        }
    }
    fileprivate func setupCircle(){
        view.addSubview(circle)
        circle.layer.cornerRadius = 50
        circle.backgroundColor = .red
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        circle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        circle.widthAnchor.constraint(equalToConstant: 100).isActive = true
        circle.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
