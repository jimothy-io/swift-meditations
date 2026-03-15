//
//  Session+Preview.swift
//  jMeditations
//
//  Created by j on 14/03/2026.
//

import Foundation

extension Session {
    static var preview: Session {
        Session(
            minutes: 15,
            date: date(2026, 4, 6)
        )
    }

    static var previews: [Session] {
        [
            // 2024
            Session(minutes: 12, date: date(2024, 1, 4)),
            Session(minutes: 15, date: date(2024, 1, 11)),
            Session(minutes: 10, date: date(2024, 1, 23)),
            Session(minutes: 18, date: date(2024, 2, 2)),
            Session(minutes: 14, date: date(2024, 2, 17)),
            Session(minutes: 20, date: date(2024, 3, 1)),
            Session(minutes: 8, date: date(2024, 3, 10)),
            Session(minutes: 16, date: date(2024, 3, 25)),
            Session(minutes: 12, date: date(2024, 4, 6)),
            Session(minutes: 45, date: date(2024, 4, 19)),
            Session(minutes: 15, date: date(2024, 5, 3)),
            Session(minutes: 10, date: date(2024, 5, 18)),
            Session(minutes: 13, date: date(2024, 7, 1)),
            Session(minutes: 22, date: date(2024, 7, 2)),
            Session(minutes: 17, date: date(2024, 7, 14)),
            Session(minutes: 19, date: date(2024, 7, 20)),
            Session(minutes: 5, date: date(2024, 8, 8)),
            Session(minutes: 14, date: date(2024, 8, 29)),
            Session(minutes: 35, date: date(2024, 9, 12)),
            Session(minutes: 11, date: date(2024, 9, 28)),
            Session(minutes: 16, date: date(2024, 10, 10)),
            Session(minutes: 18, date: date(2024, 11, 4)),
            Session(minutes: 12, date: date(2024, 11, 21)),
            Session(minutes: 25, date: date(2024, 12, 9)),

            // 2025
            Session(minutes: 10, date: date(2025, 1, 5)),
            Session(minutes: 12, date: date(2025, 2, 3)),
            Session(minutes: 18, date: date(2025, 2, 16)),
            Session(minutes: 14, date: date(2025, 2, 19)),
            Session(minutes: 20, date: date(2025, 3, 2)),
            Session(minutes: 15, date: date(2025, 3, 15)),
            Session(minutes: 9, date: date(2025, 3, 29)),
            Session(minutes: 16, date: date(2025, 4, 10)),
            Session(minutes: 13, date: date(2025, 4, 26)),
            Session(minutes: 40, date: date(2025, 5, 8)),
            Session(minutes: 17, date: date(2025, 5, 24)),
            Session(minutes: 11, date: date(2025, 6, 7)),
            Session(minutes: 15, date: date(2025, 6, 22)),
            Session(minutes: 21, date: date(2025, 7, 5)),
            Session(minutes: 12, date: date(2025, 7, 18)),
            Session(minutes: 60, date: date(2025, 8, 1)),
            Session(minutes: 18, date: date(2025, 9, 4)),
            Session(minutes: 14, date: date(2025, 9, 16)),
            Session(minutes: 10, date: date(2025, 9, 20)),
            Session(minutes: 24, date: date(2025, 10, 3)),
            Session(minutes: 16, date: date(2025, 10, 19)),
            Session(minutes: 7, date: date(2025, 11, 6)),
            Session(minutes: 19, date: date(2025, 11, 23)),
            Session(minutes: 30, date: date(2025, 12, 11)),

            // 2026
            Session(minutes: 12, date: date(2026, 1, 5)),
            Session(minutes: 15, date: date(2026, 1, 6)),
            Session(minutes: 18, date: date(2026, 2, 2)),
            Session(minutes: 14, date: date(2026, 2, 17)),
            Session(minutes: 10, date: date(2026, 2, 23)),
            Session(minutes: 20, date: date(2026, 3, 1)),
            Session(minutes: 8, date: date(2026, 3, 10)),
        ]
    }

    private static func date(_ year: Int, _ month: Int, _ day: Int) -> Date {
        Calendar.current.date(
            from: DateComponents(
                year: year,
                month: month,
                day: day
            )
        )!
    }
}
