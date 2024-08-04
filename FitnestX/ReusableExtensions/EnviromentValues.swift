//
//  EnviromentValues.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-08-03.
//

import SwiftUI

struct ViewContextKey: EnvironmentKey {
    static let defaultValue: ViewContext = .home
}

extension EnvironmentValues {
    var viewContext: ViewContext {
        get { self[ViewContextKey.self] }
        set { self[ViewContextKey.self] = newValue }
    }
}

enum ViewContext {
    case home
    case details
}
