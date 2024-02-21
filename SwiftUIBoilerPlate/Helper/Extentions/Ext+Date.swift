//
//  Ext+Date.swift
//  SwiftUIDemo
//
//  Created by iOS Developer on 11/12/23.
//

import Foundation

// MARK: - DateFormatType
enum DateFormatType: String {
    case twelveHourWithDayOfMonth = "hh:mm:ss a 'on' MMMM dd, yyyy" // Output: 12:16:45 PM on January 01, 2000
    case abbreviatedDayWithFullDate = "E, d MMM yyyy HH:mm:ss Z" // Output: Sat, 1 Jan 2000 12:16:45 +0600
    case iso8601 = "yyyy-MM-dd'T'HH:mm:ssZ" // Output: 2000-01-01T12:16:45+0600
    case fullDayWithFullDate = "EEEE, MMM d, yyyy" // Output: Saturday, Jan 1, 2000
    case monthDayYearWithTime = "MM-dd-yyyy HH:mm" // Output: 01-01-2000 12:16
    case abbreviatedMonthDayWithTime = "MMM d, h:mm a" // Output: Jan 1, 12:16 PM
    case hourMinuteSecondWithMilliseconds = "HH:mm:ss.SSS" // Output: 12:16:45.000
    case monthDayYear = "MMM d, yyyy" // Output: Jan 1, 2000
    case monthDayYearSlashes = "MM/dd/yyyy" // Output: 01/01/2000
    case twelveHourTime = "hh:mm:ss a" // Output: 12:16:45 PM
    case fullMonthYear = "MMMM yyyy" // Output: January 2000
    case dayMonthYearDots = "dd.MM.yy" // Output: 01.01.00
    case shortDayShortMonthYear = "E, d MMM yy" // Output: Sat, 1 Jan 00
    case shortDayShortMonth = "E, d MMM" // Output: Sat, 1 Jan
    case shortMonthDayYear = "MMM d, yy" // Output: Jan 1, 00
    case fullDayFullMonthYear = "EEEE, d MMMM yyyy" // Output: Saturday, 1 January 2000
    case fullMonthDayYear = "MMMM d, yyyy" // Output: January 1, 2000
    case dayMonthYear = "d MMM yyyy" // Output: 1 Jan 2000
    case fullYear = "yyyy" // Output: 2000
    case shortYear = "yy" // Output: 00
    case monthDay = "MM-dd" // Output: 01-01
    case shortMonthDay = "MMM d" // Output: Jan 1
    case shortMonthYear = "MMM yy" // Output: Jan 00
    case monthYear = "MMM yyyy" // Output: Jan 2000
    case day = "d" // Output: 1
    case fullDay = "EEEE" // Output: Saturday
    case month = "MMM" // Output: Jan
    case fullMonth = "MMMM" // Output: January
    case shortTime = "h:mm a" // Output: 12:16 PM
    case longTime = "HH:mm:ss" // Output: 12:16:45
    case shortMonth = "MM" // Output: 01
    case longMonth = "MMMMM" // Output: J
    case shortWeekday = "E" // Output: Sat
}

extension Date {
    func toString(format: DateFormatType) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format.rawValue
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        return formatter.string(from: self)
    }
}
