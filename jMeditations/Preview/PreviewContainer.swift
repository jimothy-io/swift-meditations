//
//  PreviewContainer.swift
//  jMeditations
//
//  Created by j on 14/03/2026.
//

import Foundation
import SwiftData

enum PreviewContainer {
    static var sessions: ModelContainer {
        let container = try! ModelContainer(
            for: Session.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )

        let context = container.mainContext
        for item in Session.previews {
            context.insert(item)
        }

        return container
    }

    static var app: ModelContainer {
        let container = try! ModelContainer(
            for: Session.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )

        let context = container.mainContext
        for item in Session.previews {
            context.insert(item)
        }

        return container
    }
}
