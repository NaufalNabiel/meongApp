//
//  FaceView.swift
//  Meong
//
//  Created by Muhammad Naufal Nabiel on 20/04/23.
//

import SwiftUI

struct FaceView: View {
    @State private var clickCount = 0
    @State private var catFacts = [
        "Play with Meong to know more about her",
        "Cats use their whiskers like radar.",
        "A cat’s nose is as unique to a particular cat as a fingerprint is to a human - no two cats have the same nose",
        "A cat’s nose is their most important sense organ. Cats have 200 million scent receptors!",
        "Cats are also known to dislike the smell of citrus, mint, eucalyptus, lavender, and tea tree oil.",
        "Cats are obligate carnivores, which means they require meat in their diet to survive."]
    var body: some View {
        NavigationView{
            
            ZStack {
                VStack (alignment: .center){
                    ZStack{
                        VStack{
                            Text("\(catFacts[clickCount])")
                                .bold()
                                .font(.system(size: 48))
                                .padding()
                                .multilineTextAlignment(.center)
                                .truncationMode(.tail)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("Click count: \(clickCount)")
                            Spacer()
                        }
                        VStack{
                            Spacer()
                            Image("catFace")
                                .scaledToFill()
                                .ignoresSafeArea()
                                .onTapGesture {
                                    if clickCount < 5{
                                        clickCount += 1
                                    }else {
                                        clickCount += 0
                                    }
                                    
                                }
                        }
                        
                        
                    }
                    
                }
                if clickCount >= 5{
                    Button {} label: {
                        NavigationLink(destination: TailView()) {
                            Image("playButton").foregroundColor(.red)
                        }
                    }
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarBackButtonHidden(true)
    }
    
    struct FaceView_Previews: PreviewProvider {
        static var previews: some View {
            FaceView()
        }
    }
}
