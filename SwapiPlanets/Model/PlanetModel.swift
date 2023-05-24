//
//  PlanetModel.swift
//  SwapiPlanets
//
//  Created by Atul Prakash on 24/05/23.
//

import Foundation

// Codable helps to map the value. Codable is higher level of function which combined decodable and encodable feature
// Hashable is required to support ForEach struct which is used to iterate through the values
struct Planets: Codable, Hashable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PlanetList]
}

struct PlanetList: Codable, Hashable {
    let name: String
    let rotation_period: String
    let orbital_period: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surface_water: String
    let population: String
    let residents: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
}
