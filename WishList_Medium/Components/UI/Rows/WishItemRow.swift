//
//  WishItemRow.swift
//  WishList_Medium
//
//  Created by Nicolò Curioni on 23/02/24.
//

import SwiftUI

struct WishItemRow: View {
    @Binding var wishItem: WishItem
    
    var body: some View {
        HStack {
            Button {
                wishItem.isCompleted.toggle()
            } label: {
                Image(systemName: wishItem.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.plain)
            
            VStack(alignment: .leading) {
                TextField("Wish Item", text: $wishItem.name)
                
                Text(wishItem.date.formatted(date: .abbreviated, time: .shortened))
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
    }
}
