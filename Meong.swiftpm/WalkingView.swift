//
//  WalkingView.swift
//  Meong
//
//  Created by Muhammad Naufal Nabiel on 19/04/23.
//

import SwiftUI

struct WalkingView: View {
    
    @State private var location: CGPoint = CGPoint(x: 500 , y: 500)
    @State private var foodLocation: CGPoint = CGPoint(x: CGFloat.random(in: 150.0...1000), y: CGFloat.random(in: 150.0...600))
    @State private var foodEaten = 0
    @State private var catImage = "catFullBodyLeft"
    @State private var catFacts = ["Help Meong find her food.",
        "A cat’s fur can help regulate their body temperature.",
        "Cats sleep an average of 12-16 hours per day.",
        "Cats have scent glands on their cheeks and paws that they use to mark their territory.",
        "Cat's Purring can influence emotion in humans.",
        "Cats can jump up to six times their length in one leap"]
        
    var body: some View {
        NavigationView{
            ZStack {
                VStack (alignment: .center) {
                    ZStack{
                        VStack{
                            Text("\(catFacts[foodEaten])")
                                .bold()
                                .font(.system(size: 60))
                                .padding()
                                .multilineTextAlignment(.center)
                            Text("Food Left: \(5 - foodEaten)")
                            Spacer()
                        }
                        Image("\(catImage)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400, height: 400)
                            .position(location)
                    }
                }
                if foodEaten < 5 {
                    Image("playButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .position(foodLocation)
                }else{
                    Button {} label: {
                        NavigationLink(destination: FaceView()) {
                            Image("playButton")
                        }
                    }
                }
                HStack{
                    VStack{
                        Spacer()
                        Button (action: {
                            checkPosition()
                        }){
                            Text("Eat")
                                .foregroundColor(.white)
                                .bold()
                                .frame(width: 100)
                        }.buttonStyle(.borderedProminent)
                            .controlSize(.large)
                            .tint(Color(red: 89/255, green: 203/255, blue: 0/255))
                            .font(.title3)
                            .offset(x:50, y:-100)
                    }
                    Spacer()
                    VStack {
                        Spacer()
                        VStack{
                            Button (action: {
                                if location.y > 0{
                                    location.y -= 20
                                }else{
                                    location.x -= 0
                                }
                                
                             
                            }){
                                Image("arrow.up.circle.fill").resizable()
                                    .foregroundColor(.yellow)
                                    .frame(width: 100, height: 100)
                                    .scaledToFit()

                            }.simultaneousGesture(DragGesture(minimumDistance: 0)
                                    .onChanged({ _ in
                                        if location.y > 0{
                                            location.y -= 10
                                        }else{
                                            location.x -= 0
                                        }
                                    })
                                        .onEnded({ _ in
                                            location.y -= 0
                                            
                                        }))
                            
                            
                            HStack{
                                Button (action: {
                                    if catImage != "catFullBodyLeft"{
                                        catImage = "catFullBodyLeft"
                                    }
                                    if location.x > 150{
                                        location.x -= 20
                                       
                                    }else{
                                        location.x -= 0
                                    }
                                }){
                                    Image("arrow.backward.circle.fill").resizable()
                                        .foregroundColor(.yellow)
                                        .frame(width: 100, height: 100)
                                        .scaledToFit()
                                }.controlSize(.large)
                                    .tint(Color(red: 89/255, green: 203/255, blue: 0/255))
                                    .font(.title3)
                                    .simultaneousGesture(DragGesture(minimumDistance: 0)
                                        .onChanged({ _ in
                                            if catImage != "catFullBodyLeft"{
                                                catImage = "catFullBodyLeft"
                                            }
                                            if location.x > 150{
                                                location.x -= 10
                                            }else{
                                                location.x -= 0
                                            }
                                        })
                                            .onEnded({ _ in
                                                location.y -= 0
                                                
                                            }))
                                
                                
                                Button (action: {
                                    if catImage != "catFullBodyRight"{
                                        catImage = "catFullBodyRight"
                                    }
                                    if location.x < 1000{
                                        location.x += 20
                                   
                                    }else{
                                        location.x += 0
                                    }
                                }){
                                    Image("arrow.forward.circle.fill").resizable()
                                        .foregroundColor(.yellow)
                                        .frame(width: 100, height: 100)
                                        .scaledToFit()
                                }.controlSize(.large)
                                    .tint(Color(red: 89/255, green: 203/255, blue: 0/255))
                                    .font(.title3)
                                    .simultaneousGesture(DragGesture(minimumDistance: 0)
                                        .onChanged({ _ in
                                            if catImage != "catFullBodyRight"{
                                                catImage = "catFullBodyRight"
                                            }
                                            if location.x < 1000{
                                                location.x += 20
                                            }else{
                                                location.x += 0
                                            }
                                        })
                                            .onEnded({ _ in
                                                location.y -= 0
                                                
                                            }))
                            }
                            Button (action: {
                                if location.y < 550{
                                    location.y += 20
                                   
                                }else{
                                    location.x += 0
                                }
                            }){
                                Image("arrow.down.circle.fill").resizable()
                                    .foregroundColor(.yellow)
                                    .frame(width: 100, height: 100)
                                    .scaledToFit()
                            }
                                .controlSize(.large)
                                .tint(Color(red: 89/255, green: 203/255, blue: 0/255))
                                .font(.title3)
                                .simultaneousGesture(DragGesture(minimumDistance: 0)
                                    .onChanged({ _ in
                                        if location.y < 550{
                                            location.y += 10
                                        }else{
                                            location.y += 0
                                        }
                                    })
                                        .onEnded({ _ in
                                            location.y -= 0
                                           
                                        }))
                        }
                    }.padding(50)
                }
            }}.navigationBarBackButtonHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
                
        }
        
    func checkPosition(){
        if abs(location.y - foodLocation.y) < 200 && abs(location.x - foodLocation.x) < 200{
            print("Food Touched")
            generateRandomLocation()
            
        }
    }
    func generateRandomLocation(){
        foodLocation.x = CGFloat.random(in: 150.0...1000)
        foodLocation.y = CGFloat.random(in: 150.0...700)
        foodEaten += 1
    }
    
    
    }




struct WalkingView_Previews: PreviewProvider {
    static var previews: some View {
        WalkingView()
    }
}
