//
//  HomeView.swift
//  EcoHome
//
//  Created by Sam Davis Omekara  on 9/13/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                ProfileBarView().padding()
                SectionList(sections: Section.all)
            }
                .navigationTitle("Eco Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
