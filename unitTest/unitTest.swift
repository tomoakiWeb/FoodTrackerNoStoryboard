//
//  unitTest.swift
//  unitTest
//
//  Created by 三浦　知明 on 2020/01/03.
//  Copyright © 2020 三浦　知明. All rights reserved.
//

import XCTest
@testable import deleteStoryboard

class unitTest: XCTestCase {
    
    //有効なパラメーターを渡した時
    func testMealInitializationSucceeds() {
        let zeroRatingMeal = Meal(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        let positiveRatingMeal = Meal(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    //失敗する場合
    func testMealInitializationFails() {
        let negativeRatingMeal = Meal(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        let largeRatingMeal = Meal(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
        
        let emptyStringMeal = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
    }

}
