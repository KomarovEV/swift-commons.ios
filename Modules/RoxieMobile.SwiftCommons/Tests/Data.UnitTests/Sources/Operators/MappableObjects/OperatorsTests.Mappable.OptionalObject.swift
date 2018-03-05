// ----------------------------------------------------------------------------
//
//  OperatorsTests.Mappable.OptionalObject.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests
    
    func testOptionalMappableObjectsToJSON() {

        var object: ValidMappableObjectModel? = ValidMappableObjectModel()
        var map = Map(mappingType: .toJSON, JSON: [:])
        object >>> map["object"]
        let someDictionary = map.JSON["object"]! as! [String : Bool]
        let bool = someDictionary["bool"]!
        
        /// Positive results
        XCTAssertEqual(object?.bool, bool)
        
        /// Negative results
        let someDateTime: NotValidMappableObjectModel? = NotValidMappableObjectModel(map: map)
        guardNegativeException { someDateTime >>> map ["some"] }
    }
    
    func testOptionalMappableObjectsFromJSON() {
        
        let JSONString = ["object": ["bool" : true,
                                     "boolOpt" : true,
                                     "boolImp" : true]
                            ]
        let notBoolValueJson = ["object": ["bool": "notBoolValue"]]
        let mapSet = Map(mappingType: .fromJSON, JSON: [:])
        let map = Map(mappingType: .fromJSON, JSON: JSONString)
        map.JSON["noValue"] = nil
        let mapNotBoolValue = Map(mappingType: .toJSON, JSON: notBoolValueJson)
        var object: ValidMappableObjectModel? = ValidMappableObjectModel(map: mapSet)
        object <~ map["object"]
        print(object?.bool)
        let bool = object?.bool
        
        /// Positive results
        XCTAssertTrue(bool!)

        /// Negative results
        object <~ mapNotBoolValue["object"]
        XCTAssertTrue((object?.boolOpt)!)
        object <~ map["noSuchKey"]
        XCTAssertNil(object?.boolOpt)
        object <~ map["noValue"]
        XCTAssertNil(object?.boolOpt)
    }
    
}

// ----------------------------------------------------------------------------
