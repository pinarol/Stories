//
//  CategoryHome.swift
//  Stories
//
//  Created by Pinar Olguc on 1.09.2023.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = true
    
    var categories: [String] = ["Bedtime", "Friendship", "Family", "Feelings", "Christmas"]

    var filteredBooks: [Book] {
        modelData.books.filter { book in
            (!showFavoritesOnly || book.isFavorite)
        }
    }
    
    var bookCategories: [String: [Book]] {
        Dictionary(
            grouping: filteredBooks,
            by: { value in
                for category in categories {
                    if value.tags.contains(category) {
                        return category
                    }
                }
                return "Other"
            }
        )
    }

    var body: some View {
        NavigationView {
            List {
                Image("header")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .listRowInsets(EdgeInsets())
                    .frame(maxHeight: 200)
                    .clipped()
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(bookCategories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: bookCategories[key]!)
                        .listRowSeparator(.hidden)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Stories for Kids")

        }
        .listRowInsets(EdgeInsets())
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
