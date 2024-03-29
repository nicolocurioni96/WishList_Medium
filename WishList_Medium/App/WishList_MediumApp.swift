//
//  WishList_MediumApp.swift
//  WishList_Medium
//
//  Created by Nicolò Curioni on 22/02/24.
//

import SwiftUI
import SwiftData

@main
struct WishList_MediumApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            WishItem.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            HomeView(wishViewModel: .init(modelContext: .init(sharedModelContainer)))
                .modelContainer(sharedModelContainer)
        }
    }
}
