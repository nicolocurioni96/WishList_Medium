//
//  OperationView.swift
//  WishList_Medium
//
//  Created by Nicolò Curioni on 24/02/24.
//

import SwiftUI

struct OperationView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var wishViewModel: WishViewModel
    
    @State private var name = ""
    @State private var isCompleted = false
    @State private var isNew = false
    @State private var date = Date.now
    
    @State private var buttonConfirmTitle = "Save"
    @State private var buttonCancelTitle = "Cancel"
    @State private var editorTitle = "Add Wish Item"
    
    let currentDate = Date()
    
    var body: some View {
        ZStack {
            NavigationStack {
                GeometryReader { geometry in
                    Form {
                        Section {
                            HStack {
                                TextField("Wish Name", text: $name)
                                    .font(.title2)
                                    .textInputAutocapitalization(.none)
                            }
                            .padding(.top, 5)
                        }
                        
                        Section {
                            DatePicker("Date", selection: $date)
                                .labelsHidden()
                                .listRowSeparator(.hidden)
                                .datePickerStyle(.graphical)
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
    }
    
    // MARK: - Private Methods
    private func saveWishItem() {
        withAnimation {
            // Add new Wish Item
            let newWishItem = WishItem(name: name, date: date, isCompleted: isCompleted, isNew: isNew)
            
            wishViewModel.addItem(newWishItem)
            
            cancel()
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
