//
//  EndpointType+Retrieve.swift
//  Networking
//
//  Created by Cenker Irmak on 7.03.2021.
//

import Foundation
import Common

public extension EndpointType {
    
    func retrieve<T: Codable>(_ success: @escaping (T) -> Void,
                              failure: NetworkErrorHandler? = nil,
                              dispatcher: BoolHandler? = nil) {
        let router = NetworkRouter<Self>()
        router.request(self) { (response: Result<Response<T>, NetworkingError>) in
            switch response {
            case .success(let model):
                handleSuccess(success,
                              model: model,
                              shouldExecuteCustomFailure: shouldExecuteCustomFailure(failure: failure),
                              failure: failure,
                              dispatcher: dispatcher)
            case .failure(let error):
                handleFailure(error, failure: failure, dispatcher: dispatcher)
            }
        }
    }
    
    private func handleSuccess<T>(_ success: @escaping (T) -> Void,
                                  model: Response<T>,
                                  shouldExecuteCustomFailure: DeciderFunction,
                                  failure: NetworkErrorHandler?,
                                  dispatcher: BoolHandler?) {
        success(model.value)
        dispatcher?(true)
    }
    
    private func handleFailure(_ error: NetworkingError,
                               failure: NetworkErrorHandler?,
                               dispatcher: BoolHandler?) {
        if case NetworkingError.authentication = error {
            self.handleFailure(error: error)
            return
        }
        if let failure = failure {
            failure(error)
            dispatcher?(false)
            return
        }
        dispatcher?(false)
        self.handleFailure(error: error)
    }
    
    private func shouldExecuteCustomFailure(failure: NetworkErrorHandler?) -> DeciderFunction {
        return {
            return failure != nil
        }
    }
    
    private func shouldExecuteExpectedFailure(expectedErrorCodes: [Int]?, for error: ErrorPair) -> DeciderFunction {
        return {
            guard let expected = expectedErrorCodes else { return true }
            guard let errorCode = error.code else { return false }
            return expected.contains(errorCode)
        }
    }


}
