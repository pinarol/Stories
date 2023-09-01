//
//  CategoryRow.swift
//  Stories
//
//  Created by Pinar Olguc on 1.09.2023.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Book]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { book in
                        NavigationLink {
                          // TODO: Go to book details
                        } label: {
                            BookItem(book: book)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {

    static var books = ModelData().books
    static var bookCategories = ModelData().bookCategories
    static var categories = ModelData().categories

    static var previews: some View {
        CategoryRow(
            categoryName: categories[0],
            items: bookCategories[categories[0]] ?? Array(books.prefix(3))
        )
    }}
