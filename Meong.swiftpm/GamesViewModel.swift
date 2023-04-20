//
//  GamesViewModel.swift
//  Meong
//
//  Created by Muhammad Naufal Nabiel on 19/04/23.
//

import Foundation

final class GamesViewModel: ObservableObject{
    @Published var stage = 0
    @Published var foodLocation: CGPoint = CGPoint(x: CGFloat.random(in: 150.0...1000), y: CGFloat.random(in: 0.0...600))
    @Published var foodNumber = 10
    
    func addStage(){
        stage += 1
    }
    
    func reduceFood(){
        foodNumber -= 1
    }
    
}
