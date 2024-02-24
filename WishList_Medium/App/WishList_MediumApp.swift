//
//  WishList_MediumApp.swift
//  WishList_Medium
//
//  Created by Nicolò Curioni on 22/02/24.
//

import SwiftUI

@main
struct WishList_MediumApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(wishItem: .constant(.init(symbol: ItemSymbols.randomName(), color: ColorOptions.random().rgbaColor)))
        }
    }
}
