//
//  TickTock.swift
//  JustAClock
//
//  Created by Darktt on 20/04/26.
//  Copyright © 2020 Darktt. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

@available(iOS 13.0, *)
public class TickTock: ObservableObject
{
    // MARK: - Properties -
    @Published
    public private(set) var dateString: String
    
    private let format: String
    
    private lazy var dateFormatter: DateFormatter = {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = self.format
        
        return dateFormatter
    }()
    
    private var timerSubscription: AnyCancellable? = nil
    
    // MARK: - Methods -
    // MARK: Initial Method
    
    public init(withFormat format: String)
    {
        self.format = format
        self.dateString = format
        self.subscribe()
    }
    
    deinit
    {
        self.unsubscribe()
    }
}

// MARK: - Private Methods -

@available(iOS 13.0, *)
private extension TickTock
{
    private func subscribe()
    {
        let subscription: AnyCancellable = Timer.publish(every: 0.5, on: .main, in: .common)
            .autoconnect()
            .map({ self.dateFormatter.string(from: $0) })
            .sink(receiveValue: { [weak self] in self?.dateString = $0 })
        
        self.timerSubscription = subscription
    }
    
    private func unsubscribe()
    {
        self.timerSubscription?.cancel()
    }
}
