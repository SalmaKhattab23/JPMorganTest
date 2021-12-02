//
//  NetworkManagerTests.swift
//  TestTests
//
//  Created by Salma Khattab on 27/11/2021.
//

import XCTest
@testable import Test

class NetworkManagerTests: XCTestCase {
    
    var networkManager: NetworkManager!
    let session = MockURLSession()
    
    override func setUp() {
        super.setUp()
        networkManager = NetworkManager(session: session)
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func testExecuteRequest() {
        
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        let mockRequest = networkManager.buildRequest(path: "mockPath", httpMethod: .get)
        networkManager.executeRequest(request: mockRequest,
                                         responseType: PlanetResult.self) { _, _ in
        }
        XCTAssert(session.mockURL == mockRequest.url)
        XCTAssert(dataTask.resumeCalled)
    }
    
    func testBuildRequest() {
        
        let request = networkManager.buildRequest(path: "mockPath",
                                                  httpMethod: .post,
                                                  param: ["ID" : "1"],
                                                  bodyParam: ["name": "x"])
        XCTAssertNotNil(request)
    }
}


class MockURLSession: URLSessionProtocol {
    
    var nextDataTask = MockURLSessionDataTask()
    private (set) var mockURL: URL?
    
    func sessionDataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        mockURL = request.url
        return nextDataTask
    }
}

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    
    private (set) var resumeCalled = false
    func resume() {
        resumeCalled = true
    }
}


