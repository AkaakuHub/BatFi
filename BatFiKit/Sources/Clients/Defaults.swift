//
//  Defaults.swift
//
//
//  Created by Adam on 13/06/2023.
//

import Defaults
import Dependencies
import Foundation

public typealias DefaultsValue = CustomStringConvertible & Defaults.Serializable & Equatable

public protocol DefaultsProtocol {
    func observe<Value: DefaultsValue>(_ key: Defaults.Key<Value>) -> AsyncStream<Value>
    func setValue<Value: Defaults.Serializable>(_ key: Defaults.Key<Value>, value: Value)
    func value<Value: Defaults.Serializable>(_ key: Defaults.Key<Value>) -> Value
    func resetSettings()
}

public enum DefaultsKey: TestDependencyKey {
    public static let testValue: any DefaultsProtocol = MockDefaults()
}

private struct MockDefaults: DefaultsProtocol {
    func observe<Value: DefaultsValue>(_ key: Defaults.Key<Value>) -> AsyncStream<Value> {
        unimplemented("observe", placeholder: AsyncStream.never)
    }
    
    func setValue<Value: Defaults.Serializable>(_ key: Defaults.Key<Value>, value: Value) {
        unimplemented("setValue")
    }
    
    func value<Value: Defaults.Serializable>(_ key: Defaults.Key<Value>) -> Value {
        fatalError("Unimplemented test dependency: value")
    }
    
    func resetSettings() {
        unimplemented("resetSettings")
    }
}

public extension DependencyValues {
    var defaults: any DefaultsProtocol {
        get { self[DefaultsKey.self] }
        set { self[DefaultsKey.self] = newValue }
    }
}
