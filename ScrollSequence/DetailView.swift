//
//  DetailView.swift
//  ScrollSequence
//
//  Created by armdnks on 1/3/22.
//

import SwiftUI

struct DetailView: View {
    
    var colors: [String] = ["Silver", "Gold", "Space Grey"]
    @State var selectedColor: String = "Silver"
    
    var sizes: [String] = ["256GB", "512GB"]
    @State var selectedSize: String = "256GB"
    
    @State var likedButton: Bool = false
    
    var body: some View {
        
        GeometryReader { geo in
            
            let minY = geo.frame(in: .global).minY
            let startScreen: CGFloat = 575
            
            VStack(alignment: .leading, spacing: 24) {
                
                Divider().background(Color.gray).padding(.vertical, 10)
                
                HStack(alignment: .lastTextBaseline) {
                    
                    VStack(alignment: .leading, spacing: 3) {
                        
                        Text("MacBook Air")
                            .font(.title).bold()
                        
                        Text("M1 - 2020")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Text("$999")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                }
                
                
                HStack {
                    
                    ForEach(colors, id: \.self) { color in
                        
                        Button(action: {
                            
                            selectedColor = color
                            
                        }, label: {
                            
                            Circle().fill(Color(color)).frame(width: 25, height: 25)
                            Text(color)
                        })
                        .padding(.horizontal, 13)
                        .padding(.vertical, 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedColor == color ? Color.black.opacity(0.6) : Color.black.opacity(0.1), lineWidth: 2)
                        )
                        
                        if color != colors.last {
                            Spacer(minLength: 0)
                        }
                    }
                }
                
                HStack {
                    
                    ForEach(sizes, id: \.self) { size in
                        
                        Button(action: {
                            
                            selectedSize = size
                            
                        }, label: {
                            
                            Text(size)
                        })
                        .frame(width: UIScreen.screenWidth / 2.3)
                        .padding(.vertical, 12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedSize == size ? Color.black.opacity(0.6) : Color.black.opacity(0.1), lineWidth: 2)
                        )
                        
                        if size != sizes.last {
                            Spacer(minLength: 0)
                        }
                    }
                }
                
                
                
                VStack(alignment: .leading, spacing: 18) {
                    
                    Text("Description")
                        .bold()
                    
                    Text("• All-Day Battery Life – Go longer than ever with up to 18 hours of battery life.\n• Powerful Performance – Take on everything from professional-quality editing to action-packed gaming with ease. The Apple M1 chip with an 8-core CPU delivers up to 3.5x faster performance than the previous generation while using way less power.\n• Superfast Memory – 8GB of unified memory makes your entire system speedy and responsive. That way it can support tasks like memory-hogging multitab browsing and opening a huge graphic file quickly and easily.\n• Stunning Display – With a 13.3” Retina display, images come alive with new levels of realism. Text is sharp and clear, and colors are more vibrant.\n• Why Mac – Easy to learn. Easy to set up. Astoundingly powerful. Intuitive. Packed with apps to use right out of the box. Mac is designed to let you work, play, and create like never before.\n• Simply Compatible – All your existing apps work, including Adobe Creative Cloud, Microsoft 365, and Google Drive. Plus you can use your favorite iPhone and iPad apps directly on macOS. Altogether you’ll have access to the biggest collection of apps ever for Mac. All available on the App Store.\n• Easy to Learn – If you already have an iPhone, MacBook Air feels familiar from the moment you turn it on. And it works perfectly with all your Apple devices. Use your iPad to extend the workspace of your Mac, answer texts and phone calls directly on your Mac, and more.\n• Fanless Design – Your MacBook Air stays cool and runs quietly even while tackling intense workloads.\n• AppleCare – Every Mac comes with a one-year limited warranty and up to 90 days of complimentary technical support. Get AppleCare+ to extend your coverage and reduce the stress and cost of unexpected repairs.\n• Environmentally Friendly – MacBook Air is made with a 100% recycled aluminum enclosure and uses less energy for a smaller carbon footprint.")
                }
                .lineSpacing(6)
                
                Spacer(minLength: 0)
                
                HStack {
                    Button(action: {
                        
                        likedButton.toggle()
                    }, label: {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 25))
                                .foregroundColor(likedButton ? Color.red : Color.darkGray)
                           })
                        .frame(width: 60, height: 60)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black.opacity(0.2), lineWidth: 2)
                        )
                    Spacer()
                    Button(action: {}, label: {
                            HStack {
                                Text("Add to cart")
                                Image(systemName: "cart")
                                    .font(.system(size: 25))
                                
                            }
                           })
                        .frame(width: 300, height: 60)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black.opacity(0.2), lineWidth: 2)
                        )
                }
            }
            .foregroundColor(.darkGray)
            .padding(.horizontal, 20)
            .offset(y: minY < startScreen ? 0 : minY - startScreen)
            .opacity(minY < startScreen ? 1 : 0)
            .animation(.easeIn)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
//        DetailView()
        ContentView()
    }
}
