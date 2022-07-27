//
//  HomeScreen.swift
//  DarkModeApp
//
//  Created by Gilmar Junior on 25/05/22.
//

import Foundation
import UIKit

protocol HomeScreenProtocol: AnyObject {
    func switchFlipped(sender: UISwitch)
    func switchToNight()
    func switchToDay()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenProtocol?
    
    func delegate(delegate: HomeScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var mySwitch:UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        mySwitch.addTarget(self, action: #selector(switchFlipped(_:)), for: .valueChanged)
        return mySwitch
    }()
    
    override init(frame: CGRect){
        super .init(frame: frame)
        self.configBackgroundColor()
        self.configSuperView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configBackgroundColor(){
        self.backgroundColor = .systemBackground
    }
    
    func configSuperView() {
        self.addSubview(self.mySwitch)
    }
    
    @objc
    func switchFlipped(_ sender: UISwitch) {
        self.delegate?.switchFlipped(sender: sender)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            self.mySwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.mySwitch.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
