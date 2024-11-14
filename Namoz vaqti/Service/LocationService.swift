//
//  LocationService.swift
//  Namoz vaqti
//
//  Created by user on 29/06/24.
//

import Foundation
import CoreLocation

class LocationService: NSObject {

  static let shared = LocationService()

  let manager = CLLocationManager()

  var completion: ((CLLocation) -> Void)?

  func getCurrentLocation(completion: @escaping ((CLLocation) -> Void)) {
    self.completion = completion
    manager.delegate = self
    manager.desiredAccuracy = kCLLocationAccuracyBest
    manager.requestWhenInUseAuthorization()
    manager.startUpdatingLocation()
  }
}

extension LocationService: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else { return }
    completion?(location)
    manager.stopUpdatingLocation()
  }
}
