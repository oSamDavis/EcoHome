//
//  ProfileBarView.swift
//  EcoHome
//
//  Created by Sam Davis Omekara  on 9/16/22.
//

import SwiftUI

struct ProfileBarView: View {
    var body: some View {
        HStack{
            VStack{
                Text("Lisa's EcoHome")
                    .font(.title)
                    .padding(.horizontal)
                Text("Welcome back, be great")
                    .font(.headline)
            }
            Spacer()

            Image("Profile-Pic")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 10)
                .foregroundColor(.gray.opacity(0.7))
        }
    }
}

struct ProfileBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileBarView()
    }
}
