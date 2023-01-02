//
//  SectionModel.swift
//  EcoHome
//
//  Created by Sam Davis Omekara  on 9/13/22.
//

import Foundation

struct Section: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}

extension Section {
    
    static let all: [Section] = [
    Section(name: "Waste", image: "Waste-Section"),
    Section(name: "Water", image: "Water-Section"),
    Section(name: "Energy", image: "Energy-Section")]
}
