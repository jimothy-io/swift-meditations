//
//  RootView.swift
//  jMeditations
//
//  Created by j on 14/03/2026.
//

import SwiftData
import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            SessionsView()
                .tabItem {
                    Label("Sessions", systemImage: "list.bullet")
                }
            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "chart.bar")
                }
        }
    }
}

#Preview {
    RootView()
        .modelContainer(PreviewContainer.app)
}
