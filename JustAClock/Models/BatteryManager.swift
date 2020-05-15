//
//  BatteryManager.swift
//  JustAClock
//
//  Created by Eden on 2020/5/15.
//  Copyright © 2020 Darktt. All rights reserved.
//

import SwiftExtensions
import Foundation

public class BatteryManager
{
    // MARK: - Properties -
    
    public var updater: Updater?
    
    private let device: UIDevice = UIDevice.current
    
    private let updateInterval: TimeInterval
    private var timer: Timer?
    
    // MARK: - Methods -
    // MARK: Initial Method
    
    public init(withUpdateInterval updateInterval: TimeInterval)
    {
        self.updateInterval = updateInterval
        
        self.device.isBatteryMonitoringEnabled = true
        self.startUpdate()
    }
    
    deinit
    {
        self.stopUpdate()
    }
}

// MARK: - Private Methods -

private extension BatteryManager
{
    func startUpdate()
    {
        let timerHandler: (Timer) -> Void = {
            
            [unowned self] _ in
            
            let batteryLevel: Float = self.device.batteryLevel
            let level: String = (batteryLevel * 100.0).format("%.0f%%")
            let batteryImageName: String = self.convertBatteryImage(via: batteryLevel)
            
            self.updater?(level, batteryImageName)
        }
        
        let timer = Timer.every(self.updateInterval, handler: timerHandler)
        
        // Trigger timer at first time setup.
        timerHandler(timer)
        
        self.timer = timer
    }
    
    func stopUpdate()
    {
        self.timer.unwrapped {
            
            $0.invalidate()
        }
        
        self.timer = nil
    }
    
    private func convertBatteryImage(via level: Float) -> String
    {
        var batteryImageName: String!
        
        switch level {
        case 0.26 ... 1.0:
            batteryImageName = "battery.100"
            
        case 0.10 ... 0.25:
            batteryImageName = "battery.25"
            
        default:
            batteryImageName = "battery.0"
        }
        
        return batteryImageName
    }
}

// MARK: - Clourse -

public extension BatteryManager
{
    typealias Updater = (_ level: String, _ imageName: String) -> Void
}
