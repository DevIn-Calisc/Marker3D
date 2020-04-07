//
//  ViewController.swift
//  Marker3D
//
//  Created by Hung Cao on 4/7/20.
//  Copyright © 2020 Hung Cao. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import SceneKit

let CAR_COUNT_LIMIT = 10

class ViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate, SCNSceneRendererDelegate {
    @IBOutlet weak var mapView: GMSMapView!
    var locationManager: CLLocationManager!
    var markers: [HCCarMarker] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupMap()
        setupLocationManager()
    }

    func setupMap() {
        self.mapView.delegate = self
        self.mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.mapView.isMyLocationEnabled = true
        
        self.mapView.settings.myLocationButton = false
        self.mapView.settings.rotateGestures = false
        self.mapView.settings.tiltGestures = false
        
        self.mapView.animate(toZoom: 16)
        
        createMarker()
        
        self.mapView.animate(toViewingAngle: 20)
        
    }
    
    func createMarker(location: CLLocationCoordinate2D? = nil) {
        guard markers.count < CAR_COUNT_LIMIT else {
            return
        }
        
        let marker = HCCarMarker.init(car: .teslaModelX)
        marker.map = self.mapView
        if let location = location {
            marker.position = location
        }
        
        markers.append(marker)
    }
    func setupLocationManager() {
        self.locationManager = CLLocationManager()
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.activityType = .automotiveNavigation
        self.locationManager.startUpdatingLocation()
        self.locationManager.startUpdatingHeading()
    }
    
}

