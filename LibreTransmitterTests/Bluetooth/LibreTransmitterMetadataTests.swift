//
//  LibreTransmitterMetadata.swift
//  LibreTransmitterTests
//
//  Created by Bentley, Samuel on 21/09/2023.
//  Copyright © 2023 LoopKit Authors. All rights reserved.
//

import XCTest
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
        }
    }

    class TestDataFactory {
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
    }
}
