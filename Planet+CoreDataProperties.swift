//
//  Planet+CoreDataProperties.swift
//  JPMCTest
//
//  Created by Atul Prakash on 24/05/23.
//
//

import Foundation
import CoreData


extension Planet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Planet> {
        return NSFetchRequest<Planet>(entityName: "Planet")
    }

    @NSManaged public var name: String?
    @NSManaged public var rotation_period: String?
    @NSManaged public var orbital_period: String?
    @NSManaged public var diameter: String?
    @NSManaged public var climate: String?
    @NSManaged public var gravity: String?
    @NSManaged public var terrain: String?
    @NSManaged public var surface_water: String?
    @NSManaged public var population: String?
    @NSManaged public var residents: [String]?
    @NSManaged public var films: [String]?
    @NSManaged public var created: String?
    @NSManaged public var edited: String?
    @NSManaged public var url: String?

}

extension Planet : Identifiable {

}

extension Planet: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(rotation_period, forKey: .rotation_period)
        try container.encode(orbital_period, forKey: .orbital_period)
        try container.encode(diameter, forKey: .diameter)
        try container.encode(climate, forKey: .climate)
        try container.encode(gravity, forKey: .gravity)
        try container.encode(terrain, forKey: .terrain)
        try container.encode(surface_water, forKey: .surface_water)
        try container.encode(population, forKey: .population)
        try container.encode(residents, forKey: .residents)
        try container.encode(films, forKey: .films)
        try container.encode(created, forKey: .created)
        try container.encode(edited, forKey: .edited)
        try container.encode(url, forKey: .url)
    }
}

private enum CodingKeys: String, CodingKey {
    case name
    case rotation_period
    case orbital_period
    case diameter
    case climate
    case gravity
    case terrain
    case surface_water
    case population
    case residents
    case films
    case created
    case edited
    case url
}
