//
//  LatestActivityData.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-29.
//

import SwiftUI

struct LatestActivityData {
    var imageName: String
    var title: String
    var timeAgo: String
}


extension LatestActivityData {
    static let sampleData = [
        LatestActivityData(imageName: "Latest-Pic", title: "Drinking 300ml Water", timeAgo: "About 10 minutes ago"),
        LatestActivityData(imageName: "userProfile", title: "Eat Snack (Fitbar)", timeAgo: "About 7 minutes ago"),
        LatestActivityData(imageName: "Latest-Pic", title: "Drinking 300ml Water", timeAgo: "About 5 minutes ago"),
        LatestActivityData(imageName: "userProfile", title: "Eat Snack (Fitbar)", timeAgo: "About 3 minutes ago")
    ]
}
