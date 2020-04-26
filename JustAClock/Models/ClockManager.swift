//
//  ClockManager.swift
//  JustAClock
//
//  Created by Darktt on 20/04/26.
//  Copyright © 2020 Darktt. All rights reserved.
//

import SwiftExtensions
import Foundation

public class ClockManger
{
    // MARK: - Properties -
    
    public var updater: Updater?
    
    private let format: String
    
    private lazy var dateFormatter: DateFormatter = {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = self.format
        
        return dateFormatter
    }()
    
    private var timer: Timer?
    
    // MARK: - Methods -
    // MARK: Initial Method
    
    public init(withFormat format: String)
    {
        self.format = format
        
        self.startUpdate()
    }
    
    deinit
    {
        self.stopUpdate()
    }
}

// MARK: - Private Methods -

private extension ClockManger
{
    func startUpdate()
    {
        let timerHandler: (Timer) -> Void = {
            
            [unowned self] _ in
            
            let date = Date()
            let dateString: String = self.dateFormatter.string(from: date)
            
            self.updater?(dateString)
        }
        
        let timer = Timer.every(0.5, handler: timerHandler)
        
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
}

// MARK: - Clourse -

public extension ClockManger
{
    typealias Updater = (String) -> Void
}
