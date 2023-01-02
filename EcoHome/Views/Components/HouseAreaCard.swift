//
//  HouseAreaCard.swift
//  EcoHome
//
//  Created by Sam Davis Omekara  on 9/21/22.
//

import SwiftUI

struct HouseAreaCard: View {
    
    @State private var isOn = false
    var name: String
    var number: Int
    var image: String
  
    var body: some View {
        VStack() {
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
                        .font(.system(size: 30))
                        .bold()
                    .padding(.horizontal)
                }
                Spacer()
            }
            
            HStack {
                Text("\(number) sensors")
                    .font(.system(size: 15))
                    .padding(.horizontal)
                    .foregroundColor(.gray)
                Spacer()
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
        .frame(width: 190, height: 243, alignment: .top)
        .background(.mint)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y:10)
    }
}

struct HouseAreaCard_Previews: PreviewProvider {
    static var previews: some View {
        HouseAreaCard(name: "Lights", number: 5 , image: "Bulb-Icon" )
    }
}






//VStack {
//    Text("Hello House Card")
//
//
//}
//.frame(width: 200, height: 243, alignment: .top)
//.background(.blue)
//.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//.shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y:10)
//}
