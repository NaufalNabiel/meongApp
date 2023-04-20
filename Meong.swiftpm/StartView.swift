//
//  StartView.swift
//  Meong
//
//  Created by Muhammad Naufal Nabiel on 19/04/23.
//

import SwiftUI

struct StartView: View {
    var body: some View {
    
            VStack (alignment: .center){
                LottieView(lottieFile: "catBlink")
                    .frame(width:500, height: 500)
                    
            }
       
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
