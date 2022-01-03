//
//  SequenceReader.swift
//  ScrollSequence
//
//  Created by armdnks on 1/3/22.
//

import SwiftUI

struct SequenceReader: View {
    
    // total image sequence
    let imageNumber = 0...88
    // image sequence name
    let sequences: String = "sequence"
    
    var body: some View {
        
        GeometryReader { geo in
            
            // getting scroll value
            let minY = geo.frame(in: .global).minY
            // animation speed
            let speed: CGFloat = 5
            // animation start point
            let startPoint = minY - 1175
            // total image count
            let imageCount = imageNumber.count
            // logic
            let scroll = startPoint < 0 ? startPoint < CGFloat((1 - imageCount) * 2) * speed ? CGFloat((imageCount - 1) * 2) : -startPoint / speed : 0
            
            ZStack {
                ForEach(imageNumber, id: \.self) { index in
                    // -index sequence + scroll
                    Image(sequences + "\(-index + Int(scroll))")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 475)
                }
            }
            .offset(y: -minY < 0 ? -minY > -550 ? -250 : minY - 800 : -250)
        }
    }
}

struct SequenceReader_Previews: PreviewProvider {
    static var previews: some View {
        SequenceReader()
        //        ContentView()
    }
}
