//
//  HomeController.swift
//  DarkModeApp
//
//  Created by Gilmar Junior on 25/05/22.
//

import Foundation
import UIKit

class HomeController: UIViewController {
    
    var homeScreen: HomeScreen?
    let defaults = UserDefaults.standard
    let nightKey: String = "isNight"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen = HomeScreen()
        self.view = self.homeScreen
        self.homeScreen?.delegate(delegate: self)
        
        
        if let isNight = defaults.value(forKey: nightKey){
            if isNight as! Bool {
                switchToNight()
            }
        }
    }
    
}

extension HomeController: HomeScreenProtocol {
    
    func switchFlipped(sender: UISwitch) {
        guard let home = homeScreen else { return }
        if home.mySwitch.isOn {
            switchToNight()
            defaults.set(true, forKey: nightKey)
        } else {
            switchToDay()
            defaults.set(false, forKey: nightKey)
        }
    }
    
    func switchToNight() {
        homeScreen?.mySwitch.setOn(true, animated: false)
        homeScreen?.overrideUserInterfaceStyle = .dark
    }
    
    func switchToDay() {
        homeScreen?.mySwitch.setOn(false, animated: false)
        homeScreen?.overrideUserInterfaceStyle = .light
    }
    
    
}
