//
//  DataParserTests.swift
//  StoriesTests
//
//  Created by Pinar Olguc on 1.09.2023.
//

import XCTest
@testable import Stories

final class DataParserTests: XCTestCase {

    func testBooksParsing() throws {
        let books = DataParser.books
        XCTAssertEqual(books.count, 10)
    }

}
