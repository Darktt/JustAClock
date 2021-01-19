//
//  SettingView.swift
//  JustAClock
//
//  Created by Eden on 2021/1/19.
//  Copyright © 2021 Darktt. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public struct SettingView: View
{
    @Environment(\.presentationMode)
    private var presentationMode
    
    public var backlight: Backlight
    
    public var body: some View {
        
        ZStack {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Brightness: \(self.backlight.brightness.format("%.0f"))")
                    .font(Font.system(size: 50.0))
                    .foregroundColor(Color("TextColor"))
                
                Spacer().frame(height: 10.0)
                
                Button(action: self.dismissAction, label: {
                    Text("Dismiss")
                        .font(Font.system(size: 25.0, weight: .bold))
                        .foregroundColor(.white)
                })
            }
        }.background(Color.black)
    }
}

@available(iOS 13.0, *)
extension SettingView
{
    func dismissAction()
    {
        self.presentationMode.wrappedValue.dismiss()
    }
}
