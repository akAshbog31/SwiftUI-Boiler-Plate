//
//  MultipartRequest.swift
//  SwiftBoilerPlate
//
//  Created by AKASH BOGHANI on 17/12/23.
//

import Foundation

public struct MultipartRequest {
    // MARK: - Properties
    public let boundary: String
    private let separator: String = "\r\n"
    private var data: Data

    // MARK: - Life cycle
    public init(boundary: String = UUID().uuidString) {
        self.boundary = boundary
        data = .init()
    }

    // MARK: - Functions
    private mutating func appendBoundarySeparator() {
        data.append("--\(boundary)\(separator)")
    }

    private mutating func appendSeparator() {
        data.append(separator)
    }

    private func disposition(_ key: String) -> String {
        "Content-Disposition: form-data; name=\"\(key)\""
    }

    public mutating func add(key: String, value: String) {
        appendBoundarySeparator()
        data.append(disposition(key) + separator)
        appendSeparator()
        data.append(value + separator)
    }

    public mutating func add(key: String, fileName: String, fileMimeType: String, fileData: Data) {
        appendBoundarySeparator()
        data.append(disposition(key) + "; filename=\"\(fileName)\"" + separator)
        data.append("Content-Type: \(fileMimeType)" + separator + separator)
        data.append(fileData)
        appendSeparator()
    }

    public var httpContentTypeHeadeValue: String {
        "multipart/form-data; boundary=\(boundary)"
    }

    public var httpBody: Data {
        var bodyData = data
        bodyData.append("--\(boundary)--")
        return bodyData
    }
}
