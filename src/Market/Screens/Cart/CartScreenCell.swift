//
//  CartScreenCell.swift
//  Market
//
//  Created by Kate on 02.07.2023.
//

import Kingfisher
import SwiftUI

struct CartScreenCell: View {
    struct Props {
        let id: Int
        let image: String
        let name: String
        let price: Int
        let weight: Int
        var count: Int = 1
    }

    private let props: Props
    private var valueChanged: ((Int) -> Void)?

    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(Asset.Colors.foodCeelsBackground.swiftUIColor)
                .cornerRadius(6)
                .frame(width: 62, height: 62)
                .overlay(alignment: .center) {
                    KFImage(URL(string: props.image))
                        .resizable()
                        .scaledToFit()
                        .padding(4)
                }

            VStack(alignment: .leading) {
                Text(props.name)
                    .foregroundColor(.black)
                    .font(FontFamily.SFProDisplay.regular.swiftUIFont(size: 14))
                    .kerning(0.16)

                HStack {
                    Text("\(props.price) ₽")
                        .font(FontFamily.SFProDisplay.regular.swiftUIFont(size: 14))
                        .kerning(0.14)
                        .foregroundColor(.black)
                    Text("· \(props.weight)г")
                        .font(FontFamily.SFProDisplay.regular.swiftUIFont(size: 14))
                        .kerning(0.14)
                        .foregroundColor(.gray)
                }
            }

            Spacer()

            CustomStepper(valueChanged)
        }
    }

    init(props: CartScreenCell.Props, valueChanged: ((Int) -> Void)? = nil) {
        self.props = props
        self.valueChanged = valueChanged
    }
}

struct CustomStepper: View {
    var valueChanged: ((Int) -> Void)?

    @State private var count = 1
    private let step: Int = 1

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Button {
                if count - 1 > 0 {
                    count -= step
                    valueChanged?(count)
                } else {
                    valueChanged?(count - 1)
                }
            } label: {
                Asset.Icons.minus.swiftUIImage
                    .foregroundColor(.black)
                    .padding(.leading, 6)
            }

            Text("\(count)")
                .foregroundColor(.black)
                .font(FontFamily.SFProDisplay.medium.swiftUIFont(size: 14))
                .kerning(0.16)

            Button {
                count += step
                valueChanged?(count)
            } label: {
                Asset.Icons.plus.swiftUIImage
                    .foregroundColor(.black)
                    .padding(.trailing, 6)
            }
        }
        .frame(height: 32)
        .background(Asset.Colors.stepperColor.swiftUIColor)
        .cornerRadius(10)
    }

    init(_ valueChanged: ((Int) -> Void)? = nil) {
        self.valueChanged = valueChanged
        self.count = 1
    }
}

struct CartScreenCell_Previews: PreviewProvider {
    static var previews: some View {
        CartScreenCell(
            props: .init(
                id: 0,
                image: "",
                name: "ghjghj",
                price: -1,
                weight: -1
            )
        )
    }
}
