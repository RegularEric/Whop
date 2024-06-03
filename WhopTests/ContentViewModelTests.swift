//
//  ContentViewModelTests.swift
//  WhopTests
//
//  Created by Eric Chang on 6/3/24.
//

@testable import Whop
import XCTest

final class ContentViewModelTests: XCTestCase {
    private var viewModel: (any ContentViewInforming)!

    override func setUpWithError() throws {
        viewModel = ContentViewModel(interactor: MockContentInteractor())
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testFetchGoals() async throws {
        await viewModel.getContent()

        XCTAssertEqual(viewModel.content.count, 8)
        XCTAssertEqual(viewModel.content.first!.title, "https://www.whop.com")
        XCTAssertEqual(viewModel.content[1].children.count, 12)
    }
}
