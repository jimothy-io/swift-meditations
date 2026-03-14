//
//  SessionStats.swift
//  jMeditations
//
//  Created by j on 14/03/2026.
//

import Foundation

struct SessionStats {
    var minutes: Int
    var sessions: Int

    var average: Double {
        sessions == 0 ? 0 : Double(minutes) / Double(sessions)
    }

    var formattedAverage: String {
        String(format: "%.1f", average)
    }
}
