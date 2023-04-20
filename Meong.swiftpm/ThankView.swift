//
//  ThankView.swift
//  Meong
//
//  Created by Muhammad Naufal Nabiel on 20/04/23.
//

import SwiftUI

struct ThankView: View {
    var body: some View {
        VStack (alignment: .center){
            Text("Thank You for Playing")
                .bold()
                .font(.system(size: 72))
        }.navigationBarBackButtonHidden(true)
        
    }
}

struct ThankView_Previews: PreviewProvider {
    static var previews: some View {
        ThankView()
    }
}
