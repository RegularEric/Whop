//
//  ContentItem.swift
//  Whop
//
//  Created by Eric Chang on 6/3/24.
//

import Foundation

struct ContentItem: Codable, Hashable, Identifiable {
    // ID can come from backend but I used this for covenience
    let id = UUID()
    let title: String
    let isDirectory: Bool
    let url: String?
    let children: [ContentItem]
}
