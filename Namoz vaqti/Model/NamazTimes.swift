//
//  NamazTimes.swift
//  Namoz vaqti
//
//  Created by user on 29/06/24.
//

import Foundation

// MARK: - NamazTimes
struct NamazTimes: Codable {
  let code: Int
  let status: String
  let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let timings: Timings
    let date: DateClass
    let meta: Meta
}

// MARK: - Timings
struct Timings: Codable {
    let fajr, sunrise, dhuhr, asr: String
    let maghrib, isha: String

    enum CodingKeys: String, CodingKey {
        case fajr = "Fajr"
        case sunrise = "Sunrise"
        case dhuhr = "Dhuhr"
        case asr = "Asr"
        case maghrib = "Maghrib"
        case isha = "Isha"
    }
}

// MARK: - DateClass
struct DateClass: Codable {
    let readable, timestamp: String
}


// MARK: - Meta
struct Meta: Codable {
    let latitude, longitude: Double
    let timezone: String
    let method: Method
    let latitudeAdjustmentMethod, midnightMode, school: String
    let offset: [String: Int]
}

// MARK: - Method
struct Method: Codable {
    let id: Int
    let name: String
    let params: Params
    let location: Location
}

// MARK: - Location
struct Location: Codable {
    let latitude, longitude: Double
}

// MARK: - Params
struct Params: Codable {
    let fajr, isha: Int

    enum CodingKeys: String, CodingKey {
        case fajr = "Fajr"
        case isha = "Isha"
    }
}
