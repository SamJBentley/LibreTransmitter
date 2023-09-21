//
//  LibreTransmitterMetadata.swift
//  LibreTransmitterTests
//
//  Created by Bentley, Samuel on 21/09/2023.
//  Copyright © 2023 LoopKit Authors. All rights reserved.
//

import XCTest
<<<<<<< HEAD
@testable import LibreTransmitter

final class LibreTransmitterMetadataTests: XCTestCase {

    func testSensorType() throws {
        for (bytes, expectedSensorDescription) in TestDataFactory.sensorTypes() {
            // Given
            let patchInfo : Data = Data(bytes)
            
            // When
            let result = SensorType(patchInfo: patchInfo)
            
            // Then
            XCTAssertEqual(result.description, expectedSensorDescription)
=======

final class LibreTransmitterMetadataTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
>>>>>>> main
        }
    }

    class TestDataFactory {
<<<<<<< HEAD
        static func sensorTypes() -> [[UInt8] : String] {
            // Unimportant bytes are stubbed out with 0x0s
            return [
                [0xDF]: "Libre 1",
                [0xE5]: "Libre US 14d",
                [0xE6]: "Libre US 14d",
                [0x70]: "Libre Pro/H",
                [0xC5]: "Libre 2",
                [0x9D]: "Libre 2",
                [0x76, 0x0, 0x0, 0x02]: "Libre 2 US",
                [0x76, 0x0, 0x0, 0x04]: "Libre 2 CA",
                [0x76, 0x0, 0x78, 0x0]: "Libre Sense",
                [0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0]: "Libre 3", // stub all bytes out to make the length == 24, since Libre 3 is determined by number of bytes
                [0x0]: "Libre" //
            ]
        }
=======
        
>>>>>>> main
    }
}
