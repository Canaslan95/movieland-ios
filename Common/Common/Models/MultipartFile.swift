//
//  MultipartFile.swift
//  Common
//
//  Created by Cenker Irmak on 7.03.2021.
//

import Foundation

public struct MultipartFile: Codable {
    public let fileName: String?
    public let mimeType: MimeType
    public let data: Data?
    
    public init(fileName: String?, mimeType: MimeType, data: Data?) {
        self.fileName = fileName
        self.mimeType = mimeType
        self.data = data
    }
    
}
