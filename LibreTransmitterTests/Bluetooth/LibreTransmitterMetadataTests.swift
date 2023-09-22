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
    
    func testSensorFamilyDescriptions() throws {
        for (sensorFamily, expectedDescription) in TestDataFactory.sensorFamilies() {
            XCTAssertEqual(sensorFamily.description, expectedDescription)
        }
    }
    
    func testLibreTransmitterMetadataDescription() throws {
        // Given
        var metadata = TestDataFactory.metadata()
        
        // When
        var result = LibreTransmitterMetadata(
            hardware: metadata.hardware,
            firmware: metadata.firmware,
            battery: metadata.battery,
            name: metadata.name,
            macAddress: metadata.macAddress,
            patchInfo: metadata.patchInfo,
            uid: metadata.uid
        ).description
        
        // Then
        let expected = "Transmitter: Libre 2, Hardware: Optional(\"hardware\"), firmware: Optional(\"firmware\")battery: 100, macAddress: Optional(\"00-B0-D0-63-C2-26\"), patchInfo: Optional(1 bytes), uid: Optional([1])"
        XCTAssertEqual(result, expected)
    }
    
    func testLibreTransmitterSensorType() throws {
        // Given
        var metadata = TestDataFactory.metadata()
        
        // When
        var result = LibreTransmitterMetadata(
            hardware: metadata.hardware,
            firmware: metadata.firmware,
            battery: metadata.battery,
            name: metadata.name,
            macAddress: metadata.macAddress,
            patchInfo: metadata.patchInfo,
            uid: metadata.uid
        ).sensorType()?.description
        
        // Then
        XCTAssertEqual(result, "Libre 2")
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
        
        static func sensorFamilies() -> [SensorFamily: String] {
            return [
                SensorFamily.libre: "Libre",
                SensorFamily.librePro: "Libre Pro",
                SensorFamily.libre2: "Libre 2",
                SensorFamily.libreSense: "Libre Sense"
            ]
        }
        
        static func metadata() -> LibreTransmitterMetadata {
            var hardware = "hardware"
            var firmware = "firmware"
            var battery = 100
            var name = "Libre 2"
            var macAddress = "00-B0-D0-63-C2-26"
            var patchInfo = Data([0x9D])
            var uid: [UInt8] = [0x1]
            
            return LibreTransmitterMetadata(hardware: hardware, firmware: firmware, battery: battery, name: name, macAddress: macAddress, patchInfo: patchInfo, uid: uid)
        }
    }
}
