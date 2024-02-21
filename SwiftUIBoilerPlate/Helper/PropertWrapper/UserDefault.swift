//
//  UserDefault.swift
//  Summit
//
//  Created by AKASH on 23/01/23.
//

import Foundation

// MARK: - UserDefault
@propertyWrapper
struct UserDefault<Value> {
    var key: String
    var defaultValue: Value

    var wrappedValue: Value {
        get {
            UserDefaults.standard.object(forKey: key) as? Value ?? defaultValue
        }

        set {
            UserDefaults.standard.setValue(newValue, forKey: key)
        }
    }

    init(key: String, defaultValue: Value) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var projectedValue: Self {
        self
    }

    func removeObject() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}

// MARK: - UserDefaultEncoded
@propertyWrapper
struct UserDefaultEncoded<T: Codable> {
    let key: String
    let defaultValue: T

    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            guard let jsonString = UserDefaults.standard.string(forKey: key) else {
                return defaultValue
            }
            guard let jsonData = jsonString.data(using: .utf8) else {
                return defaultValue
            }
            guard let value = try? JSONDecoder().decode(T.self, from: jsonData) else {
                return defaultValue
            }
            return value
        }
        set {
            let encoder = JSONEncoder()
            encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
            guard let jsonData = try? encoder.encode(newValue) else {
                return
            }
            let jsonString = String(bytes: jsonData, encoding: .utf8)
            UserDefaults.standard.set(jsonString, forKey: key)
        }
    }

    var projectedValue: Self {
        self
    }

    func removeObject() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}

// MARK: - UserDefaultType
enum UserDefaultType {}
