//
//  DatePicker.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class DatePicker: View {
    
    // MARK: - Mode
    
    public var datePickerMode: String?
    
    // MARK: - Locale
    
    public var locale: Locale?
    
    // MARK: - Interval

    public var minuteInterval: String?

    // MARK: - Date
    
    public var date: [Date]?
    
    // MARK: - Timer

    public var countDownDuration: String?
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case datePickerMode
        case locale
        case minuteInterval
        case date
        case countDownDuration
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.datePickerMode = try container.decodeIfPresent(String.self, forKey: .datePickerMode)
        self.locale = try container.decodeIfPresent(Locale.self, forKey: .locale)
        self.minuteInterval = try container.decodeIfPresent(String.self, forKey: .minuteInterval)
        self.date = try container.decodeIfPresent([Date].self, forKey: .date)
        self.countDownDuration = try container.decodeIfPresent(String.self, forKey: .countDownDuration)

        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(datePickerMode, forKey: .datePickerMode)
        try container.encodeIfPresent(locale, forKey: .locale)
        try container.encodeIfPresent(minuteInterval, forKey: .minuteInterval)
        try container.encodeIfPresent(date, forKey: .date)
        try container.encodeIfPresent(countDownDuration, forKey: .countDownDuration)

        try super.encode(to: encoder)
    }

}
