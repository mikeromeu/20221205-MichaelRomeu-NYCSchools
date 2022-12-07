//
//  _0221205_MichaelRomeu_NYCSchoolsTests.swift
//  20221205-MichaelRomeu-NYCSchoolsTests
//
//  Created by Michael Romeu  on 12/5/22.
//

import XCTest
@testable import _0221205_MichaelRomeu_NYCSchools

final class _0221205_MichaelRomeu_NYCSchoolsTests: XCTestCase {

    func test_fetchAllSchools() async throws {
        let service = NYCSchoolService()
        
        do {
            let schools = try await service.getSchoolsData()
            XCTAssertTrue(schools.count > 0, "Schools are found")
        } catch {
            XCTFail("Expected schools dta, but failed with error: \(error)")
        }
    }

}
