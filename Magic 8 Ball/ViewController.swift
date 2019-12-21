//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]
    let colorBackground = UIColor(red: 99/255, green: 205/255, blue: 255/255, alpha: 1)
    let titleLabel = UILabel()
    let imageCenter = UIImageView()
    let buttonAsk = UIButton()

    override func viewDidLoad() {
        self.view.backgroundColor = colorBackground
        setPropetiesDefault()
        addComponents()
        setConstraints()
    }
    
    private func setPropetiesDefault(){
        titleLabel.text = "Ask Me Anything..."
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 30)
        imageCenter.contentMode = .scaleAspectFit
        buttonAsk.setTitle("Ask", for: .normal)
        buttonAsk.setTitleColor(colorBackground, for: .normal)
        buttonAsk.titleLabel?.font = .systemFont(ofSize: 25)
        buttonAsk.backgroundColor = .white
        buttonAsk.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        
    }
    
    @objc private func actionButton(){
        let ramdomNumber = Int.random(in: 0 ..< 5)
        imageCenter.image = ballArray[ramdomNumber]
    }
    
    private func addComponents(){
        self.view.addSubview(titleLabel)
        self.view.addSubview(imageCenter)
        self.view.addSubview(buttonAsk)
    }
    
    private func setConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageCenter.translatesAutoresizingMaskIntoConstraints = false
        buttonAsk.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100),
            imageCenter.heightAnchor.constraint(equalToConstant: 150),
            imageCenter.widthAnchor.constraint(equalToConstant: 150),
            imageCenter.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            imageCenter.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            buttonAsk.heightAnchor.constraint(equalToConstant: 50),
            buttonAsk.widthAnchor.constraint(equalToConstant: 70),
            buttonAsk.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            buttonAsk.topAnchor.constraint(equalTo: imageCenter.bottomAnchor, constant: 100)
            
        ])
    }

}

