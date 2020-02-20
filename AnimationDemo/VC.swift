//
//  VC.swift
//  AnimationDemo
//
//  Created by PC on 08/02/20.
//  Copyright © 2020 PC. All rights reserved.
//

import UIKit
import SOTabBar
class VC: SOTabBarController {
    
    override func loadView() {
        super.loadView()
        SOTabBarSetting.tabBarTintColor = #colorLiteral(red: 2.248547389e-05, green: 0.7047000527, blue: 0.6947537661, alpha: 1)
        SOTabBarSetting.tabBarCircleSize = CGSize(width: 60, height: 60)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC")
        let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
        let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdVC")
        //SOTabBarSetting.tabBarHeight = 100.0
        SOTabBarSetting.tabBarCircleSize = CGSize(width: 50.0, height: 50.0)
        firstVC.tabBarItem = UITabBarItem(title: "FirstVC", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        secondVC.tabBarItem = UITabBarItem(title: "SecondVC", image: UIImage(named: "chat"), selectedImage: UIImage(named: "chat"))
        thirdVC.tabBarItem = UITabBarItem(title: "ThirdVC", image: UIImage(named: "menu"), selectedImage: UIImage(named: "menu"))
        viewControllers = [firstVC, secondVC,thirdVC]
        // Do any additional setup after loading the view.
    }
}
extension ViewController: SOTabBarControllerDelegate {
    func tabBarController(_ tabBarController: SOTabBarController, didSelect viewController: UIViewController) {
        print(viewController.tabBarItem.title ?? "")
    }
}
