//
//  BestMonthStatsView.swift
//  jMeditations
//
//  Created by j on 15/03/2026.
//

import SwiftData
import SwiftUI

struct BestMonthStatsView: View {
    @Query(sort: [SortDescriptor(\Session.date)]) private var sessions:
        [Session]
    private let calendar: Calendar

    init(calendar: Calendar = .current) {
        self.calendar = calendar
    }

    private var bestMonth: (date: Date, stats: SessionStats)? {
        let grouped = Dictionary(grouping: sessions) { session in
            let components = calendar.dateComponents(
                [.year, .month],
                from: session.date
            )
            return calendar.date(
                from: DateComponents(
                    year: components.year,
                    month: components.month,
                    day: 1
                )
            )!
        }

        let monthlyStats = grouped.map { date, sessions in
            (
                date: date,
                stats: SessionStats(
                    minutes: sessions.reduce(0) { $0 + $1.minutes },
                    sessions: sessions.count
                )
            )
        }

        return monthlyStats.max { a, rhs in
            if a.stats.minutes == rhs.stats.minutes {
                return a.date > rhs.date
            }

            return a.stats.minutes < rhs.stats.minutes
        }
    }

    private var title: String {
        guard let bestMonth else { return "N/A" }
        return bestMonth.date.formatted(.dateTime.year().month(.wide))
    }

    private var stats: SessionStats {
        bestMonth?.stats ?? SessionStats(minutes: 0, sessions: 0)
    }

    var body: some View {
        StatsCardView {
            StatsSummaryView(
                title: title,
                stats: stats,
                supertitle: "Best Month"
            )
        }
    }
}

#Preview {
    BestMonthStatsView()
        .modelContainer(PreviewContainer.sessions)
}

#Preview("Empty") {
    BestMonthStatsView()
        .modelContainer(PreviewContainer.empty)
}
