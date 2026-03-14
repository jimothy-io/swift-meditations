//
//  RootView.swift
//  jMeditations
//
//  Created by j on 14/03/2026.
//

import SwiftUI
import SwiftData

struct RootView: View {
    var body: some View {
        SessionsView()
    }
}

#Preview {
    RootView()
        .modelContainer(PreviewContainer.app)
}
