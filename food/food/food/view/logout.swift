//
//  logout.swift
//  food
//
//  Created by Turma02-1 on 28/05/24.
//

import SwiftUI

struct logout: View {
    var body: some View {
        ZStack {
            Image("bora")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack{
                NavigationLink(
                    destination: login(),
                    label:{
                        Text("log-out")
                            .frame(
                                width: 100,
                                height: 50,
                                alignment: .center
                            )
                            .foregroundColor(.white)
                            .background(Color.purple)
                            .cornerRadius(30)
                            
                    }
                )
            }
        }
    }
}

#Preview {
    logout()
}
