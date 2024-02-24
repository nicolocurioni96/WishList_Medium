//
//  OperationView.swift
//  WishList_Medium
//
//  Created by Nicolò Curioni on 24/02/24.
//

import SwiftUI

struct OperationView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var wishViewModel = WishViewModel()
    @State private var isPickingSymbol = false
    @State private var name = ""
    @State private var symbol = ItemSymbols.randomName()
    @State private var isCompleted = false
    @State private var isNew = false
    @State private var color: RGBAColor = ColorOptions.random().rgbaColor
    @State private var date = Date.now
    
    @State private var buttonConfirmTitle = "Save"
    @State private var buttonCancelTitle = "Cancel"
    @State private var editorTitle = "Add Wish Item"
    
    var wishItem: WishItem? = nil
    let currentDate = Date()
    
    var body: some View {
        ZStack {
            NavigationStack {
                GeometryReader { geometry in
                    Form {
                        Section {
                            HStack {
                                Button {
                                    isPickingSymbol.toggle()
                                } label: {
                                    Image(systemName: symbol)
                                        .imageScale(.large)
                                        .foregroundColor(Color(color))
                                }
                                .buttonStyle(.plain)
                                .padding(.horizontal, 5)
                                
                                TextField("Wish Name", text: $name)
                                    .font(.title2)
                            }
                            .padding(.top, 5)
                        }
                        
                        Section {
                            DatePicker("Date", selection: $date)
                                .labelsHidden()
                                .listRowSeparator(.hidden)
                        }
                        
                        Section {
                            Button {
                                isCompleted.toggle()
                            } label: {
                                HStack {
                                    Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                                    
                                    Text(isCompleted ? "Completed" : "Not Completed")
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .navigationTitle("Add Wish Item")
                
                VStack {
                    Button {
                        saveWishItem()
                    } label: {
                        Text(buttonConfirmTitle)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .shadow(radius: 8)
                            .frame(height: 30)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(BorderedProminentButtonStyle())
                    .padding(.horizontal, 15)
                    .disabled(validateFields())
                    
                    Button(action: cancel) {
                        Text(buttonCancelTitle)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .shadow(radius: 8)
                            .frame(height: 30)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(DefaultButtonStyle())
                    .padding(.horizontal, 15)
                    .padding(.top, 4)
                }
            }
        }
        .onAppear {
            if let wishItem {
                // Getting/reading current Wish Item (EDIT)
                name = wishItem.name
                symbol = wishItem.symbol
                date = wishItem.date
                isCompleted = wishItem.isCompleted
                isNew = wishItem.isNew
                color = wishItem.color
                
                buttonConfirmTitle = "Update"
                buttonCancelTitle = "Cancel"
                editorTitle = "Update Item"
            } else {
                buttonConfirmTitle = "Add"
                buttonCancelTitle = "Cancel"
                editorTitle = "New Item"
            }
        }
    }
    
    // MARK: - Private Methods
    private func saveWishItem() {
        withAnimation {
            if let wishItem {
                // Edit current WishItem
                wishItem.name = name
                wishItem.symbol = symbol
                wishItem.date = date
                wishItem.isCompleted = isCompleted
                wishItem.isNew = isNew
                wishItem.color = color
                
                dismiss()
            } else {
                // Add new Wish Item
                let newWishItem = WishItem(symbol: symbol, color: color, name: name, isCompleted: isCompleted, isNew: isNew)
                
                wishViewModel.addItem(newWishItem)
                
                dismiss()
            }
        }
    }
    
    private func validateFields() -> Bool {
        guard name.isEmpty else {
            return false
        }
                
        return true
    }
    
    private func cancel() {
        withAnimation {
            dismiss()
        }
    }
}

#Preview {
    OperationView()
}
