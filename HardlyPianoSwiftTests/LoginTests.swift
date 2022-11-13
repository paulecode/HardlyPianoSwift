//
//  LoginTests.swift
//  HardlyPianoSwiftTests
//
//  Created by Paul on 13.11.22.
//

import XCTest
@testable import HardlyPianoSwift

final class LoginTests: XCTestCase {

	let userSession: UserSession = UserSession()
	
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
//		let userSession: UserSession = UserSession()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func test_UserSession_should_not_be_loggedIn() {
		XCTAssertFalse(userSession.isSignedIn)
	}
	
	func test_UserSession_should_login() {
		userSession.signIn(token: "JWT")
		XCTAssert(userSession.isSignedIn)
	}
	
	func test_UserSession_should_logout() {
		userSession.signOut()
		XCTAssertFalse(userSession.isSignedIn)
	}

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
