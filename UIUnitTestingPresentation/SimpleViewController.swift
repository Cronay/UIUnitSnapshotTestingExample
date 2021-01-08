//
//  SimpleViewController.swift
//  UIUnitTestingPresentation
//
//  Created by Yannic Borgfeld on 08.01.21.
//

import UIKit

public class SimpleViewController: UIViewController {
    @IBOutlet public private(set) var button: UIButton?
    @IBOutlet public private(set) var textLabel: UILabel?
    
    public override func viewDidLoad() {
        button?.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        textLabel?.text = "Check24"
    }
}
