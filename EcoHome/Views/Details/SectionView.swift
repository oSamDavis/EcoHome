//
//  SectionView.swift
//  EcoHome
//
//  Created by Sam Davis Omekara  on 9/15/22.
//

import SwiftUI

struct SectionView: View {
    var section: Section
    var body: some View {
        ScrollView {
            Image(section.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
           
            if section.name == "Energy" {
                EnergyView()
            }
            else if section.name == "Water" {
                WaterView()
            }
            else{
                WasteView()
            }
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}





struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(section: Section.all[1])
    }
}
