//
//  ScrollingView.swift
//  ScrollSequence
//
//  Created by armdnks on 1/3/22.
//

import SwiftUI

struct ScrollingView: View {
    var body: some View {
        ZStack {
            
            Color.lightGray.ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .center,spacing: 0) {
                    
                    CoverView().frame(height: UIScreen.screenHeight).zIndex(1)
                    
                    SequenceReader().frame(height: 150)
                    
                    DetailView().frame(height: UIScreen.screenHeight).padding(.bottom, 45)
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct ScrollingView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingView()
    }
}
