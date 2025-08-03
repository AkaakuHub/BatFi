//
//  AnalyticsClient.swift
//
//
//  Created by Adam Różyński on 28/03/2024.
//

import Clients
import Dependencies
import Sentry

extension Clients.AnalyticsClient: DependencyKey {
    public static var liveValue: Self = {
        return Clients.AnalyticsClient(
            startSDK: {
                // Analytics disabled for privacy
            },
            captureMessage: { message in
                // Analytics disabled for privacy
            },
            captureError: { error in
                // Analytics disabled for privacy
            },
            addBreadcrumb: { category, message in
                // Analytics disabled for privacy
            },
            closeSDK: {
                // Analytics disabled for privacy
            }
        )
    }()
}

private actor AnalyticsState {
    var isEnabled = false

    func enableAnalytics() {
        isEnabled = true
    }

    func disableAnalytics() {
        isEnabled = false
    }
}
