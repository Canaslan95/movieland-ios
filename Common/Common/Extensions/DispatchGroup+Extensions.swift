//
//  DispatchGroup+Extensions.swift
//  Common
//
//  Created by Cenker Irmak on 7.03.2021.
//

import Foundation

import Foundation

public extension DispatchGroup {

    func executeRequests(_ executables: [BoolFunction], completion:  @escaping BoolHandler) {
        var result: Bool = true
        for executable in executables {
            enter()
            executable({ [weak self] success in
                result = result && success
                self?.leave()
            })
        }
        notify(queue: .main) {
            completion(result)
        }
    }

}
