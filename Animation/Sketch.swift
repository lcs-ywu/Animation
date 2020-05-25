import Foundation
import CanvasGraphics

class Sketch : NSObject {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : Canvas
    
    // Define a row on the board
    var row = Array(repeating: false, count: 50)
    
    // Define an empty board
    var board: [[Bool]] = []
    
    // Define cell width and height
    let size = 10
        
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // Iterate through the rows
        for _ in 1...50 {
            board.append(row)
        }
        
        print("Done creating board.")
        
        // Modify at a specific position
        //  NOTE: Zero-based
        //
        //  row is 0, column is 4
        board[0][4] = true

    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Iterate over all the rows and columns
        // Draw a filled black square when a value is true
        for row in 0...board.count - 1 {
            for column in 0...board[row].count - 1 {
                
                print(board[row][column])
                
                if board[row][column] == true {
                    
                    canvas.drawShapesWithFill = true
                    
                } else {
                    
                    canvas.drawShapesWithFill = false
                    
                }
                
                canvas.drawRectangle(at: Point(x: column * size, y: row * size), width: size, height: size)
                
            }
        }
        
    }
    
}

