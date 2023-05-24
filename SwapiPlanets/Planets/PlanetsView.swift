//
//  PlanetsView.swift
//  SwapiPlanets
//
//  Created by Atul Prakash on 24/05/23.
//

import Foundation
import SwiftUI

// Used Swift UI so to avoid time on UI rendering. Using the live view benefit
struct PlanetsView: View {
    @StateObject var viewModel = PlanetsViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.planets, id: \.self) { planet in
                    Text(planet.name)
                        .bold()
                }
            }
            .navigationTitle("Planets")
            .onAppear{
                viewModel.getPlanets()
            }
        }
    }
}

struct PlanetsView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsView()
    }
}
