//
//  ChuckNorrisJokeAppTests.swift
//  ChuckNorrisJokeAppTests
//
//  Created by HubertMac on 11/10/2023.
//

@testable import ChuckNorrisJokeApp
import XCTest

@MainActor
final class ChuckNorrisJokeAppTests: XCTestCase {
    
    var sut: ContentModel!
    
    override func setUp() {
        sut = ContentModel()
    }
    
    override func tearDown() {
        sut =  nil
    }

    func test_jokeChoosenCategoryChangesArePublished() {
        XCTAssertSendsChangeNotification(sut.choosenCategory = "test", from: sut,
                                         "Changing the value of ContentModel.choosenCategory should trigger a change notification ")
    }
    
    func test_categoriesChangesArePublished() {
        XCTAssertSendsChangeNotification(sut.categories = ["test"], from: sut, "Changing the value of ContentModel.categories should trigger a change notification ")
    }
   
    
    func test_jokeValueChangesArePublished() {
        XCTAssertSendsChangeNotification(sut.jokeValue = "test", from: sut,
                                         "Changing the value of ContentModel.jokeValue should trigger a change notification ")
    }
    
    func test_favoriteJokesChangesArePublished() {
        XCTAssertSendsChangeNotification(sut.favoriteJokes = ["test"], from: sut, "Changing the value of ContentModel.favoriteJokes should trigger a change notification ")
    }
}

func XCTAssertSendsChangeNotification<T, U: ObservableObject>(_ expression: @autoclosure () -> T, from object: U, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line ) {
    
    var changePublished = false
    
    let checker = object.objectWillChange.sink { _ in
        changePublished = true
    }
    _ = checker
    _ = expression()
    
    XCTAssertTrue(changePublished, message(), file: file, line: line)
}
