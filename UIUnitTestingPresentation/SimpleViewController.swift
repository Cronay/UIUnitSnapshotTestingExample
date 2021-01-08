//
//  SimpleViewController.swift
//  UIUnitTestingPresentation
//
//  Created by Yannic Borgfeld on 08.01.21.
//

import UIKit

public protocol TextLoader {
    func load(completion: @escaping (String) -> Void)
}

public class SimpleViewModel {
    private let loader: TextLoader
    
    public init(loader: TextLoader) {
        self.loader = loader
    }
    
    var textChangeObserver: ((String) -> Void)?
    
    func textChangeRequested() {
        loader.load { [weak self] text in
            self?.textChangeObserver?(text)
        }
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
        textLabel?.text = nil
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
