//
//  FoodCatalogScreen.swift
//  Market
//
//  Created by Kate on 30.06.2023.
//

import SwiftUI

struct FoodCatalogScreen: View {
    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>

    @StateObject var viewModel = FoodCatalogViewModel()

    var title = ""
    @State var showDishCard = false

    @State var id = -1
    @State var image = ""
    @State var name = ""
    @State var price = 0
    @State var weight = 0
    @State var description = ""

    @State private var selectedTeg: Teg? = .all

    let columns = Array(
        repeating: GridItem(.flexible(), spacing: 0, alignment: .top),
        count: 3
    )

    var filteredDishes: [Dish] {
        if let selectedTeg = selectedTeg, selectedTeg != .all {
            return viewModel.response.value?.dishes?.filter({ dish in
                dish.tegs?.contains(selectedTeg) ?? false
            }) ?? []
            } else {
                return viewModel.response.value?.dishes ?? []
            }
        }

    var body: some View {
        NavigationStack {
            HStack(spacing: 8) {
                ForEach(Teg.allCases, id: \.self) { teg in
                    Button {
                        selectedTeg = teg
                    } label: {
                        Text(teg.rawValue)
                            .padding()
                            .frame(height: 35)
                            .font(FontFamily.SFProDisplay.regular.swiftUIFont(size: 14))
                            .kerning(0.14)
                            .foregroundColor(selectedTeg == teg ? .white : .black)
                            .background(selectedTeg == teg ? Color.blue : Asset.Colors.foodCeelsBackground.swiftUIColor)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.top)

            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    switch viewModel.response {
                    case .data:
                        ForEach(filteredDishes, id: \.id) { dish in
                            FoodCatalogCustomCell(image: dish.imageUrl ?? "", text: dish.name ?? "")
                                .onTapGesture {
                                    guard
                                        let idUnwrapped = dish.id,
                                        let nameUnwrapped = dish.name,
                                        let priceUnwrapped = dish.price,
                                        let imageUnwrapped = dish.imageUrl,
                                        let weightUnwrapped = dish.weight,
                                        let descriptionUnwrapped = dish.description
                                    else {
                                        return
                                    }

                                    id = idUnwrapped
                                    image = imageUnwrapped
                                    name = nameUnwrapped
                                    price = priceUnwrapped
                                    weight = weightUnwrapped
                                    description = descriptionUnwrapped

                                    showDishCard = true
                                }
                        }

                    case .loading:
                        Text("Данные загружаются")

                    case .error(let error):
                        Text(error)

                    case .none:
                        Text("Нет данных")
                    }
                }
                .padding()
            }
        }
        .overlay {
            FoodCardView(
                id: id,
                image: image,
                name: name,
                price: price,
                weight: weight,
                description: description
            ) {
                showDishCard = false
            }
            .animation(.easeInOut, value: UUID())
            .opacity(showDishCard ? 1 : 0)
        }
        .navigationTitle(title)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                Asset.Images.photo.swiftUIImage
                    .resizable()
                    .frame(width: 44, height: 44)
                    .clipShape(Circle())
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

struct FoodCatalogScreen_Previews: PreviewProvider {
    static var previews: some View {
        FoodCatalogScreen()
    }
}
