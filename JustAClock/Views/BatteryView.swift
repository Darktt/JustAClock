//
//  BatteryView.swift
//  JustAClock
//
//  Created by Eden on 2020/5/14.
//  Copyright © 2020 Darktt. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public struct BatteryView: View
{
    // MARK: - Properties -
    
    @ObservedObject
    private var batterWatcher: BatteryWatcher = BatteryWatcher(updateInterval: 500.0)
    
    public var body: some View {
        
        HStack {
            
            Text(self.batterWatcher.level)
                .fontWeight(.bold)
                .foregroundColor(Color("TextColor"))
            Image(systemName: self.batterWatcher.batteryImageName)
                .foregroundColor(Color("TextColor"))
        }
    }
}

@available(iOS 13.0, *)
struct BatteryView_Previews: PreviewProvider
{
    static var previews: some View {
        
        BatteryView()
    }
}
