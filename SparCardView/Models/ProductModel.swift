//
//  ProductModel.swift
//  SparCardView
//
//  Created by Виталий on 03.02.2024.
//

import Foundation
import SwiftUI

struct ProductModel: Identifiable{
    let id: UUID
    let image: Image
    let providerImage: Image
    let providerDescr: String
    let name: String
    let description: String
    let characteristics: [(String, String)]
    let reviews: [Reviews]
    let pricePerCol: Double
    let pricePerKG: Double
    let discount: Double?
    let contentToShare: [Any]
    
    init(id: UUID = UUID(), image: Image, providerImage: Image, providerDescr: String, name: String, description: String, characteristics: [(String, String)], reviews: [Reviews], pricePerCol: Double, pricePerKG: Double, discount: Double?, contentToShare: [Any]) {
        self.id = id
        self.image = image
        self.providerImage = providerImage
        self.providerDescr = providerDescr
        self.name = name
        self.description = description
        self.characteristics = characteristics
        self.reviews = reviews
        self.pricePerCol = pricePerCol
        self.pricePerKG = pricePerKG
        self.discount = discount
        self.contentToShare = contentToShare
    }
}

extension ProductModel {
    
    var rating: Double {
        guard reviews.count > 0 else { return 0.0 }
        let totalRating = reviews.reduce(0.0) { $0 + $1.rating }
        return totalRating / Double(reviews.count)
    }
    
    var discountedPricePerCol: Double {
        if let discount = discount {
            return pricePerCol * discount / 100
        } else {
            return pricePerCol
        }
    }
    
    var discountedPricePerKG: Double {
        if let discount = discount {
            return pricePerKG * discount / 100
        } else {
            return pricePerKG
        }
    }
}

extension ProductModel {
    static let sampleData: [ProductModel] =
    [
        ProductModel(image: Image("lipa"),
                     providerImage: Image("spainFlag"),
                     providerDescr: "Испания. Риоха",
                     name: "Добавка \"Липа\" к чаю 200 г",
                     description: "Флавоноиды липового дерева обладают противовоспалительным действием, способствуют укрепелению стенки сосудов...",
                     characteristics: [
                        ("Производство", "Россия, Краснодар"),
                        ("Энергетическая ценность, ккал/100г", "25"),
                        ("Жиры/100г", "10"),
                        ("Белки/100г", "10"),
                        ("Углеводы/100г", "10"),
                        ("Дата сбора", "2010"),
                        ("Страна производства", "Таджикистан"),
                        ("Код товара", "7HDX8900LD")
                     ],
                     reviews: Reviews.sampleData,
                     pricePerCol: 199.0,
                     pricePerKG: 79.0,
                     discount: 60.3,
                     contentToShare: ["Проверьте это приложение! https://example.com"])
    ]
}

