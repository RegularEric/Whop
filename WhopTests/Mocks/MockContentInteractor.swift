//
//  MockContentInteractor.swift
//  WhopTests
//
//  Created by Eric Chang on 6/3/24.
//

@testable import Whop

final class MockContentInteractor: ContentInteracting {
    func getContent() async -> Result<[ContentItem], Error> {
        if let items: [ContentItem] = JsonLoader.load("MockData.json") {
            return .success(items)
        } else {
            return .failure(NetworkError.jsonParsingFailure)
        }
    }
}
