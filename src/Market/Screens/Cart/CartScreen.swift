//
//  CartScreen.swift
//  Market
//
//  Created by Kate on 29.06.2023.
//

import SwiftUI

final class CartScreenViewModel: ObservableObject {
    static let shared = CartScreenViewModel()

    @Published var items: [CartScreenCell.Props] = []

    private init() {
    }

    func fetchSum() -> String {
        let sum = items.reduce(0) { partialResult, props in
            partialResult + props.price * props.count
        }
        let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.groupingSeparator = " "
            numberFormatter.decimalSeparator = ","

            if let formattedSum = numberFormatter.string(from: NSNumber(value: sum)) {
                return formattedSum
            } else {
                return "\(sum)"
            }
    }

    func updateCount(id: Int, value: Int) {
        guard let index = items.firstIndex(where: { $0.id == id }) else { return }

        if value <= 0 {
            items.remove(at: index)
        } else {
            items[index].count = value
        }
    }
}

struct CartScreen: View {
    @StateObject var viewModel = CartScreenViewModel.shared

    var body: some View {
        VStack {
            NavigationBar()
                .padding(.horizontal)

            List(viewModel.items, id: \.id) { item in
                CartScreenCell(
                    props: item,
                    valueChanged: { value in
                        viewModel.updateCount(id: item.id, value: value)
                    }
                )
                .buttonStyle(.plain)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)

            Button {
            } label: {
                Text("Оплатить \(viewModel.fetchSum()) ₽")
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
}

struct CartScreen_Previews: PreviewProvider {
    static var previews: some View {
        CartScreen()
    }
}
