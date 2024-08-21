//
//  TestingSampleTests.swift
//  TestingSampleTests
//
//  Created by Kunal Kumar R on 14/08/24.
//

import XCTest
@testable import TestingSample

final class TestingSampleTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAllWordsLoaded() {
        let playData = PlayData()
        //        XCTAssertEqual(playData.allWords.count, 384001, "all words was not 384001")
        //        XCTAssertEqual(playData.allWords.count, 18440, "All words was not 18440")
        XCTAssertEqual(playData.wordCounts.count(for: "whisper"), 17, "Whisper was not used 17 times")
        XCTAssertEqual(playData.wordCounts.count(for: "others"), 59, "others was not used 59 times")
    }
     
    // Performance Test
    func testWordsLoadQuickly() {
        measure {
            _ = PlayData()
        }
    }
    
    // User Filter tests
    func testUserFilterWorks() {
        let playData = PlayData()
        
        playData.applyUserFilter("100")
        XCTAssertEqual(playData.filteredWords.count, 495, "There are more words that has 100 counts")
        
        playData.applyUserFilter("1000")
        XCTAssertEqual(playData.filteredWords.count, 55, "There are more words that has 1000 counts")
        
        playData.applyUserFilter("10000")
        XCTAssertEqual(playData.filteredWords.count, 1, "There are more words that has 10000 counts")
        
        playData.applyUserFilter("test")
        XCTAssertEqual(playData.filteredWords.count, 56, "test has occurred more or less than 56")
        
        playData.applyUserFilter("swift")
        XCTAssertEqual(playData.filteredWords.count, 7, "swift has occurred more or less than 7")
        
        playData.applyUserFilter("objective-c")
        XCTAssertEqual(playData.filteredWords.count, 0, "objective-c has occurred somewhere")
    }
}
