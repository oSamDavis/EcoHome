//
//  EnergySegView.swift
//  EcoHome
//
//  Created by Sam Davis Omekara  on 9/21/22.
//

import SwiftUI

struct EnergySegView: View {
    
    
    @State private var selectedARea: HouseArea = .LivingRoom
    
    var body: some View {
            VStack{
                Picker("Energy", selection: self.$selectedARea){
                    ForEach(HouseArea.allCases, id:\.self){
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .onAppear{
                    UISegmentedControl.appearance().selectedSegmentTintColor = .systemTeal
                    UISegmentedControl.appearance().backgroundColor = UIColor.white
                    
                }
                .padding()
                ChosenHouseAreaView(selectedHouseArea: selectedARea)
                Spacer()
            }
    }
}

enum HouseArea: String, CaseIterable{
    case LivingRoom = "Living-Room"
    case Kitchen = "Kitchen"
    case Bedroom1 = "Bedroom1"
    case Bathroom1 = "Bathroom1"
}

struct ChosenHouseAreaView: View {

    var selectedHouseArea: HouseArea
    
    var body: some View{
        switch selectedHouseArea{
        case .LivingRoom:
            HouseAreaView(houseAreaName: "LivingRoom")
        case .Kitchen:
            HouseAreaView(houseAreaName: "Kitchen")
        case .Bedroom1:
            HouseAreaView(houseAreaName: "Bedroom1")
        case .Bathroom1:
            HouseAreaView(houseAreaName: "Bathroom1")
        }
    }
}


struct EnergyAreaType : Identifiable, Hashable {
    var id: Int
    var name: String
    var number: Int
    var status: String
    var image: String
}

let energyAreadata = [
    EnergyAreaType(id: 0, name: "Lights", number:5, status: "On", image:"Bulb-Icon"),
    EnergyAreaType(id: 1, name: "Outlets", number:3, status: "Off", image:"Outlet-Icon"),
//    EnergyAreaType(id: 0, name: "Air Control", number:4, status: "100", image:"Bathroom1"),
]

struct HouseAreaView: View {
    var houseAreaName: String
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 20)], spacing: 20) {
            ForEach(energyAreadata, id: \.self) { i in
                HouseAreaCard(name: i.name, number:i.number, image:i.image)
                }
                .frame(width: 176, height: 237, alignment: .top)
                .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y:10)
            // For Addition
            Button(action:{
                //code
                
            }) {
                VStack() {
                    Spacer()
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.black)
                    Spacer()

                }
                .frame(width: 200, height: 243, alignment: .top)
                .background(.teal)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y:10)
                    .frame(width: 186, height: 237, alignment: .top)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y:10)
            }
            }
        .padding()
        }
        

}


struct EnergySegView_Previews: PreviewProvider {
    static var previews: some View {
        EnergySegView()
    }
}
