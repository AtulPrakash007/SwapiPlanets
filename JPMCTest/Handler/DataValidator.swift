//
//  DataValidator.swift
//  JPMCTest
//
//  Created by Atul Prakash on 24/05/23.
//

import Foundation

protocol DataValidatorDelegate {
    func validateData(data: Data?, response: URLResponse?, error: Error?, completion: @escaping(Result<Data, APIError>) -> Void)
}

class DataValidator: DataValidatorDelegate {
    func validateData(data: Data?, response: URLResponse?, error: Error?, completion: @escaping (Result<Data, APIError>) -> Void) {
        guard let statusCode = response?.getStatusCode(), statusCode != 401 else {
            return completion(.failure(.BadToken))
        }
        
        guard let data = data, error == nil else {
            return completion(.failure(.NoData))
        }
        
        completion(.success(data))
    }
}
