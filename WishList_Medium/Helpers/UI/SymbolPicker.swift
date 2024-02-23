//
//  SymbolPicker.swift
//  WishList_Medium
//
//  Created by Nicolò Curioni on 23/02/24.
//

import SwiftUI

struct SymbolPicker: View {
    @Binding var wishItem: WishItem
    @State private var selectedColor: Color = ColorOptions.default
    @Environment(\.dismiss) private var dismiss
    @State private var symbolNames = ItemSymbols.symbolNames
    @State private var searchInput = ""
    
    var columns = Array(repeating: GridItem(.flexible()), count: 6)
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                }
                .padding()
            }
            
            HStack {
                Image(systemName: wishItem.symbol)
                    .font(.title)
                    .imageScale(.large)
                    .foregroundStyle(selectedColor)
            }
            .padding()
            
            HStack {
                ForEach(ColorOptions.all, id: \.self) { color in
                    Button {
                        selectedColor = color
                        wishItem.color = color.rgbaColor
                    } label: {
                        Circle()
                            .foregroundStyle(color)
                    }
                }
            }
            .padding(.horizontal)
            .frame(height: 40)
            
            Divider()
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(symbolNames, id: \.self) { symbolItem in
                        Button {
                            wishItem.symbol = symbolItem
                        } label: {
                            Image(systemName: symbolItem)
                                .imageScale(.large)
                                .foregroundStyle(selectedColor)
                                .padding(5)
                        }
                    }
                    .drawingGroup()
                }
            }
            .onAppear {
                selectedColor = Color(wishItem.color)
            }
        }
    }
}


#Preview {
    SymbolPicker(wishItem: .constant(.init(name: "Apple Vision Pro")))
}
