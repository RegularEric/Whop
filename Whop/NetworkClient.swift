//
//  NetworkClient.swift
//  Whop
//
//  Created by Eric Chang on 6/3/24.
//

import Foundation

protocol Networking {
    func fetch<T: Codable>(type: T.Type, with request: URLRequest) async throws -> T
    func fetch<T: Codable>(type: T.Type, with request: URLRequest, decoder: JSONDecoder) async throws -> T
}

final class NetworkClient: Networking {
    private let session: URLSession
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    func fetch<T: Codable>(type: T.Type, with request: URLRequest) async throws -> T {
        return try await fetch(type: type, with: request, decoder: JSONDecoder())
    }

    func fetch<T: Codable>(type: T.Type, with request: URLRequest, decoder: JSONDecoder) async throws -> T {
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.requestFailed(description: "Invalid response")
        }
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseUnsuccessful(description: "Status code: \(httpResponse.statusCode)")
        }
        
        do {
            return try decoder.decode(type, from: data)
        } catch {
            throw NetworkError.jsonConversionFailure(description: error.localizedDescription)
        }
    }
}
