//
//  UIImage+Scale.swift
//  Marker3D
//
//  Created by Hung Cao on 4/7/20.
//  Copyright © 2020 Hung Cao. All rights reserved.
//

import UIKit
import Foundation

extension UIImage {
    func scaleToSize(aSize: CGSize) -> UIImage? {
        if self.size.equalTo(aSize) {
            return self
        }
        
        UIGraphicsBeginImageContextWithOptions(aSize, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: aSize.width, height: aSize.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let img = image else {
            return nil
        }
        return UIImage(cgImage: img.cgImage!, scale: 2.0, orientation: .up)
    }
}


func deg2rad(_ number: Double) -> Double {
    return number * Double.pi / 180.0
}
