//
//  SectionList.swift
//  EcoHome
//
//  Created by Sam Davis Omekara  on 9/15/22.
//

import SwiftUI

struct SectionList: View {
    var sections: [Section]
    var body: some View {
        VStack(spacing: 30){
            ForEach(sections) { section in
                NavigationLink(destination: SectionView(section: section)){
                    SectionCard(section: section)
                }
            }
        }
        }
}


struct SectionList_Previews: PreviewProvider {
    static var previews: some View {
        SectionList(sections: Section.all)
    }
}
