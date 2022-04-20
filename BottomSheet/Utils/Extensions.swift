//
//  Extensions.swift
//  BottomSheet
//
//  Created by Vaibhav Sadana on 28/03/22.
//

import Foundation
import UIKit

public extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let roundedLayer = CAShapeLayer()
        roundedLayer.path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        ).cgPath
        layer.mask = roundedLayer
    }
    
    func fadeTo(
        duration: TimeInterval = 0.3,
        delay: TimeInterval = 0,
        completion: (() -> Void)? = nil) {
            UIView.animate(withDuration: duration, delay: delay, options: .curveEaseInOut){
                self.layoutIfNeeded()
            }
        }
    
    func fadeInOut(duration: TimeInterval = 0.3, delay: TimeInterval = 0, completion: (() -> Void)? = nil) {
        fadeTo(duration: duration, delay: delay, completion: completion)
    }
    
    func setupBottomSheetCornerRadius(){
        self.clipsToBounds = true
        self.layer.cornerRadius = 20
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
}
