//
//  RootViewController.swift
//  JustAClock
//
//  Created by Darktt on 20/04/26.
//  Copyright © 2020 Darktt. All rights reserved.
//

import UIKit

public class RootViewController: UIViewController
{
    // MARK: - Properties -
    
    private let manager: ClockManger = ClockManger(withFormat: "HH:mm:ss")
    private let batteryManager: BatteryManager = BatteryManager(withUpdateInterval: kBatteryUpdateInterval)
    
    private lazy var backlight: Backlight = {
        
        Backlight()
    }()
    
    @IBOutlet fileprivate weak var clockLabel: UILabel!
    @IBOutlet fileprivate weak var batteryLevelLabel: UILabel!
    @IBOutlet fileprivate weak var batteryImage: UIImageView!
    
    // MARK: - Methods -
    // MARK: Initial Method
    
    public init()
    {
        super.init(nibName: "RootViewController", bundle: nil)
        
    }
    
    internal required init?(coder: NSCoder)
    {
        super.init(coder: coder)
    }
    
    public override func awakeFromNib()
    {
        super.awakeFromNib()
        
    }
    
    // MARK: View Live Cycle
    
    public override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.clockLabel.isHidden = true
    }
    
    public override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
    }
    
    public override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
    }
    
    public override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        
    }
    
    public override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.clockLabel.text = ""
        
        let updater: ClockManger.Updater = {
            
            [unowned self] in
            
            self.clockLabel.text = $0
            self.clockLabel.isHidden = false
        }
        
        let batteryUpdater: BatteryManager.Updater = {
            
            [unowned self] in
            
            self.batteryLevelLabel.text = $0
        }
        
        self.manager.updater = updater
        self.batteryManager.updater = batteryUpdater
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handlerPanGestureRecognizer(_:)))
        
        self.view.addGestureRecognizer(gesture)
    }
    
    deinit
    {
        
    }
}

// MARK: - Actions -

private extension RootViewController
{
    @objc
    func handlerPanGestureRecognizer(_ sender: UIPanGestureRecognizer)
    {
        let translation: CGPoint = sender.translation(in: self.view)
        
        self.backlight.brightness = -translation.y
        
        sender.setTranslation(.zero, in: self.view)
    }
}

// MARK: - Private Methons -

private extension RootViewController
{
    
}
