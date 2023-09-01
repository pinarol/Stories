//
//  Book.swift
//  Stories
//
//  Created by Pinar Olguc on 1.09.2023.
//

import Foundation
import SwiftUI

struct Book: Codable, Identifiable {
    
    struct InterestAge: Codable {
        let min: Int
        let max: Int
        
        static func defaultInterestAge() -> InterestAge {
            return InterestAge(min: 0, max: 5)
        }
    }
    
    struct Image: Codable  {
        let url: URL
    }
    
    let title: String
    let tags: [String]
    let author: String
    let illustrator: String
    let publisher: String
    let id: Int
    let isFeatured: Bool
    let isFavorite: Bool
    let interestAge: InterestAge
    let description: String
    let poster: Image
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.id == rhs.id
    }
}
