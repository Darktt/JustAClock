//
//  ColokView.swift
//  JustAClock
//
//  Created by Darktt on 20/04/26.
//  Copyright © 2020 Darktt. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ClockView: View
{
    @ObservedObject
    private var tickTock: TickTock = TickTock(withFormat: "HH:mm:ss")
    
    public var body: some View {
        
        HStack(spacing: 10.0) {
            
            Spacer()
            
            VStack(spacing: 10.0) {
                
                Spacer()
                
                Text(self.tickTock.dateString)
                    .font(Font.system(size: 200.0))
                    .minimumScaleFactor(0.5)
                    .foregroundColor(Color.green)
                
                Spacer()
            }
            
            Spacer()
        }.fillScreen()
    }
}

@available(iOS 13.0, *)
struct ColokView_Previews: PreviewProvider
{
    static var previews: some View {
        
        ClockView()
    }
}
