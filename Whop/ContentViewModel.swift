//
//  ContentViewModel.swift
//  Whop
//
//  Created by Eric Chang on 6/3/24.
//

import Foundation

protocol ContentViewInforming: ObservableObject {
    var isLoading: Bool { get }
    var content: [ContentItem] { get }
    var hasError: Bool { get }
    func getContent() async
}

final class ContentViewModel: ContentViewInforming {
    private let interactor: ContentInteracting
    @Published var isLoading: Bool = false
    @Published var content: [ContentItem] = []
    @Published var hasError: Bool = false
    
    init(interactor: ContentInteracting) {
        self.interactor = interactor
    }
    
    @MainActor
    func getContent() async {
        isLoading = true

        switch await interactor.getContent() {
        case let .success(items):
            self.content = items
            hasError = false

        case .failure:
            self.hasError = true
        }

        isLoading = false
    }
}
