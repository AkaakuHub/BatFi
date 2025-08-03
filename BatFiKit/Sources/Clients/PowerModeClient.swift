//
//  PowerModeClient.swift
//  BatFiKit
//
//  Created by Adam Różyński on 20.11.2024.
//

import Dependencies

public enum PowerMode {
    case low, normal, high
}

public enum PowerModeClientError: Error {
    case unsupportedMode
}

public struct PowerModeClient: TestDependencyKey {
    public var getCurrentPowerMode: () async throws -> (PowerMode, Bool)
    public var setPowerMode: (PowerMode, _ lowPowerModeOnly: Bool) async throws -> Void

    public init(
        getCurrentPowerMode: @escaping () async throws -> (PowerMode, Bool),
        setPowerMode: @escaping (PowerMode, Bool) async throws -> Void
    ) {
        self.getCurrentPowerMode = getCurrentPowerMode
        self.setPowerMode = setPowerMode
    }

    public static var testValue: PowerModeClient = PowerModeClient(
        getCurrentPowerMode: unimplemented("getCurrentPowerMode"),
        setPowerMode: unimplemented("setPowerMode")
    )
}

extension DependencyValues {
    public var powerModeClient: PowerModeClient {
        get { self[PowerModeClient.self] }
        set { self[PowerModeClient.self] = newValue }
    }
}
