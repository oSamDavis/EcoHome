//
//  ProfileView.swift
//  EcoHome
//
//  Created by Sam Davis Omekara  on 9/13/22.
//

import SwiftUI

struct ProfileView: View {
    let images = ["Living-Room", "Bathroom1", "Kitchen", "Bedroom1", "Bathroom2", "Bedroom2"]
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    HStack(spacing: -30) {
                        Image("Profile-Pic")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 130, height: 130)
                                .clipShape(Circle())
                                .padding()
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size:33))
                            .foregroundColor(.green)
                        Spacer()
                        
                        VStack {
                            Text("Lisa's EcoHome")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("123 W 20th Ave, Fremont, NY.")
                                .font(.system(size:15))
                                .fontWeight(.light)
                                .foregroundColor(.gray)
                           
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    

                    HStack {
                        VStack(spacing: 0) {
                            Text("300")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("Waste Day Saved")
                                .font(.system(size: 15))
                                .fontWeight(.light)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        VStack(spacing: 0) {
                            Text("500")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("Litres Saved")
                                .font(.system(size: 15))
                                .fontWeight(.light)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        VStack(spacing: 0) {
                            Text("600")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("Watts Saved")
                                .font(.system(size: 15))
                                .fontWeight(.light)
                                .foregroundColor(.gray)
                        }

                    }
                    
                
                    HStack {
                        // Insert like a horizontal rule
                        Image(systemName: "house.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30 )
                            .foregroundColor(.green)
                        Text("Eco Zones")
                            .font(.title)
                        .fontWeight(.bold)
                    }
                    
                
                

                }
                .frame(maxWidth: .infinity,  maxHeight: .infinity, alignment: .leading)
                

                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                    ForEach(images, id: \.self) { image in
                        VStack {
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                . overlay(alignment: .bottom) {
                                Text(image)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius: 3, x: 0, y:0)
                                    .frame(maxWidth:136)
                                    .padding()
                            }
                        }
                        .frame(width: 160, height: 237, alignment: .top)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y:10)
                        
                        

                    }
                }
                
                .padding(.top)
            }
                
            }
        .padding()
                .navigationTitle("Profile")
        }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
