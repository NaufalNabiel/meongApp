//
//  TailView.swift
//  Meong
//
//  Created by Muhammad Naufal Nabiel on 20/04/23.
//

import SwiftUI

struct TailView: View {
    @State private var clickCount = 0
    @State private var isRight = false
    @State private var rotationAngle: Double = 0
    @State private var tailPosition = "tailLeft"
    @State private var catFacts = ["Play with Meong's tail to know more about her",
        "Cats use their tails for balance and communication.",
        "A cat's tail being puffed up can mean fear or aggression.",
        "Cats knead with their paws when they are happy or content.",
        "Some cats are hairless due to a genetic mutation.",
        "Cats greet one another through mutual sniffing."]
    var body: some View {
        ZStack {
            VStack (alignment: .center){
                Text("\(catFacts[clickCount])")
                    .bold()
                    .font(.system(size: 60))
                    .padding()
                    .multilineTextAlignment(.center)
                    .truncationMode(.tail)
                    .fixedSize(horizontal: false, vertical: true)
                Text("Click count: \(clickCount)")
                Spacer()
            }
            Spacer()
            VStack {
                Spacer()
                HStack{
                    Image("tailLeft")
                        .scaledToFill()
                        .rotationEffect(Angle(degrees: rotationAngle), anchor: .bottomLeading)
                        .ignoresSafeArea()
                    Spacer()
                }.onTapGesture {
                    isRight.toggle()
                    withAnimation(.easeInOut(duration: 0.6)) {
                        if isRight{
                            rotationAngle += 50
                        }else{
                            rotationAngle -= 50
                        }
                    }
                    rotationAngle = isRight ? 50 : 0
                    if clickCount < 5 {
                        clickCount += 1
                    }
                    
                }
            }
            if clickCount >= 5{
                Button {} label: {
                    NavigationLink(destination: ThankView()) {
                        Image("playButton")
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
        
       
    }
    
    
    struct TailView_Previews: PreviewProvider {
        static var previews: some View {
            TailView()
        }
    }
}
