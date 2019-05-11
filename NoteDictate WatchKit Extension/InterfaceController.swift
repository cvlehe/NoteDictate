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
    var notes:[String] = []
    let savePath = InterfaceController.getDocumentsDirectory().appendingPathComponent("notes").path
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        notes = NSKeyedUnarchiver.unarchiveObject(withFile: savePath) as? [String] ?? [String]()
        
        table.setNumberOfRows(10, withRowType: "Row")
        for rowIndex in 1..<11 {
            setRow(row: rowIndex - 1, to: "Row \(rowIndex)")
        }
    }
    
    func setRow (row rowIndex:Int, to text:String) {
        guard let row = table.rowController(at: rowIndex) as? NoteSelectRow else { return }
        row.textLabel.setText(text)
        self.notes.append(text)

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
        // testing branch restrictions
        presentTextInputController(withSuggestions: nil, allowedInputMode: .plain) {[unowned self]
            result in
            guard let result = result?.first as? String else { return }
            
            self.table.insertRows(at: IndexSet(integer: self.notes.count), withRowType: "Row")
            self.setRow(row: self.notes.count, to: result)
            
            NSKeyedArchiver.archiveRootObject(self.notes, toFile: self.savePath)
        }
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        return ["index": String(rowIndex + 1), "note": notes[rowIndex]]
    }
    
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

}
