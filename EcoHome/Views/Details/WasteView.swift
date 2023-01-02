//
//  WasteView.swift
//  EcoHome
//
//  Created by Sam Davis Omekara  on 9/18/22.
//

import SwiftUI

struct WasteView: View {
    var body: some View {
        VStack(spacing: 15) {
            Image("WasteIcon")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)

            WasteCarousel()
            
        }
    }
}

struct WasteView_Previews: PreviewProvider {
    static var previews: some View {
        WasteView()
    }
}
