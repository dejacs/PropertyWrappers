//
//  DateFormatted.swift
//  PropertyWrappers
//
//  Created by Jade Silveira on 15/07/21.
//

import Foundation
import UIKit

struct ViewModel {
    @Capitalized var name: String
    @DateStringFormatted var date: String
    @DateFormatted var datePicker: Date?
}

extension String {
    func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = formatter.date(from: self)
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: formattedDate!)
    }
}

@propertyWrapper struct Capitalized {
    var wrappedValue: String {
        didSet { wrappedValue = wrappedValue.capitalized }
    }

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}

@propertyWrapper struct DateStringFormatted {
    var wrappedValue: String {
        didSet {
            wrappedValue = wrappedValue.formatDate()
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.formatDate()
    }
}

@propertyWrapper struct DateFormatted {
    let dateString: String

    var wrappedValue: Date? {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            return formatter.date(from: dateString)
        }
    }
}

@propertyWrapper struct CapitalizedLabel {
    var wrappedValue: UILabel {
        didSet {
            let label = wrappedValue
            label.text = label.text?.capitalized
            wrappedValue = label
        }
    }
    
    init(wrappedValue: UILabel) {
        let label = wrappedValue
        label.text = label.text?.capitalized
        self.wrappedValue = label
    }
}

@propertyWrapper struct DateFormattedLabel {
    var wrappedValue: UILabel
    
    init(wrappedValue: UILabel) {
        let label = wrappedValue
        label.text = label.text?.formatDate()
        self.wrappedValue = wrappedValue
    }
}

// Modelos relacionados ao banco de dados (String, Bool, ...)
// modelo decodable
// modelo encodable
// modelo codable

// Modelos relacionados a lógica de front end (Dependencies, DatePicker, UIView, ...)
// ViewModel
