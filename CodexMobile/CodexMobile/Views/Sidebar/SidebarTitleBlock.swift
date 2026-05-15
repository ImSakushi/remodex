// FILE: SidebarTitleBlock.swift
// Purpose: Large sidebar brand title plus compact connection chip shown under
//          the top toolbar.
// Layer: View Component
// Exports: SidebarTitleBlock
// Depends on: SwiftUI, AppFont

import SwiftUI

struct SidebarTitleBlock: View {
    var title = "Remodex"
    let computerName: String?
    let isConnected: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(AppFont.system(size: 32, weight: .bold))
                .foregroundStyle(.primary)
                .lineLimit(1)
                .minimumScaleFactor(0.75)

            if let computerName, !computerName.isEmpty {
                HStack(spacing: 6) {
                    Circle()
                        .fill(isConnected ? Color.green : Color.secondary.opacity(0.5))
                        .frame(width: 8, height: 8)

                    Text(computerName)
                        .font(AppFont.subheadline())
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#if DEBUG
#Preview("Connected") {
    SidebarTitleBlock(
        computerName: "MacBook-Pro-di-Emanuele.local",
        isConnected: true
    )
    .padding()
}

#Preview("Disconnected") {
    SidebarTitleBlock(
        computerName: "MacBook-Pro-di-Emanuele.local",
        isConnected: false
    )
    .padding()
}
#endif
