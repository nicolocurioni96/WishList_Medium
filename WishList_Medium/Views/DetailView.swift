//
//  DetailView.swift
//  WishList_Medium
//
//  Created by Nicolò Curioni on 22/02/24.
//

import SwiftUI

struct DetailView: View {
    @Binding var wishItem: WishItem
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text(wishItem.name)
                        .font(.headline)
                }
                
                Section {
                    Text(DateFormatter.localizedString(from: wishItem.date, dateStyle: .long, timeStyle: .none))
                        .font(.headline)
                }
            }
            .navigationTitle(Text(wishItem.name))
        }
    }
}

#Preview {
    DetailView(wishItem: .constant(.init()))
}
