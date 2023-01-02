//
//  WaterSegView.swift
//  EcoHome
//
//  Created by Sam Davis Omekara  on 9/23/22.
//

import SwiftUI

struct WaterSegView: View {
    @State private var selectedARea: WaterArea = .MasterBathroom
    
    var body: some View {
            VStack{
                Picker("Energy", selection: self.$selectedARea){
                    ForEach(WaterArea.allCases, id:\.self){
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .onAppear{
                    UISegmentedControl.appearance().selectedSegmentTintColor = .systemTeal
                    UISegmentedControl.appearance().backgroundColor = UIColor.white
                    
                }
                .padding()
                ChosenWaterArea(selectedWaterArea: selectedARea)
                Spacer()
            }
 
    }

}

enum WaterArea: String, CaseIterable{
    case MasterBathroom = "Master-Bathroom"
    case Kitchen = "Kitchen"
    case Bathroom2 = "Bathroom2"
}

struct ChosenWaterArea: View {
    
    var selectedWaterArea: WaterArea
    
    var body: some View{
        switch selectedWaterArea{
        case .MasterBathroom:
            WaterAreaView(waterAreaName: "Master-Bathroom")
        case .Kitchen:
            WaterAreaView(waterAreaName: "Kitchen")
        case .Bathroom2:
            WaterAreaView(waterAreaName: "Bathroom2")
        }
        
    }
}

struct WaterAreaType : Identifiable, Hashable {
    var id: Int
    var name: String
    var number: Int
    var image: String
}

let waterAreadata = [
    WaterAreaType(id: 0, name: "Shower", number:40, image:"Shower-Icon"),
    WaterAreaType(id: 1, name: "Sink", number:20, image:"Sink-Icon"),
    WaterAreaType(id: 2, name: "Tub Faucet", number:30, image:"Tub-Icon"),
]


struct WaterAreaView: View {
    var waterAreaName: String
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 20)], spacing: 20) {
            ForEach(waterAreadata, id: \.self) { i in
                WaterAreaCard(name: i.name, image:i.image, number:i.number)
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

struct WaterSegView_Previews: PreviewProvider {
    static var previews: some View {
        WaterSegView()
    }
}
