//
//  UIViewControllerExtension.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import UIKit

extension UIViewController {
    
    func setupKeyboard() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}
