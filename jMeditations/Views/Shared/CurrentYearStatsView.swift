//
//  CurrentYearStatsView.swift
//  jMeditations
//
//  Created by j on 15/03/2026.
//

import SwiftData
import SwiftUI

struct CurrentYearStatsView: View {
    @Query private var sessions: [Session]
    private let title: String

    init(calendar: Calendar = .current, now: Date = Date()) {
        let year = calendar.component(.year, from: now)
        let startOfYear = calendar.date(
            from: DateComponents(year: year, month: 1, day: 1)
        )!
        let startOfNextYear = calendar.date(
            from: DateComponents(year: year + 1, month: 1, day: 1)
        )!

        self.title = String(year)

        _sessions = Query(
            filter: #Predicate<Session> { session in
                session.date >= startOfYear && session.date < startOfNextYear
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
                stats: stats
            )
        }
    }
}

#Preview {
    VStack {
        HStack {
            CurrentYearStatsView()
            CurrentYearStatsView()
        }

        CurrentYearStatsView()
    }
    .modelContainer(PreviewContainer.sessions)
}
