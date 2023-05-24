//
//  PlanetsViewModel.swift
//  SwapiPlanets
//
//  Created by Atul Prakash on 24/05/23.
//

import Foundation
import CoreData

// View model to perform business logics of view
// Class confirms to ObservableObject protocol, so it will notify for the changes in property

class PlanetsViewModel: ObservableObject {
    // In case of change in planets the view will get reloaded automatically hence property wrapper Published has been used. this will be useful on pagination
    @Published var planets: [PlanetList] = []
    private var dataController = DataController()

    // Method to fetch planet list
    // Defualt parameter is passed for the first page. if pagination then the planets next value will be passed here
    private func fetchPlanets(url: String) {
        guard let url = URL(string: url) else {
            return
        }
        
        NetworkManager().getRequest(type: Planets.self, url: url) { [weak self] result in
            switch result {
            case .success(let planets):
                print("Fetched Planets \(planets.results.count)")
                self?.saveData(planets: planets.results)
                // On pagination append the value
            case .failure(let error):
                self?.planets.removeAll()
                print(error)
            }
        }
    }
    
    private func saveData(planets: [PlanetList]) {
        // Publishing changes from background threads is not allowed
        DispatchQueue.main.async {
            self.planets = planets
        }
        dataController.deleteAllData()
        dataController.addPlanets(planets: planets)
    }
    
    func getPlanets(url: String = WebService.planetURL, connected: Bool = ConnectionManager.shared.hasConnectivity) {
        if connected {
            self.fetchPlanets(url: url)
        } else {
            let planet = dataController.fetchPlanetsFromCoredata()
            self.appendInfoFechedFromDB(planet: planet)
        }
    }
    
    private func appendInfoFechedFromDB(planet: [Planet]) {
        for item in planet {
            let planetList = PlanetList(name: item.name ?? "",
                                        rotation_period: item.rotation_period ?? "",
                                        orbital_period: item.orbital_period ?? "",
                                        diameter: item.diameter ?? "",
                                        climate: item.climate ?? "",
                                        gravity: item.gravity ?? "",
                                        terrain: item.terrain ?? "",
                                        surface_water: item.surface_water ?? "",
                                        population: item.population ?? "",
                                        residents: item.residents ?? [],
                                        films: item.films ?? [],
                                        created: item.created ?? "",
                                        edited: item.edited ?? "",
                                        url: item.url ?? "")
            self.planets.append(planetList)
        }
    }
}
