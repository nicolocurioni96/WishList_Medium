//
//  WishItemRow.swift
//  WishList_Medium
//
//  Created by Nicolò Curioni on 23/02/24.
//

import SwiftUI

struct WishItemRow: View {
    @Binding var wishItem: WishItem
    var focusedItem: FocusState<WishItem?>.Binding
    
    var body: some View {
        HStack {
            Button {
                wishItem.isCompleted.toggle()
            } label: {
                Image(systemName: wishItem.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.plain)
        }
        
        TextField("Wish Item", text: $wishItem.name, axis: .vertical)
            .focused(focusedItem, equals: wishItem)
        
        Spacer()
    }
}
