//
//  EnergyView.swift
//  EcoHome
//
//  Created by Sam Davis Omekara  on 9/18/22.
//

import SwiftUI

struct EnergyView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("Energy-Icon")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            
            Image("Energy-Graph")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .padding(.vertical, 40)
                .padding(.horizontal)
            
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(.white)
                    .shadow(radius: 6)
                VStack {
                    HStack {
                        Text("TOTAL ENERGY CONSUMED IN 2022")
                            .font(.system(size: 13))
                        .foregroundColor(.teal)
                        .padding(.horizontal)
                        .bold()
                        Spacer()
                    }
                    .padding(.vertical, 3)

                    HStack{
                        Text("260.67 kWh")
                            .font(.system(size: 25))
                            .foregroundColor(.green)
                            .bold()
                            .padding(.horizontal)
                        Spacer()
                        Image(systemName: "photo")
                    }
                    .padding(.vertical, 3)

                    
                    HStack {
                        Text("+23.5%")
                            .padding(.horizontal)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.vertical, 3)
      
                }
                

            }
            .padding()
            .frame(height: 100)
            
            EnergySegView()
            
        }
        

    }
}

struct EnergyView_Previews: PreviewProvider {
    static var previews: some View {
        EnergyView()
    }
}
