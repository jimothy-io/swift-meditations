//
//  PreviewContainer.swift
//  jMeditations
//
//  Created by j on 14/03/2026.
//

import Foundation
import SwiftData

enum PreviewContainer {
    static var empty: ModelContainer {
        makeSessionContainer(with: [])
    }

    static var sessions: ModelContainer {
        makeSessionContainer(with: Session.previews)
    }

    private static func makeSessionContainer(with sessions: [Session]) -> ModelContainer {
        let container = try! ModelContainer(
            for: Session.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )

        let context = container.mainContext
        sessions.forEach { context.insert($0) }

        return container
    }
}
