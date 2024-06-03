//
//  ListRowView.swift
//  Whop
//
//  Created by Eric Chang on 6/3/24.
//

import SwiftUI

struct ListRowView<T: ListRowViewInforming>: View {
    @ObservedObject private var viewModel: T
    @State var isExpanded: Bool = false

    init(viewModel: T) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: isExpanded ? Constants.chevronDown : Constants.chevronRight)
                Text(viewModel.item.title)
            }
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }

            if isExpanded {
                ForEach(viewModel.item.children) { item in
                    NavigationLink(destination: WebView(url: URL(string: item.url!)!)) {
                        SingleItemRowView(item: item)
                    }
                }
            }
        }
        .border(.black)
        .padding()
    }
    
    private enum Constants {
        static var chevronDown: String { "chevron.down" }
        static var chevronRight: String { "chevron.right" }
    }
}
