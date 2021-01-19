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
    // MARK: - Properties -
    
    private var dragGesture: some Gesture {
        
        DragGesture()
            .onChanged {
                
                let brightnessOffset: CGFloat = $0.translation.height
                
                self.backlight.brightness = -brightnessOffset
            }
    }
    
    private var tapGesture: some Gesture {
        
        TapGesture()
            .onEnded {
                
                _ in
                
                self.needsPresent.toggle()
            }
    }
    
    @ObservedObject
    private var tickTock: TickTock = TickTock(withFormat: "HH:mm:ss")
    
    @State
    private var backlight: Backlight = Backlight()
    
    @State
    private var needsPresent: Bool = false
    
    public var body: some View {
        
        HStack(spacing: 10.0) {
            
            Spacer()
            
            VStack(spacing: 10.0) {
                
                Spacer(minLength: 10.0).frame(width: 10.0)
                
                Text(self.tickTock.dateString)
                    .font(Font.system(size: 200.0))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(Color("TextColor"))
                    .frame(width: 450.0)
                    .allowsHitTesting(false)
                
                Spacer().frame(width: 10.0)
            }
            
            Spacer()
        }.fillScreen()
        .background(Color.black)
        .gesture(self.dragGesture)
        .gesture(self.tapGesture)
        .sheet(isPresented: self.$needsPresent, content: {
            
            SettingView(backlight: self.backlight)
        })
    }
}

@available(iOS 13.0, *)
struct ColokView_Previews: PreviewProvider
{
    static var previews: some View {
        
        ClockView()
    }
}
