//
//  ViewController.swift
//  Demo
//
//  Created by jinsei_shima on 2019/02/18.
//  Copyright © 2019 Jinsei Shima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let remaingCountIndicator = RemainigCountIndicator(
        maximumNumber: 20,
        config: RemainigCountIndicator.Config.init(threshold1: 5, threshold2: -5),
        style: RemainigCountIndicator.Style.init()
    )

    let incrementBbutton = UIButton(type: .system)
    let decrementButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(remaingCountIndicator)
        view.addSubview(incrementBbutton)
        view.addSubview(decrementButton)

        remaingCountIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            remaingCountIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            remaingCountIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ])

        incrementBbutton.addTarget(self, action: #selector(increment), for: .touchUpInside)
        incrementBbutton.frame = .init(x: 0, y: 0, width: 96, height: 44)
        incrementBbutton.center = .init(x: view.bounds.width / 4, y: view.bounds.height * 3 / 4)
        incrementBbutton.setTitle("+", for: .normal)
        incrementBbutton.setTitleColor(UIColor.darkText, for: .normal)
        incrementBbutton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        incrementBbutton.backgroundColor = UIColor.groupTableViewBackground
        incrementBbutton.layer.cornerRadius = 8

        decrementButton.addTarget(self, action: #selector(decrement), for: .touchUpInside)
        decrementButton.frame = .init(x: 0, y: 0, width: 96, height: 44)
        decrementButton.center = .init(x: view.bounds.width * 3 / 4, y: view.bounds.height * 3 / 4)
        decrementButton.setTitle("-", for: .normal)
        decrementButton.setTitleColor(UIColor.darkText, for: .normal)
        decrementButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        decrementButton.backgroundColor = UIColor.groupTableViewBackground
        decrementButton.layer.cornerRadius = 8
    }

    @objc func increment() {
        remaingCountIndicator.currentNumber += 1
    }

    @objc func decrement() {
        remaingCountIndicator.currentNumber -= 1
    }

}

