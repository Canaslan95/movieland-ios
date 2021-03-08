//
//  MimeType.swift
//  Common
//
//  Created by Cenker Irmak on 7.03.2021.
//

import Foundation

public enum MimeType: String, Codable {
    case jpg = "image/jpg"
    
    public var fileExtension: String {
        switch self {
        case .jpg:
            return ".jpg"
        }
    }
}
