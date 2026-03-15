//
//  StatsView.swift
//  jMeditations
//
//  Created by j on 15/03/2026.
//

import SwiftData
import SwiftUI

struct StatsView: View {
    var body: some View {
        NavigationStack {
            VStack {
                TotalStatsView()

                HStack {
                    BestYearStatsView()
                    BestMonthStatsView()
                }

                HStack {
                    CurrentYearStatsView(showSupertitle: true)
                    CurrentMonthStatsView(showSupertitle: true)
                }

                Spacer()
            }
            .navigationTitle("Stats")
            .padding(.vertical)
        }
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
