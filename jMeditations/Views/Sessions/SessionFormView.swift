//
//  SessionFormView.swift
//  jMeditations
//
//  Created by j on 14/03/2026.
//

import SwiftData
import SwiftUI

struct SessionFormView: View {
    let session: Session?

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var minutesText: String = ""
    @State private var date: Date = Date()

    private var isEditing: Bool {
        session != nil
    }

    private var navigationTitle: String {
        isEditing ? "Edit Session" : "Add Session"
    }

    private var saveButtonTitle: String {
        isEditing ? "Save" : "Add"
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Minutes", text: $minutesText)
                        .keyboardType(.numberPad)

                    DatePicker(
                        "Date",
                        selection: $date,
                        displayedComponents: .date
                    )
                }
            }
            .navigationTitle(navigationTitle)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button(saveButtonTitle) {
                        save()
                        dismiss()
                    }
                    .disabled(minutesValue == nil)
                }
            }
            .onAppear {
                populateFormIfNeeded()
            }
        }
    }

    private var minutesValue: Int? {
        guard let value = Int(minutesText), value > 0 else {
            return nil
        }
        return value
    }

    private func populateFormIfNeeded() {
        guard let session else { return }
        minutesText = String(session.minutes)
        date = session.date
    }

    private func save() {
        guard let minutesValue else { return }

        if isEditing {
            session!.minutes = minutesValue
            session!.date = date
        } else {
            modelContext.insert(
                Session(
                    minutes: minutesValue,
                    date: date
                )
            )
        }
    }
}

#Preview {
    SessionFormView(session: nil)
        .modelContainer(for: Session.self, inMemory: true)
}
