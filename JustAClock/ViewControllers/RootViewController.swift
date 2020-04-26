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
    
    @IBOutlet fileprivate weak var clockLabel: UILabel!
    
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
        let updater: ClockManger.Updater = {
            
            [unowned self] in
            
            self.clockLabel.text = $0
            self.clockLabel.isHidden = false
        }
        
        self.manager.updater = updater
    }
    
    deinit
    {
        
    }
}

// MARK: - Actions -

private extension RootViewController
{
    
}

// MARK: - Private Methons -

private extension RootViewController
{
    
}
