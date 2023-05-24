//
//  NetworkManager.swift
//  SwapiPlanets
//
//  Created by Atul Prakash on 24/05/23.
//

import Foundation

class NetworkManager {
    let aPIHandler: APIHandlerDelegate
    let responseHandler: ResponseHandlerDelegate
    
    init(aPIHandler: APIHandlerDelegate = APIHandler(),
         responseHandler: ResponseHandlerDelegate = ResponseHandler()) {
        self.aPIHandler = aPIHandler
        self.responseHandler = responseHandler
    }
    
    func getRequest<T: Codable>(type: T.Type, url: URL, completion: @escaping(Result<T, APIError>) -> Void) {
        if !ConnectionManager.shared.hasConnectivity {
            completion(.failure(.NoInternetConnection))
        }
        aPIHandler.fetchData(url: url) { result in
            switch result {
            case .success(let data):
                self.responseHandler.fetchModel(type: type, data: data) { decodedResult in
                    switch decodedResult {
                    case .success(let model):
                        completion(.success(model))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
