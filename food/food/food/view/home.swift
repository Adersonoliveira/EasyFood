//
//  home.swift
//  food
//
//  Created by Turma02-1 on 21/05/24.
//

import SwiftUI

struct home: View {
    var body: some View {
        NavigationStack{
            ZStack {
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    Spacer()
                    NavigationLink(
                        destination: login(),
                        label:{
                            Text("Log in")
                                .frame(
                                    width: 200,
                                    height: 50,
                                    alignment: .center
                                )
                                .foregroundColor(.white)
                                .background(Color.purple)
                                .cornerRadius(30)
                            
                        }
                    )
                    
                    Spacer()
                    HStack{
                        NavigationLink(
                            destination: cadastro(),
                            label:{
                                Text("Cadastre-se")
                                    .frame(
                                        width: 200,
                                        height: 50,
                                        alignment: .center
                                    )
                                    .foregroundColor(.blue)
                                    .cornerRadius(30)
                                
                            }
                        )
                    }
                }
                
            }
            
        }
    }
}
#Preview {
    home()
}
