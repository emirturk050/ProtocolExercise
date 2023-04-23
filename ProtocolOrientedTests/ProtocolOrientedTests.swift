//
//  ProtocolOrientedTests.swift
//  ProtocolOrientedTests
//
//  Created by Emir Türk on 14.04.2023.
//

import XCTest
@testable import ProtocolOriented

final class ProtocolOrientedTests: XCTestCase {

    private var userViewModel : UserViewModel!
    private var userService : MockUserService!
    private var output : MockUserViewModelOutput!
    
    override func setUpWithError() throws {

        userViewModel = UserViewModel(userService: userService)
        userService = MockUserService()
        output = MockUserViewModelOutput()
        userViewModel.output = output

    }

    override func tearDownWithError() throws {

        userService = nil
        userViewModel = nil
    }

    func testUpdateViewApiSuccess() throws {
        let mockUser = User(id: 1, name: "emir", username: "emirco", email: "emir@gmail.com", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        
        userService.fetchUserMockResult = .success(mockUser)
        userViewModel.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.first?.userName, "emirco")
    }
    
    func testUpdateViewApiFailure() throws {
        
        userService.fetchUserMockResult = .failure(NSError())
        userViewModel.fetchUsers()
        XCTAssertEqual(output.updateViewArray.first?.name, "User not found")
        
    }


}

class MockUserService : UserService {
    
    var fetchUserMockResult : Result<ProtocolOriented.User, Error>?
    
    func fetchUser(completion: @escaping (Result<ProtocolOriented.User, Error>) -> Void) {
        
        if let result = fetchUserMockResult {
            completion(result)
        }
    }
    
}

class MockUserViewModelOutput : UserViewModelOutput {
   
    var updateViewArray : [(name: String, email: String, userName: String)] = []
   
    func updateView(name: String, email: String, userName: String) {
        updateViewArray.append((name,email,userName))
    }
    
    
    
}
