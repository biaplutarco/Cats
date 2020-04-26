//
//  Formatter.swift
//  Cats
//
//  Created by Bia on 25/04/20.
//  Copyright © 2020 akhaten. All rights reserved.

import Foundation

extension JSONDecoder.DateDecodingStrategy {
    static let customISO8601: JSONDecoder.DateDecodingStrategy = .custom({ decoder -> Date in
        let container = try decoder.singleValueContainer()
        let dateString = try container.decode(String.self)
        if let date = Formatter.iso8601.date(from: dateString) ?? ISO8601DateFormatter().date(from: dateString) {
            return date
        }
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(dateString)")
    })
}

extension Formatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        return formatter
    }()
}
