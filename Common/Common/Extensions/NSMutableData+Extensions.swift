//
//  NSMutableData+Extensions.swift
//  Networking
//
//  Created by Cenker Irmak on 4.03.2021.
//

import Foundation

public extension NSMutableData {
    
    func appendString(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
    
}
