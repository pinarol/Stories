//
//  BookItem.swift
//  Stories
//
//  Created by Pinar Olguc on 1.09.2023.
//

import SwiftUI

struct BookItem: View {
    var book: Book
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: book.poster.url) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .clipped()
            .frame(width: 155, height: 155)
            .cornerRadius(5)
            HStack {
                Text(book.title)
                    .foregroundColor(.primary)
                    .font(.caption)
                Spacer()
                if book.isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            .frame(maxWidth: 155, alignment: .leading)
        }
        .padding(.leading, 15)
    }
}

struct BookItem_Previews: PreviewProvider {
    static var previews: some View {
        BookItem(book: ModelData().books[0])
    }
}
