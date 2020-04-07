//
//  HCCarMarker.swift
//  Marker3D
//
//  Created by Hung Cao on 4/7/20.
//  Copyright © 2020 Hung Cao. All rights reserved.
//

import UIKit
import GoogleMaps
import SceneKit
import Foundation

enum CarName: String {
    case teslaModelX = "Tesla+Model+X.dae"
}

class HCCarMarker: GMSMarker {
    private var car: CarName!
    var heading: Double = 0.0 {
        didSet {
            updateIcon()
        }
    }
    var scale: Float = 1 {
        didSet {
            updateIcon()
        }
    }
    
    init(car: CarName) {
        super.init()
        self.heading = 0.0
        self.car = car
        self.appearAnimation = .pop
        setupSceneKit(car: car)
    }
    
    func updateIcon() {
        let roundedHeading = Int(self.heading / ImageCache.step)
        self.icon = ImageCache.shared.getImage(car: car, roundedHeading: roundedHeading, scale: scale)
    }
    
    func setupSceneKit(car: CarName) {
        self.groundAnchor = CGPoint(x: 0.5, y: 0.5)
        updateIcon()
    }
}


