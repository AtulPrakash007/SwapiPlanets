//
//  DataController.swift
//  JPMCTest
//
//  Created by Atul Prakash on 24/05/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "PlanetsModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load offline data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Saved!! Cheers")
        } catch let error as NSError {
            print("Data not saved... Error!!! \n \(error) \(error.userInfo)")
        }
    }
    
    func addPlanets(planets: [PlanetList]) {
        let context = container.viewContext
        for item in (planets){
            let planet = Planet(context: context)
            planet.name = item.name
            planet.rotation_period = item.rotation_period
            planet.orbital_period = item.orbital_period
            planet.diameter = item.diameter
            planet.climate = item.climate
            planet.gravity = item.gravity
            planet.terrain = item.terrain
            planet.surface_water = item.surface_water
            planet.population = item.population
            planet.residents = item.residents
            planet.films = item.films
            planet.created = item.created
            planet.edited = item.edited
            planet.url = item.url
            
            save(context: context)
        }
    }
    
    func deleteAllData(entity: String = "Planet") {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        let context = container.viewContext
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
            save(context: context)
        } catch let error as NSError {
            print("Delete all data in \(entity) error : \(error) \(error.userInfo)")
        }
    }
    
    func fetchPlanetsFromCoredata() -> [Planet] {
        let fetchRequest = NSFetchRequest<Planet>(entityName: "Planet")
        let context = container.viewContext
        do {
            let list = try context.fetch(fetchRequest)
            return list
        } catch {
            print("Unable to fetch from Coredata", error)
        }
        return []
    }
}
