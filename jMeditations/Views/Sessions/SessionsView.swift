//
//  SessionsView.swift
//  jMeditations
//
//  Created by j on 14/03/2026.
//

import SwiftData
import SwiftUI

struct SessionsView: View {
    @Environment(\.modelContext) private var modelContext

    @Query(
        sort: \Session.date,
        order: .reverse
    )
    private var sessions: [Session]

    @State private var showingSessionForm: Bool = false
    @State private var sessionToEdit: Session? = nil

    var body: some View {
        NavigationStack {
            Group {
                if sessions.isEmpty {
                    ContentUnavailableView(
                        "No Sessions",
                        systemImage: "timer",
                        description: Text(
                            "Your logged meditation sessions will appear here."
                        )
                    )
                } else {
                    List {
                        ForEach(sessions) { session in
                            SessionRowView(session: session)
                                .contentShape(Rectangle())
                                .listRowInsets(
                                    EdgeInsets(
                                        top: 12,
                                        leading: 16,
                                        bottom: 12,
                                        trailing: 16
                                    )
                                )
                                .swipeActions(
                                    edge: .trailing,
                                    allowsFullSwipe: false
                                ) {
                                    Button(role: .destructive) {
                                        deleteSession(session)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                                .swipeActions(
                                    edge: .leading,
                                    allowsFullSwipe: false
                                ) {
                                    Button {
                                        sessionToEdit = session
                                    } label: {
                                        Label("Edit", systemImage: "pencil")
                                    }
                                    .tint(.blue)
                                }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Sessions")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingSessionForm = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showingSessionForm) {
            SessionFormView(session: nil)
        }
        .sheet(item: $sessionToEdit) { session in
            SessionFormView(session: session)
        }
    }

    func deleteSession(_ session: Session) {
        withAnimation {
            modelContext.delete(session)
        }
    }
}

private struct SessionRowView: View {
    let session: Session

    private var dayText: String {
        session.date.formatted(.dateTime.day())
    }

    private var monthText: String {
        session.date.formatted(.dateTime.month(.abbreviated))
    }

    private var weekdayText: String {
        session.date.formatted(.dateTime.weekday(.wide))
    }

    private var minutesText: String {
        "\(session.minutes) minute\(session.minutes == 1 ? "" : "s")"
    }

    var body: some View {
        HStack(spacing: 16) {
            VStack(spacing: 2) {
                Text(dayText)
                    .font(.title3)
                    .fontWeight(.semibold)

                Text(monthText)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .frame(width: 44)

            VStack(alignment: .leading, spacing: 4) {
                Text(weekdayText)
                    .font(.body)
                    .fontWeight(.medium)

                Text(minutesText)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
    }
}

#Preview {
    SessionsView()
        .modelContainer(PreviewContainer.sessions)
}
