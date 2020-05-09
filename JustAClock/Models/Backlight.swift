//
//  Backlight.swift
//  JustAClock
//
//  Created by Darktt on 20/05/09.
//  Copyright © 2020 Darktt. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public class Backlight
{
    // MARK: - Properties -
    
    @State public var brightness: CGFloat = 0.0 {
        
        willSet {
            
            self.setBrightness(newValue)
        }
    }
    
    private(set) var defaultBrightness: CGFloat = 0.0
    
    private lazy var screen = {
        
        UIScreen.main
    }()
    
    private var screenHeight: CGFloat {
        
        self.screen.bounds.height
    }
    
    // MARK: - Methods -
    // MARK: Initial Method
    
    public init()
    {
        self.defaultBrightness = self.screen.brightness
    }
    
    deinit
    {
        self.screen.setBrightness(brightness: self.defaultBrightness)
    }
    
    func setBrightness(_ value: CGFloat)
    {
        let offset: CGFloat = value / self.screenHeight
        var brightness: CGFloat = self.screen.brightness + offset
        
        if brightness >= 1.0 {
            
            brightness = 1.0
        }
        
        if brightness <= 0.0 {
            
            brightness = 0.0
        }
        
        self.screen.setBrightness(brightness: brightness)
    }
}
