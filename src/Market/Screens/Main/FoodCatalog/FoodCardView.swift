//
//  FoodCardView.swift
//  Market
//
//  Created by Kate on 30.06.2023.
//

import Kingfisher
import SwiftUI

struct FoodCardView: View {
    var id = -1
    var image = ""
    var name = ""
    var price = 0
    var weight = 0
    var description = ""

    var callback: (() -> Void)?

    var isAddedToCart: Bool {
        CartScreenViewModel.shared.items.contains(where: { $0.id == id })
    }

    init(
        id: Int,
        image: String = "",
        name: String = "",
        price: Int = 0,
        weight: Int = 0,
        description: String = "",
        callback: (() -> Void)? = nil
    ) {
        self.id = id
        self.image = image
        self.name = name
        self.price = price
        self.weight = weight
        self.description = description
        self.callback = callback
    }

    var body: some View {
        ZStack {
            Asset.Colors.shadowBack.swiftUIColor
                .edgesIgnoringSafeArea(.vertical)
            VStack(alignment: .leading, spacing: 0) {
                VStack {
                    KFImage(URL(string: image))
                        .resizable()
                        .scaledToFit()
                        .padding(.vertical)
                        .padding(.leading, 56)
                        .padding(.trailing, 56)
                        .overlay(alignment: .topTrailing) {
                            HStack(alignment: .center, spacing: 8) {
                                Button {
                                    print("добавленно в избранное")
                                } label: {
                                    VStack {
                                        Asset.Icons.heart.swiftUIImage
                                    }
                                }
                                .frame(width: 40, height: 40)
                                .background(Color.white)
                                .foregroundColor(Color.black)
                                .clipShape(RoundedRectangle(cornerRadius: 8))

                                Button {
                                    callback?()
                                } label: {
                                    VStack {
                                        Asset.Icons.close.swiftUIImage
                                    }
                                }
                                .frame(width: 40, height: 40)
                                .background(Color.white)
                                .foregroundColor(Color.black)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                        }
                        .padding()
                }
                .background(Asset.Colors.foodCeelsBackground.swiftUIColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
                .padding(.top)

                Text(name)
                    .font(FontFamily.SFProDisplay.medium.swiftUIFont(size: 16))
                    .kerning(0.16)
                    .padding(.horizontal)
                    .padding(.vertical, 8)

                HStack {
                    Text("\(price) ₽")
                        .font(FontFamily.SFProDisplay.regular.swiftUIFont(size: 14))
                        .kerning(0.14)
                        .foregroundColor(.black)
                    Text("· \(weight)г")
                        .font(FontFamily.SFProDisplay.regular.swiftUIFont(size: 14))
                        .kerning(0.14)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)

                Text(description)
                    .font(FontFamily.SFProDisplay.regular.swiftUIFont(size: 14))
                    .kerning(0.14)
                    .foregroundColor(.black.opacity(0.65))
                    .padding(.horizontal)
                    .padding(.top, 8)
                    .padding(.bottom, 16)

                if !isAddedToCart {
                    Button {
                        CartScreenViewModel.shared.items.append(
                            .init(
                                id: id,
                                image: image,
                                name: name,
                                price: price,
                                weight: weight,
                                count: 1
                            )
                        )
                    } label: {
                        Text("Добавить в корзину")
                            .font(FontFamily.SFProDisplay.medium.swiftUIFont(size: 16))
                            .kerning(0.1)
                            .frame(height: 48)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal)
                            .padding(.bottom)
                    }
                }
            }
            .background()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
        }
    }
}

struct FoodCardView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCardView(id: -1)
    }
}
