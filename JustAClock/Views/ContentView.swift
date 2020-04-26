//
//  ContentView.swift
//  JustAClock
//
//  Created by Darktt on 20/04/26.
//  Copyright © 2020 Darktt. All rights reserved.
//

import SwiftUI
import SwiftExtensions

@available(iOS 13.0, *)
struct ContentView: View
{
    var body: some View {
        
        ClockView().background(Color.black).fillScreen()
    }
}

@available(iOS 13.0, *)
struct ContentView_Previews: PreviewProvider
{
    static var previews: some View {
        
        Group {
            
            ContentView().previewDevice(PreviewDevice.iPhone7Plus)
            ContentView().previewDevice(.iPhone11)
        }
    }
}
