//
//  BarRectangle.swift
//  WarbyParkerStores
//
//  Created by Jonathan Lu on 10/13/20.
//

import SwiftUI

// Represents a bar that fills in from the leading edge.
struct LeadingBarRectangle: Shape {
    var fillValue: CGFloat
    
    var animatableData: CGFloat {
        get { fillValue }
        set { fillValue = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let width = rect.width
            let height = rect.height
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: width * fillValue, y: 0))
            path.addLine(to: CGPoint(x: width * fillValue, y: height))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}
