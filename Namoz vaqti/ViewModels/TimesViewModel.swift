//
//  TimesViewModel.swift
//  Namoz vaqti
//
//  Created by user on 23/09/24.
//

import Foundation
import Adhan
import CoreLocation


class TimesViewModel {

  var fajr: String?
  var sunrise: String?
  var dhuhr: String?
  var asr: String?
  var maghrib: String?
  var isha: String?

  var timer: Timer?
  var nextPrayerTime: Date?
  var countrName: String?

  func showPrayerTimes(completion: @escaping (String, String, String) -> Void) {
    LocationService.shared.getCurrentLocation { location in
      let latitude = location.coordinate.latitude
      let longitude = location.coordinate.longitude
      print("Lat:", latitude)
      print("Lon:", longitude)
      self.getAddress(latitude: latitude, longitude: longitude)
      let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
      let date = calendar.dateComponents([.year, .month, .day], from: Date())
      let coordinates = Coordinates(latitude: latitude, longitude: longitude)
      var params = CalculationMethod.moonsightingCommittee.params
      params.madhab = .hanafi
      if let prayers = PrayerTimes(coordinates: coordinates, date: date, calculationParameters: params) {

        if let nextPrayer = prayers.nextPrayer() {
          let nextPrayerName = self.prayerName(name: nextPrayer)
          self.nextPrayerTime = prayers.time(for: nextPrayer)
          self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] timer in
            guard let nextPrayerTime = self?.nextPrayerTime else { return }
            let timeRemaining = nextPrayerTime.timeIntervalSinceNow
            guard let nextPrayerTime = self?.formatTimeInterval(timeRemaining) else { return }
            guard let countrName = self?.countrName else { return }
            if timeRemaining > 0 {
              completion(nextPrayerName, nextPrayerTime, countrName)
            }
          })
        }

        self.fajr    = self.formattedPrayerTime(prayers.fajr)
        self.sunrise = self.formattedPrayerTime(prayers.sunrise)
        self.dhuhr   = self.formattedPrayerTime(prayers.dhuhr)
        self.asr     = self.formattedPrayerTime(prayers.asr)
        self.maghrib = self.formattedPrayerTime(prayers.maghrib)
        self.isha    = self.formattedPrayerTime(prayers.isha)
      }
    }
  }

  func formattedPrayerTime(_ prayerTime: Date?) -> String {
    guard let prayerTime = prayerTime else { return "N/A" }

    let formatter = DateFormatter()
    formatter.timeStyle = .short
    formatter.timeZone = TimeZone.current

    return formatter.string(from: prayerTime)
  }

  func formatTimeInterval(_ interval: TimeInterval) -> String {
       let hours = Int(interval) / 3600
       let minutes = (Int(interval) % 3600) / 60
       let seconds = Int(interval) % 60
       return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
   }

  func prayerName(name: Prayer) -> String {
    if name == Prayer.fajr {
      return "Tong"
    } else if name == Prayer.sunrise {
      return "Quyosh"
    } else if name == Prayer.dhuhr {
      return "Peshin"
    } else if name == Prayer.asr {
      return "Asr"
    } else if name == Prayer.maghrib {
      return "Shom"
    } else if name == Prayer.isha {
      return "Hufton"
    }
    return "--"
  }

  func getAddress(latitude: Double, longitude: Double) {
    let geoCoder = CLGeocoder()
    let location = CLLocation(latitude: latitude, longitude: longitude)
    geoCoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
      guard let placemark = placemarks?.first else {
        return
      }

      // City
      if let country = placemark.country, let city = placemark.administrativeArea {
        self?.countrName = "\(city), \(country)"
      }
    }
  }
}


