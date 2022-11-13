//
//  validationTests.swift
//  HardlyPianoSwiftTests
//
//  Created by Paul on 13.11.22.
//

import XCTest
@testable import HardlyPianoSwift

final class validationTests: XCTestCase {

	let validator: authenticatorProtocol = MockAuthService()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func test_should_return_JWT() async throws {
		
		let username = "irakli"
		let password = "123456"
		
		let token = try await validator.signIn(username: username, password: password)
		XCTAssertEqual(token, "JWT1337")
	}
	

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
