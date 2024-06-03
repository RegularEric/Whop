//
//  ContentView.swift
//  Whop
//
//  Created by Eric Chang on 6/3/24.
//

import SwiftUI

struct ContentView<T: ContentViewInforming>: View {
    @ObservedObject private var viewModel: T

    init(viewModel: T) {
        self.viewModel = viewModel
        Task { await viewModel.getContent() }
    }
    
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
        } else if viewModel.hasError {
            // ErrorScreen
        } else {
            NavigationStack {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.content) { item in
                            if item.isDirectory {
                                ListRowView(viewModel: ListRowViewModel(item: item))
                            } else {
                                NavigationLink(destination: WebView(url: URL(string: item.url!)!)) {
                                    SingleItemRowView(item: item)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel(interactor: ContentInteractor()))
}
