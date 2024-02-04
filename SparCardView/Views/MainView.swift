//
//  MainView.swift
//  SparCardView
//
//  Created by Виталий on 04.02.2024.
//

import SwiftUI

struct MainView: View {
    
    let data: ProductModel
    
    var body: some View {
        TabView {
            CardView(product: data)
                .tabItem {
                    Label("Главная", systemImage: "leaf.circle.fill")
                }
            NavigationView {
                Text("Каталог")
            }
            .tabItem {
                Label("Каталог", systemImage: "square.grid.2x2")
            }
            NavigationView {
                Text("Корзина")
            }
            .tabItem {
                Label("Корзина", systemImage: "cart")
            }
            NavigationView {
                Text("Профиль")
            }
            .tabItem {
                Label("Профиль", systemImage: "person")
            }
        }
        .tint(.green)
    }
}


#Preview {
    MainView(data: ProductModel.sampleData[0])
}
