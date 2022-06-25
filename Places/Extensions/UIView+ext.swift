//
//  UIView+ext.swift
//  Places
//
//  Created by Olzhas Seiilkhanov on 21.06.2022.
//

import UIKit

extension UIView {
    
    func makeConstraints(top: NSLayoutYAxisAnchor? = nil,
                         leading: NSLayoutXAxisAnchor? = nil,
                         trailing: NSLayoutXAxisAnchor? = nil,
                         bottom: NSLayoutYAxisAnchor? = nil,
                         width: CGFloat? = nil, height: CGFloat? = nil) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top).isActive = true
        }
        
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading).isActive = true
        }
        
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom).isActive = true
        }
        
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
}
