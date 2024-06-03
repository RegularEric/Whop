//
//  ContentInteractor.swift
//  Whop
//
//  Created by Eric Chang on 6/3/24.
//

import Foundation

protocol ContentInteracting {
    func getContent() async -> Result<[ContentItem], Error>
}

final class ContentInteractor: ContentInteracting {
    private let client: Networking
    private let url = "whop.com/content/v1/get"
    
    init(client: Networking = NetworkClient()) {
        self.client = client
    }

    func getContent() async -> Result<[ContentItem], any Error> {
        if let items: [ContentItem] = JsonLoader.load("MockData.json") {
            return .success(items)
        } else {
            return .failure(NetworkError.jsonParsingFailure)
        }
    }

    func getContentFromAPI() async -> Result<[ContentItem], Error> {
        guard let url = URL(string: url) else {
            return .failure(NetworkError.invalidURL)
        }
        do {
            let items = try await client.fetch(type: [ContentItem].self, with: URLRequest(url: url), decoder: JSONDecoder())
            return .success(items)
        } catch {
            return .failure(NetworkError.requestFailed(description: error.localizedDescription))
        }
    }
}
