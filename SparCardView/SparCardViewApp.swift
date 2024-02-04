//
//  SparCardViewApp.swift
//  SparCardView
//
//  Created by Виталий on 03.02.2024.
//

import SwiftUI

@main
struct SparCardViewApp: App {
    private var data = ProductModel.sampleData[0]
    var body: some Scene {
        WindowGroup {
            MainView(data: data)
        }
    }
}
