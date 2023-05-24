//
//  URLReponseExtension.swift
//  JPMCTest
//
//  Created by Atul Prakash on 24/05/23.
//

import Foundation

extension URLResponse {
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}
