//
//  Session.swift
//  jMeditations
//
//  Created by j on 13/03/2026.
//

import Foundation
import SwiftData

@Model
class Session {
    var minutes: Int = 0
    var date: Date = Date()

    init(minutes: Int, date: Date) {
        self.minutes = minutes
        self.date = date
    }
}
