//
//  Response.swift
//  Networking
//
//  Created by Cenker Irmak on 7.03.2021.
//

import Foundation

public class Response<T: Codable>: Codable {

    public let error: ErrorPair
    public let value: T

    public required init(from decoder: Decoder) throws {
        error = try ErrorPair(from: decoder)
        value = try T(from: decoder)
    }
}

public struct ErrorPair: Codable {
    public let code: Int?
    public let message: String?
}

struct AnyResponse: Codable {}
