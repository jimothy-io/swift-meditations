//
//  StatsView.swift
//  jMeditations
//
//  Created by j on 15/03/2026.
//

import SwiftUI
import SwiftData

struct StatsView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    StatsView()
        .modelContainer(PreviewContainer.sessions)
}

#Preview("Empty") {
    StatsView()
        .modelContainer(PreviewContainer.sessions)
}
