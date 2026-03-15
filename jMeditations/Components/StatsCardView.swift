//
//  AppCard.swift
//  jMeditations
//
//  Created by j on 15/03/2026.
//

import SwiftUI

struct StatsCardView<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(16)
            .background(cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .overlay(cardStroke)
            .shadow(color: .black.opacity(0.06), radius: 8, y: 2)
    }

    private var cardBackground: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(Color(uiColor: .secondarySystemBackground))
    }

    private var cardStroke: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke(Color.primary.opacity(0.06), lineWidth: 1)
    }
}
