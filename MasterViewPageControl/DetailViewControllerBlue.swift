//
//  DetailViewControllerBlue.swift
//  MasterViewPageControl
//
//  Created by Jonathan Buie on 10/24/16.
//  Copyright © 2016 Jonathan Buie. All rights reserved.
//

import UIKit

class DetailViewControllerBlue: UIViewController {

    
    @IBOutlet weak var detailDescriptionLabelBlue: UILabel!
    
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabelBlue {
                label.text = detail.description
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
