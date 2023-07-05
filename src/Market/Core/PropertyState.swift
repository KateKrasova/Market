//
//  PropertyState.swift
//  Core
//
//  Created by Kate on 29.05.2023.
//

public enum PropertyState<T: Equatable>: Equatable {
    case none
    case loading
    case data(T)
    case error(String)

    public var value: T? {
        switch self {
        case .data(let data):
            return data

        default:
            return nil
        }
    }
}
