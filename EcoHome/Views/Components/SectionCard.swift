//
//  SectionCard.swift
//  EcoHome
//
//  Created by Sam Davis Omekara  on 9/13/22.
//

import SwiftUI

struct SectionCard: View {
    var section: Section
    
    var body: some View {
        VStack {
            Image(section.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 147)
                .overlay(alignment: .bottom) {
                    HStack {
                        Text(section.name)
                            .font(.title)
                            .foregroundColor(.black)
                            .shadow(color: .gray, radius: 3, x: 0, y:0)
                            .frame(maxWidth:136)
                        .padding()
                        
                        Spacer()
                    }
            }
            
        }
        .frame(width: 360, height: 147, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y:10)
    }
    }


struct SectionCard_Previews: PreviewProvider {
    static var previews: some View {
        SectionCard(section: Section.all[2])
    }
}
