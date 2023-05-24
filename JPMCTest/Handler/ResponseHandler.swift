//
//  ResponseHandler.swift
//  JPMCTest
//
//  Created by Atul Prakash on 24/05/23.
//

import Foundation

protocol ResponseHandlerDelegate {
    func fetchModel<T: Codable>(type: T.Type, data: Data, completion: (Result<T, APIError>) -> Void)
}

class ResponseHandler: ResponseHandlerDelegate {
    func fetchModel<T: Codable>(type: T.Type, data: Data, completion: (Result<T, APIError>) -> Void) {
        let response = try? JSONDecoder().decode(type.self, from: data)
        if let jsonResponse = response {
            return completion(.success(jsonResponse))
        } else {
            completion(.failure(.DecodingError))
        }
    }
}
