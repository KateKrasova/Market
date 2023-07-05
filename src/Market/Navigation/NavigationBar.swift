//
//  NavigationBar.swift
//  Market
//
//  Created by Kate on 29.06.2023.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack {
            Asset.Icons.location.swiftUIImage
                .frame(width: 15)

            VStack(alignment: .leading) {
                Text("Санкт-Петербург")
                    .font(FontFamily.SFProDisplay.regular.swiftUIFont(size: 18))

                Text("12 Августа, 2023")
                    .foregroundColor(Asset.Colors.grayText.swiftUIColor)
                    .font(FontFamily.SFProDisplay.regular.swiftUIFont(size: 14.0))
            }

            Spacer()

            Asset.Images.photo.swiftUIImage
                .resizable()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
        }
    }
}
