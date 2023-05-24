//
//  APIHandler.swift
//  SwapiPlanets
//
//  Created by Atul Prakash on 24/05/23.
//

import Foundation

protocol APIHandlerDelegate {
    func fetchData(url: URL, completion: @escaping(Result<Data, APIError>) -> Void)
}

class APIHandler: APIHandlerDelegate {
    func fetchData(url: URL, completion: @escaping(Result<Data, APIError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            DataValidator().validateData(data: data, response: response, error: error, completion: completion)
        }.resume()
    }
}
