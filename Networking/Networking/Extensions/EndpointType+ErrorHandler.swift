//
//  EndpointType+ErrorHandler.swift
//  Networking
//
//  Created by Cenker Irmak on 7.03.2021.
//

import Foundation
import Common

public typealias NetworkErrorHandler  = ((NetworkingError) -> Void)

public typealias ExpectedErrorHandler  = (errorCodes: [Int]?,
                                          handler: ((NetworkingError) -> Void)?)

extension EndpointType {
    
    func handleFailure(error: NetworkingError) {
        print("There is a networking error in here")
    }
    
}
