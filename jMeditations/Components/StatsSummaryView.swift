import SwiftUI

struct StatsSummaryView: View {
    let title: String
    let stats: SessionStats
    let showZeroStats: Bool
    let subtitle: String?
    let supertitle: String?

    init(
        title: String,
        stats: SessionStats,
        showZeroStats: Bool = false,
        subtitle: String? = nil,
        supertitle: String? = nil
    ) {
        self.title = title
        self.stats = stats
        self.showZeroStats = showZeroStats
        self.subtitle = subtitle
        self.supertitle = supertitle
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let supertitle {
                Text(supertitle)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Text(title)
                .font(.title3)
                .fontWeight(.semibold)

            if let subtitle {
                Text(subtitle)
                    .font(.body)
                    .foregroundStyle(.secondary)
            }

            if stats.sessions > 0 || showZeroStats {
                VStack(alignment: .leading, spacing: 4) {
                    statText("Minutes", "\(stats.minutes)")
                    statText("Sessions", "\(stats.sessions)")
                    statText("Average", stats.formattedAverage, unit: "min")
                }
                .padding(.top, 4)
            } else {
                Text("No stats found.")
                    .foregroundStyle(.secondary)
                    .padding(.top, 4)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func statText(_ label: String, _ value: String, unit: String? = nil)
        -> some View
    {
        let valueText = Text(value).fontWeight(.semibold)
        let unitText = unit.map { Text("\u{200A}\($0)") } ?? Text("")

        return Text("\(label): \(valueText)\(unitText)")
            .font(.body)
    }
}
