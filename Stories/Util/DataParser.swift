//
//  DataParser.swift
//  Stories
//
//  Created by Pinar Olguc on 1.09.2023.
//

import Foundation
import Combine


final class ModelData: ObservableObject {
    @Published var books: [Book] = DataParser.books
    var categories: [String] = ["Feelings", "Bedtime", "Friendship", "Family"]
    var bookCategories: [String: [Book]] {
        Dictionary(
            grouping: books,
            by: { value in
                for category in categories {
                    if value.tags.contains(category) {
                        return category
                    }
                }
                return "other"
            }
        )
    }
    var featuredBooks: [Book] {
        books.filter { $0.isFeatured }
    }
}

class DataParser {
    
    static var books: [Book] { DataParser.load("books.json") }
    
    static func load<T: Decodable>(_ filename: String) -> T {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}
