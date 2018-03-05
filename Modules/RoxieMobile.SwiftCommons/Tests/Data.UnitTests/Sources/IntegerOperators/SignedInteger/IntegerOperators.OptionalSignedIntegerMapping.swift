// ----------------------------------------------------------------------------
//
//  IntegerOperators.OptionalSignedIntegerMapping.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------

extension IntegerOperators
{
// MARK: - Tests

    func testOptionalSignedIntegerMappingFromJSON() {
        let JSONString = ["int8" : 2,
                          "int16" : 4,
                          "int32" : 15,
                          "int64" : 233,
                          "int" : 78,
                          "uInt8" : 2,
                          "uInt16" : 4,
                          "uInt32" : 15,
                          "uInt64" : 233,
                          "uInt" : 78,
                          /*"negUInt" : -1 //Error in ObjectMapper*/]
        let map = Map(mappingType: .fromJSON, JSON: JSONString)
        let map2 = Map(mappingType: .fromJSON, JSON: ["notInt" : "notInt"] )
        map.JSON["noValue"] = nil

        let value8: Int8? = Int8(JSONString["int8"]!)
        var int8Value: Int8? = 0
        int8Value <~ map["int8"]
        XCTAssertEqual(int8Value, value8)
        // Negative
        int8Value <~ map["NoSuchKey"]
        XCTAssertEqual(int8Value, nil)
        int8Value <~ map["noValue"]
        XCTAssertEqual(int8Value, nil)
        guardNegativeException { int8Value <~ map2["notInt"] }

        let value16: Int16? = Int16(JSONString["int16"]!)
        var int16Value: Int16? = 0
        int16Value <~ map["int16"]
        XCTAssertEqual(int16Value, value16)
        // Negative
        int16Value <~ map["NoSuchKey"]
        XCTAssertEqual(int8Value, nil)
        int16Value <~ map["noValue"]
        XCTAssertEqual(int16Value, nil)
        guardNegativeException { int16Value <~ map2["notInt"] }

        let value32: Int32? = Int32(JSONString["int32"]!)
        var int32Value: Int32? = 0
        int32Value <~ map["int32"]
        XCTAssertEqual(int32Value, value32)
        // Negative
        int32Value <~ map["NoSuchKey"]
        XCTAssertEqual(int32Value, nil)
        int32Value <~ map["noValue"]
        XCTAssertEqual(int32Value, nil)
        guardNegativeException { int32Value <~ map2["notInt"] }

        let value64: Int64? = Int64(JSONString["int64"]!)
        var int64Value: Int64? = 0
        int64Value <~ map["int64"]
        XCTAssertEqual(int64Value, value64)
        // Negative
        int64Value <~ map["NoSuchKey"]
        XCTAssertEqual(int64Value, nil)
        int64Value <~ map["noValue"]
        XCTAssertEqual(int64Value, nil)
        guardNegativeException { int64Value <~ map2["notInt"] }

        let value: Int? = Int(JSONString["int"]!)
        var intValue: Int? = 0
        intValue <~ map["int"]
        XCTAssertEqual(intValue, value)
        // Negative
        intValue <~ map["NoSuchKey"]
        XCTAssertEqual(intValue, nil)
        intValue <~ map["noValue"]
        XCTAssertEqual(intValue, nil)
        guardNegativeException { intValue <~ map2["notInt"] }
        
    }

    func testOptionalSignetIntegerMappingToJSON() {
        var map = Map(mappingType: .toJSON, JSON: [:])

        /// SignedInteger Positive results
        var int8Value: Int8? = 2
        int8Value <~ map["int8"]
        XCTAssertNotNil(map.JSON["int8"])

        var int16Value: Int16? = 30
        int16Value <~ map["int16"]
        XCTAssertNotNil(map.JSON["int16"])

        var int32Value: Int32? = -40
        int32Value <~ map["int32"]
        XCTAssertNotNil(map.JSON["int32"])

        var int64Value: Int64? = 23123
        int64Value <~ map["int64"]
        XCTAssertNotNil(map.JSON["int64"])

        var intValue: Int? = 222
        intValue <~ map["int"]
        XCTAssertNotNil(map.JSON["int"])

        // Negative
        var someDateTime: Date? = Date(timeIntervalSinceReferenceDate: -123456789.0)
        guardNegativeException { someDateTime <~ map["notIntValue"] }
    }

}

// ----------------------------------------------------------------------------
