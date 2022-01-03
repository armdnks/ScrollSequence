//
//  CoverView.swift
//  ScrollSequence
//
//  Created by armdnks on 1/3/22.
//

import SwiftUI

struct CoverView: View {
    var body: some View {
        VStack(spacing: 21) {
            
            Text("MacBook Air")
                .font(.system(size: 38, weight: .medium))
                .foregroundColor(.darkGray)
            
            Image("macbookAir-cover")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.vertical, 50)
            
            Text("Power. It’s in the Air.")
                .font(.system(size: 33, weight: .bold))
                .foregroundColor(.darkGray)
            
            Text("The longest battery life ever in a MacBook Air. And a silent, fanless design. This much power has never been this ready to go.")
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(.gray)
                .lineSpacing(6)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 40)
    }
}

struct CoverView_Previews: PreviewProvider {
    static var previews: some View {
        CoverView()
    }
}
