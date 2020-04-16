//
//  Extensions.swift
//  ShoppingItems
//
//  Created by Bharatraj Rai on 4/15/20.
//  Copyright © 2020 Bharatraj Rai. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

extension UINavigationController {
        func setupNavigationalController() {
            if #available(iOS 13.0, *) {
                let navBarAppearance = UINavigationBarAppearance()
                navBarAppearance.configureWithOpaqueBackground()
                
                navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
                navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
                self.navigationBar.standardAppearance = navBarAppearance
                self.navigationBar.prefersLargeTitles = true
                self.navigationBar.tintColor = .gray
                self.navigationBar.scrollEdgeAppearance = navBarAppearance
            } else {
                // Fallback on earlier versions
                    self.navigationBar.isTranslucent = false
                    self.navigationBar.tintColor = .gray
                    self.navigationBar.prefersLargeTitles = true
                    self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
                    self.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
           }
        }
}
