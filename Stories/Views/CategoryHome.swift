//
//  CategoryHome.swift
//  Stories
//
//  Created by Pinar Olguc on 1.09.2023.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                AsyncImage(url: modelData.featuredBooks[0].poster.url) { image in
                    image.resizable()
                    image.scaledToFill()
                    image.clipped()
                    image.listRowInsets(EdgeInsets())
                } placeholder: {
                    ProgressView()
                }
                .frame(maxHeight: 200)
                .clipped()
                
                ForEach(modelData.bookCategories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.bookCategories[key]!)
                        .listRowSeparator(.hidden)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Stories for Kids")

        }.listRowInsets(EdgeInsets())
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
