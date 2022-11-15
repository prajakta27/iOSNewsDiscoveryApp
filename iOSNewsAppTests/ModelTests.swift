//
//  ModelTests.swift
//  iOSNewsAppTests
//
//  Created by Prajakta Kiran Patil on 15/11/22.
//

import XCTest
@testable import iOSNewsApp

class ModelTests: XCTestCase {

    var sut : NewsViewModel?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = NewsViewModel.init()
    }

    
    func testCallService() {
        
        sut?.articleLoaded  = { [weak self] (_, success) in
            if success {
                XCTAssertNotNil(self?.sut?.article, "Article list is nil")
            } else {
                
            }
        }
        sut?.callService()
        
    }
    
    func testSelectCountry() {
        
        sut?.select(.canada)
        let savedCountry = UserDefaultsConfig.savedCountry
        XCTAssertEqual(savedCountry, CountryEnum.canada, "Country is not same")
        
    }
    
    func testNumberOfArticleRows() {
        
        let numberOfRows = sut?.numberOrRows()
        let numberOfArticles = sut?.article?.count
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            XCTAssertEqual(numberOfRows, numberOfArticles, "number of rows not same")
        }
    
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

}
