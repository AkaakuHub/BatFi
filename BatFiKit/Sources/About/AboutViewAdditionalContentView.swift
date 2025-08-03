//
//  AboutViewAdditionalContentView.swift
//
//
//  Created by Adam on 21/06/2023.
//

import AboutKit
import AppShared
import L10n
import SwiftUI
import SharedUI

struct AboutViewAdditionalContentView: View {
    @Environment(\.openURL) private var openURL

    var body: some View {
        VStack(spacing: 20) {
            Text("Private Build")
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AboutViewAdditionalContentView()
    }
}
