//
//  ListRowViewModel.swift
//  Whop
//
//  Created by Eric Chang on 6/3/24.
//

import Foundation

protocol ListRowViewInforming: ObservableObject {
    var item: ContentItem { get }
}

final class ListRowViewModel: ListRowViewInforming {
    let item: ContentItem
    
    init(item: ContentItem) {
        self.item = item
    }
}
