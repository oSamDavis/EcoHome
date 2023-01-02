//
//  WaterView.swift
//  EcoHome
//
//  Created by Sam Davis Omekara  on 9/18/22.
//

import SwiftUI

struct WaterView: View {
    var body: some View {
        VStack(spacing: 15){
            Image("Water-Icon")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Image("Water-Graph")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .padding(.vertical, 40)
                .padding(.horizontal)
            
            WaterSegView()
            
        }
        
        
    }
}

struct WaterView_Previews: PreviewProvider {
    static var previews: some View {
        WaterView()
    }
}
