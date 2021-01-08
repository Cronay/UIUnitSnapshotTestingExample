//
//  SimpleUIComposer.swift
//  UIUnitTestingPresentation
//
//  Created by Yannic Borgfeld on 08.01.21.
//

import UIKit

public class SimpleUIComposer {
    private init() {}
    
    public static func compose(with loader: TextLoader) -> SimpleViewController {
        let bundle = Bundle(for: SimpleViewController.self)
        let sb = UIStoryboard(name: "Simple", bundle: bundle)
        let simpleController: SimpleViewController = sb.instantiateViewController(identifier: String(describing: SimpleViewController.self))
        simpleController.viewModel = SimpleViewModel(loader: loader)
        return simpleController
    }
}
