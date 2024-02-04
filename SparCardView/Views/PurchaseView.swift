//
//  PurchaseView.swift
//  PurchaseView
//
//  Created by Виталий on 03.02.2024.
//

import SwiftUI

struct PurchaseView: View {
    
    let units = ["Шт", "Кг"]
    
    @State private var selectedUnit = "Шт"
    @State private var quantity: Int = 1
    @State private var showingAlert = false
    
    let discountPercentage: Double // Пример скидки в процентах
    let originalPricePerCol: Double // Исходная цена товара за Шт
    let originalPricePerKg: Double // Исходная цена за Кг
    let discountPricePerCol: Double // Скидочкая цена товара за Шт
    let discountPricePerKG: Double // Скидочкая цена товара за Кг
    
    var originalPrice: Double {
        selectedUnit == "Шт" ? originalPricePerCol : originalPricePerKg
    }
    
    var totalPrice: Double {
        (selectedUnit == "Шт" ? discountPricePerCol : discountPricePerKG) * Double(quantity)
    }
    
    var body: some View {
        VStack {
            Picker("Выберите единицу измерения",
                   selection: $selectedUnit) {
                ForEach(units, id: \.self) { unit in
                    Text(unit).tag(unit)
                }
            }
                   .pickerStyle(SegmentedPickerStyle())
            
            HStack {
                VStack(alignment: .leading) {
                    Text("\(discountPercentage, specifier: "%.1f")%")
                        .bold()
                        .font(.title)
                    Text("\(originalPrice, specifier: "%.2f") ₽")
                        .strikethrough()
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // Кнопка покупки
                HStack(spacing: 30) {
                    Button(action: {
                        if quantity > 1 { quantity -= 1 }
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(.white)
                            .padding(15)
                    }
                    .frame(minWidth: 20)
                    // Кнопка покупки
                    Button(action: {
                        showingAlert = true
                    }) {
                        VStack {
                            Text("\(quantity) \(selectedUnit) за")
                                .foregroundColor(.white)
                            Text("\(totalPrice, specifier: "%.2f") ₽")
                                .foregroundColor(.white)
                        }
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Покупка"),
                            message: Text("Для завершения покупки допилите приложение :)"),
                            dismissButton: .default(Text("ОК"))
                        )
                    }
                    .frame(minWidth: 70)
                    Button(action: {
                        quantity += 1
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(10)
                    }
                    .frame(minWidth: 20)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.green)
                .cornerRadius(30)
                .foregroundColor(.white)
            }
            .padding(.bottom)
        }
    }
}

struct PurchaseView_Previews: PreviewProvider {
    static let product = ProductModel.sampleData[0]
    static let discount = product.discount ?? 0.0
    static var previews: some View {
        PurchaseView(discountPercentage: discount,
                     originalPricePerCol: product.pricePerCol,
                     originalPricePerKg: product.pricePerKG,
                     discountPricePerCol: product.discountedPricePerCol,
                     discountPricePerKG: product.discountedPricePerKG)
        .previewLayout(.fixed(width: 400, height: 150))
    }
}
