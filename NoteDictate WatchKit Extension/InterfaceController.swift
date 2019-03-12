//
//  InterfaceController.swift
//  NoteDictate WatchKit Extension
//
//  Created by Charlie von Lehe on 3/11/19.
//  Copyright © 2019 Charlie von Lehe. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet var table:WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        table.setNumberOfRows(10, withRowType: "Row")
        for rowIndex in 0..<10 {
            guard let row = table.rowController(at: rowIndex) as? NoteSelectRow else { continue }
            row.textLabel.setText("Row \(rowIndex)")
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
    
    @IBAction func addNewNote() {
        
    }

}
