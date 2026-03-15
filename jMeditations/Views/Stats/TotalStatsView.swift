//
//  TotalStatsView.swift
//  jMeditations
//
//  Created by j on 15/03/2026.
//

import SwiftData
import SwiftUI

struct TotalStatsView: View {
    @Query(sort: [SortDescriptor(\Session.date)]) private var sessions:
        [Session]

    private var stats: SessionStats {
        SessionStats(
            minutes: sessions.reduce(0) { $0 + $1.minutes },
            sessions: sessions.count
        )
    }

    private var firstSessionDate: Date? {
        sessions.first?.date
    }

    private var subtitle: String? {
        guard let firstSessionDate else { return nil }
        return
            "Since \(firstSessionDate.formatted(date: .abbreviated, time: .omitted))"
    }

    var body: some View {
        StatsCardView {
            StatsSummaryView(
                title: "Total Stats",
                stats: stats,
                subtitle: subtitle
            )
        }
    }
}

#Preview {
    TotalStatsView()
        .modelContainer(PreviewContainer.sessions)
}

#Preview("Empty") {
    TotalStatsView()
        .modelContainer(PreviewContainer.empty)
}
