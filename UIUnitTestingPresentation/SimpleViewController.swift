//
//  SimpleViewController.swift
//  UIUnitTestingPresentation
//
//  Created by Yannic Borgfeld on 08.01.21.
//

import UIKit

public class SimpleViewModel {
    public init() {}
    
    var textChangeObserver: ((String) -> Void)?
    
    func textChangeRequested() {
        textChangeObserver?("Check24")
    }
}

public class SimpleViewController: UIViewController {
    @IBOutlet public private(set) var button: UIButton?
    @IBOutlet public private(set) var textLabel: UILabel?
    
    public var viewModel: SimpleViewModel? {
        didSet {
            bindViewWithViewModel()
        }
    }
    
    public override func viewDidLoad() {
        button?.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        viewModel?.textChangeRequested()
    }
    
    private func bindViewWithViewModel() {
        viewModel?.textChangeObserver = { [weak self] text in
            self?.textLabel?.text = text
        }
    }
}
