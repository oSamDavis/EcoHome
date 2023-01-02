//
//  WaterAreaCard.swift
//  EcoHome
//
//  Created by Sam Davis Omekara  on 9/23/22.
//

import SwiftUI

struct WaterAreaCard: View {
    
    @State private var isOn = false
    var name: String
    var image: String
    @State private var numberToTemp = 40;
    var number: Int
    
    var body: some View {
        VStack {
            HStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 70)
                Spacer()
            }
            Spacer()
            
            HStack {
                VStack {
                    Text(name)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 30))
                        .bold()
                    .padding(.horizontal)
                }
                Spacer()
            }
            
            VStack{
                Text("Temperature")
                    .font(.system(size: 15))
                    .padding(.horizontal)
                    .foregroundColor(.gray)
                HStack{
                    Button(action: {numberToTemp -= 1}) {
                        Image(systemName: "minus")
                            .foregroundColor(.gray)
                    }
                    Text("\(number + numberToTemp)°F")
                        .foregroundColor(.gray)
                    Button(action: {numberToTemp += 1}) {
                        Image(systemName: "plus")
                            .foregroundColor(.gray)
                    }
                }
                
            }
            
            Spacer()
            
            HStack{
                let text = self.isOn ? "On" : "Off"
                Text(text)
                    .font(.system(size: 20))
                    .padding(.horizontal)
                Toggle("", isOn: $isOn)
                    .tint(.blue)
                    .padding(.horizontal)
                    .padding(.vertical, 20)
            }
            

        }
        .frame(width: 200, height: 243, alignment: .top)
        .background(.mint)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y:10)
    }
}


struct WaterAreaCard_Previews: PreviewProvider {
    static var previews: some View {
        WaterAreaCard(name: "Shower", image: "Shower-Icon", number: 10)
    }
}
