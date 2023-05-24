//
//  NetworkConstants.swift
//  JPMCTest
//
//  Created by Atul Prakash on 24/05/23.
//

import Foundation

public enum APIError: Error {
    case BadURL
    case NoData
    case DecodingError
    case NoInternetConnection
    case BadToken
    case unAuthenticated
}

enum RequestType: String {
    case get = "GET"
    case post = "POST"
}

