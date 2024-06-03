//
//  TappableRow.swift
//  Whop
//
//  Created by Eric Chang on 6/3/24.
//

import SwiftUI

struct SingleItemRowView: View {
    let item: ContentItem

    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(.clear)
            .overlay {
                Text(item.title)
            }
            .frame(height: 50)
            .border(.black)
            .padding()
    }
}
