//
//  BookDetailView.swift
//  Stories
//
//  Created by Pinar Olguc on 15.09.2023.
//

import SwiftUI

struct BookDetailView: View {
    enum Constants {
        static let pictureSize: CGFloat = 150
        static let padding: CGFloat = 20
    }
    var book: Book
    var tags: String {
        var result = ""
        for tag in book.tags {
            result += "#\(tag) "
        }
        return result
    }
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    AsyncImage(url: book.poster.url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.white, lineWidth: 4)
                            }
                            .shadow(radius: 10)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: Constants.pictureSize,
                               height: Constants.pictureSize)
                    }.padding(Constants.padding)
                    
                    VStack {
                        Text(book.title)
                            .font(.title)
                        Spacer()
                        Text("Author: \(book.author)")
                            .font(.subheadline)
                        
                        Text("Illustrator: \(book.illustrator)")
                            .font(.subheadline)
                        
                        Text("Age: \(book.interestAge.min)-\(book.interestAge.max)")
                            .font(.subheadline)
                        Spacer()
                        Text(tags)
                            .multilineTextAlignment(.center)
                            .font(.subheadline)
                            .foregroundColor(.accentColor)
                    }.padding(Constants.padding)

                    Text(book.description)
                        .padding(Constants.padding)
                        .font(.body)
                
            }
            .ignoresSafeArea()
            .background(book.color)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(book.color, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct StoryDetail_Previews: PreviewProvider {
    static var books = ModelData().books

    static var previews: some View {
        BookDetailView(book: books[0])
    }
}
