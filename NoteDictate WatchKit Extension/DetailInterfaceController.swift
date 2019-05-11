//
//  DetailInterfaceController.swift
//  NoteDictate WatchKit Extension
//
//  Created by Charlie von Lehe on 3/12/19.
//  Copyright © 2019 Charlie von Lehe. All rights reserved.
//

import WatchKit
import Foundation


class DetailInterfaceController: WKInterfaceController {
    @IBOutlet weak var textLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        if let contextDictionary = context as? [String: String] {
            textLabel.setText(contextDictionary["note"] ?? "1")
            let index = contextDictionary["index"] ?? "1"
            setTitle("Note \(index)")
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
