//
//  login.swift
//  food
//
//  Created by Turma02-1 on 21/05/24.
//

import SwiftUI

struct login: View {
    @State private var userName: String = ""
    @State private var senha: String = ""
    var body: some View {
        ZStack {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .frame(width:200,height: 200)
            
                VStack {
                    TextField("Username", 
                              text: $userName)
                            .frame(width: 250, height: 50)
                            .padding(.horizontal)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .textInputAutocapitalization(.never)
                            .padding()
                    SecureField("Password",
                              text: $senha)
                              .frame(width: 250, height: 50)
                              .padding(.horizontal)
                              .overlay(
                                  RoundedRectangle(cornerRadius: 20)
                                      .stroke(Color.gray, lineWidth: 1)
                              )
                              
                    HStack {
                        NavigationLink(
                            destination: ContentView(),
                            label:{
                                Text("Entrar")
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

                    }
                    .padding()
                }
            }
        
        }
    }
}

#Preview {
    login()
}
