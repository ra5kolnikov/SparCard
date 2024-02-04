//
//  DescriptionView.swift
//  DescriptionView
//
//  Created by Виталий on 03.02.2024.
//

import SwiftUI

struct DescriptionView: View {
    @State private var showAllCharacteristics = false
    
    var description: String
    var characteristics: [(String, String)]
    
    private let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Описание:")
                    .bold()
                Text(description)
                    .padding(.bottom)
                Text("Основные характеристики:")
                    .bold()
                
                ForEach(Array(characteristics.prefix(showAllCharacteristics ? characteristics.count : 5)), id: \.0) { characteristic in
                    HStack {
                        Text(characteristic.0 + ":")
                            .lineLimit(2)
                        Spacer()
                        // Расчетное количество точек
                        Text(repeatingDots(key: characteristic.0, value: characteristic.1))
                            .lineLimit(1)
                        Spacer()
                        Text(characteristic.1)
                            .lineLimit(1)
                    }
                }
                
                if characteristics.count > 5 {
                    Button(action: {
                        withAnimation {
                            self.showAllCharacteristics.toggle()
                        }
                    }) {
                        HStack {
                            Text(showAllCharacteristics ? "Скрыть" : "Все характеристики")
                                .foregroundColor(.green)
                                .bold()
                            Image(systemName: showAllCharacteristics ? "chevron.up" : "chevron.down")
                                .foregroundColor(.green)
                                .bold()
                        }
                    }
                    .padding(.top)
                }
            }
        }
    }
    //Функция для расчета количества точек
    func repeatingDots(key: String, value: String) -> String {
        let keyWidth = CGFloat(key.count) * 14.0
        let valueWidth = CGFloat(value.count) * 7.0
        let totalTextWidth = keyWidth + valueWidth
        //свободное место с учетом отступов
        let remainingWidth = screenWidth - totalTextWidth - 40
        let dotWidth: CGFloat = 5.0
        let numberOfDots = Int(remainingWidth / dotWidth)
        
        return String(repeating: ".", count: max(3, numberOfDots))
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(description: "Описание товара здесь а ниже характеристики", characteristics: [
            ("Производство", "Россия, Краснодар"),
            ("Энергетическая ценность, ккал/100г", "25"),
            ("Жиры/100г", "10"),
            ("Белки/100г", "10"),
            ("Углеводы/100г", "10"),
            ("Дата сбора", "2010"),
            ("Страна производства", "Таджикистан"),
            ("Код товара", "7HDX8900LD")
        ])
    }
}
