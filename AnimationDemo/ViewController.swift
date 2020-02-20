//
//  ViewController.swift
//  AnimationDemo
//
//  Created by PC on 08/02/20.
//  Copyright © 2020 PC. All rights reserved.
//

import UIKit
import SOTabBar
class ViewController: UIViewController {
    
    @IBOutlet weak var cloud1ImageView: UIImageView!
    @IBOutlet weak var cloud2ImageView: UIImageView!
    @IBOutlet weak var cloud3ImageView: UIImageView!
    @IBOutlet weak var cloud4ImageView: UIImageView!
    @IBOutlet weak var cloud1LeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var cloud2TrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var cloud3TrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var cloud4LeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var headerLabelCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginButtonCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordTextFieldCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usernameTextFieldCenterConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }

    override func viewWillAppear(_ animated: Bool) {
        headerLabelCenterConstraint.constant -= view.bounds.width
        usernameTextFieldCenterConstraint.constant -= view.bounds.width
        passwordTextFieldCenterConstraint.constant -= view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        headerLabelCenterConstraint.constant = 0
        UIView.animate(withDuration: 2.0) {
            [weak self] in
            self?.view.layoutIfNeeded()
        }
        
        usernameTextFieldCenterConstraint.constant = 0
        UIView.animate(withDuration: 2.0, delay: 1.0, options: [.curveEaseIn], animations: {
            [weak self] in
            self?.view.layoutIfNeeded()
        }, completion: nil)
        
        passwordTextFieldCenterConstraint.constant = 0
        UIView.animate(withDuration: 2.0, delay: 1.5,options: [.curveEaseIn], animations: {
            [weak self] in
            self?.view.layoutIfNeeded()
        }, completion: nil)
        
        animateClouds()
        
        UIView.animate(withDuration: 1,
                     delay: 1.2,
                     options: .curveEaseInOut,
                     animations: { [weak self] in
                      self?.loginButton.backgroundColor = .systemYellow
        }, completion: { finished in
            self.loginButton.backgroundColor = .systemGreen
        })
    }
    private func animateClouds()
    {
        let options: UIView.AnimationOptions = [
            .curveEaseInOut,.repeat,.autoreverse
        ]
        
        UIView.animate(withDuration: 2.9, delay: 0, options: options, animations: {
            [weak self] in
            self?.cloud1ImageView.frame.size.height *= 1.18
            self?.cloud1ImageView.frame.size.width *= 1.18
        }, completion: nil)
        
        
        UIView.animate(withDuration: 3.0, delay: 0.2, options: options, animations: {
            [weak self] in
            self?.cloud2ImageView.frame.size.height *= 1.28
            self?.cloud2ImageView.frame.size.width *= 1.28
        }, completion: nil)
        UIView.animate(withDuration: 2.4,
                       delay: 0.1,
                       options: options,
                       animations: { [weak self] in
                        self?.cloud3ImageView.frame.size.height *= 1.15
                        self?.cloud3ImageView.frame.size.width *= 1.15
        }, completion: nil)
        
        UIView.animate(withDuration: 3.2,
                       delay: 0.5,
                       options: options,
                       animations: { [weak self] in
                        self?.cloud4ImageView.frame.size.height *= 1.23
                        self?.cloud4ImageView.frame.size.width *= 1.23
        }, completion: nil)
    }

}


