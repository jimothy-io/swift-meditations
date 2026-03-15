//
//  CurrentMonthStatsView.swift
//  jMeditations
//
//  Created by j on 15/03/2026.
//

import SwiftData
import SwiftUI

struct CurrentMonthStatsView: View {
    @Query private var sessions: [Session]
    private let title: String

    init(calendar: Calendar = .current, now: Date = Date()) {
        let components = calendar.dateComponents([.year, .month], from: now)

        let startOfMonth = calendar.date(
            from: DateComponents(
                year: components.year,
                month: components.month,
                day: 1
            )
        )!

        let startOfNextMonth = calendar.date(
            byAdding: DateComponents(month: 1),
            to: startOfMonth
        )!

        self.title = now.formatted(.dateTime.month(.wide))

        _sessions = Query(
            filter: #Predicate<Session> { session in
                session.date >= startOfMonth && session.date < startOfNextMonth
            },
            sort: [SortDescriptor(\Session.date)]
        )
    }

    private var stats: SessionStats {
        SessionStats(
            minutes: sessions.reduce(0) { $0 + $1.minutes },
            sessions: sessions.count
        )
    }

    var body: some View {
        StatsCardView {
            StatsSummaryView(
                title: title,
                stats: stats,
            )
        }
    }
}

#Preview {
    VStack {
        HStack {
            CurrentYearStatsView()
            CurrentMonthStatsView()
        }

        CurrentMonthStatsView()
    }
    .modelContainer(PreviewContainer.sessions)
}
