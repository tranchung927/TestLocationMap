//
//  ViewController.swift
//  TestLocation
//
//  Created by Admin on 6/24/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        determineMyCurrentLocation()
    }
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        // manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    
//    func didLongPressMap() {
//        
//        if sender.state == UIGestureRecognizerState.began {
//            let touchPoint = sender.location(in: mapView)
//            let touchCoordinate = mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
//            let annotation = MKPointAnnotation()
//            annotation.coordinate = touchCoordinate
//            annotation.title = “Your position”
//            mapView.addAnnotation(annotation) //drops the pin
//            print(“lat:  \(touchCoordinate.latitude)“)
//            let num = touchCoordinate.latitude as NSNumber
//            let formatter = NumberFormatter()
//            formatter.maximumFractionDigits = 4
//            formatter.minimumFractionDigits = 4
//            let str = formatter.string(from: num)
//            print(“long: \(touchCoordinate.longitude)“)
//            let num1 = touchCoordinate.longitude as NSNumber
//            let formatter1 = NumberFormatter()
//            formatter1.maximumFractionDigits = 4
//            formatter1.minimumFractionDigits = 4
//            let str1 = formatter1.string(from: num1)
//            adressLoLa.text = “\(num),\(num1)”
//            
//            // Add below code to get address for touch coordinates.
//            let geoCoder = CLGeocoder()
//            let location = CLLocation(latitude: touchCoordinate.latitude, longitude: touchCoordinate.longitude)
//            geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
//                
//                // Place details
//                var placeMark: CLPlacemark!
//                placeMark = placemarks?[0]
//                
//                // Address dictionary
//                print(placeMark.addressDictionary as Any)
//                
//                // Location name
//                if let locationName = placeMark.addressDictionary!["Name"] as? NSString {
//                    print(locationName)
//                }
//                // Street address
//                if let street = placeMark.addressDictionary!["Thoroughfare"] as? NSString {
//                    print(street)
//                }
//                // City
//                if let city = placeMark.addressDictionary!["City"] as? NSString {
//                    print(city)
//                }
//                // Zip code
//                if let zip = placeMark.addressDictionary!["ZIP"] as? NSString {
//                    print(zip)
//                }
//                // Country
//                if let country = placeMark.addressDictionary!["Country"] as? NSString {
//                    print(country)
//                }
//            })
//        }
//    }
}

