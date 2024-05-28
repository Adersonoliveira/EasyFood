//
//  pedidofinalizado.swift
//  food
//
//  Created by Turma02-1 on 22/05/24.
//

import SwiftUI

struct pedidofinalizado: View {
    var body: some View {
        ZStack{
            VStack{
                Image("ok")
                    .resizable()
                    .frame(width:250,height: 350)
                    .cornerRadius(20)
                    .padding(100)
                
                VStack{
                    Text("pedidofinalizacao")
                    NavigationLink(
                        destination: Pagamento(),
                        label:{
                            Text("finalizar")
                                .frame(
                                    width: 100,
                                    height: 20,
                                    alignment: .center
                                )
                                .foregroundColor(.white)
                                .background(Color.purple)
                                .cornerRadius(8)
                        }
                    )
                }
                
            }
        }
    }
}

#Preview {
    pedidofinalizado()
}

