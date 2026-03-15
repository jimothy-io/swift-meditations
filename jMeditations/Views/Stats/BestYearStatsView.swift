//
//  BestYearStatsView.swift
//  jMeditations
//
//  Created by j on 15/03/2026.
//

import SwiftData
import SwiftUI

struct BestYearStatsView: View {
    @Query(sort: [SortDescriptor(\Session.date)]) private var sessions:
        [Session]
    private let calendar: Calendar

    init(calendar: Calendar = .current) {
        self.calendar = calendar
    }

    private var bestYear: (year: Int, stats: SessionStats)? {
        let grouped = Dictionary(grouping: sessions) { session in
            calendar.component(.year, from: session.date)
        }

        let yearlyStats = grouped.map { year, sessions in
            (
                year: year,
                stats: SessionStats(
                    minutes: sessions.reduce(0) { $0 + $1.minutes },
                    sessions: sessions.count
                )
            )
        }

        return yearlyStats.max { a, b in
            if a.stats.minutes == b.stats.minutes {
                return a.year > b.year
            }

            return a.stats.minutes < b.stats.minutes
        }
    }

    private var title: String {
        guard let bestYear else { return "N/A" }
        return String(bestYear.year)
    }

    private var stats: SessionStats {
        bestYear?.stats ?? SessionStats(minutes: 0, sessions: 0)
    }

    var body: some View {
        StatsCardView {
            StatsSummaryView(
                title: title,
                stats: stats,
                supertitle: "Best Year"
            )
        }
    }
}

#Preview {
    BestYearStatsView()
        .modelContainer(PreviewContainer.sessions)
}

#Preview("Empty") {
    BestYearStatsView()
        .modelContainer(PreviewContainer.empty)
}
