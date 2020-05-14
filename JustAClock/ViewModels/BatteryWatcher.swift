//
//  BatteryWatcher.swift
//  JustAClock
//
//  Created by Eden on 2020/5/14.
//  Copyright © 2020 Darktt. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

@available(iOS 13.0, *)
public class BatteryWatcher: ObservableObject
{
    // MARK: - Properties -
    
    @Published
    public private(set) var level: String
    
    @Published
    public private(set) var batteryImageName: String = "battery.100"
    
    private let device: UIDevice = UIDevice.current
    
    private let updateInterval: TimeInterval
    private var timerSubscription: AnyCancellable? = nil
    
    public init(updateInterval: TimeInterval)
    {
        self.updateInterval = updateInterval
        
        self.device.isBatteryMonitoringEnabled = true
        self.level = (self.device.batteryLevel * 100.0).format("%.0f%%")
        
        self.subscribe()
    }
    
    deinit
    {
        
        self.unsubscribe()
    }
}

// MARK: - Private Methods -

@available(iOS 13.0, *)
private extension BatteryWatcher
{
    private func subscribe()
    {
        let subscription: AnyCancellable = Timer.publish(every: self.updateInterval, on: .main, in: .common)
            .autoconnect()
            .map({ _ in self.device.batteryLevel })
            .sink {
                [weak self] in
                
                self?.level = ($0 * 100.0).format("%.0f%%")
                self?.updateBatteryImage(via: $0)
        }
        
        self.timerSubscription = subscription
    }
    
    private func unsubscribe()
    {
        self.timerSubscription?.cancel()
    }
    
    private func updateBatteryImage(via level: Float)
    {
        switch level {
        case 0.26 ... 1.0:
            self.batteryImageName = "battery.100"
            
        case 0.10 ... 0.25:
            self.batteryImageName = "battery.25"
            
        default:
            self.batteryImageName = "battery.0"
        }
    }
}
