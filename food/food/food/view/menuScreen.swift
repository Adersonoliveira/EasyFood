import SwiftUI

class Global : ObservableObject {
    @Published  var selectedProducts: [alimento] = []
    @Published  var selectedbebida: [bebida] = []
    
    
    static let shared = Global()
}
struct menuScreen: View {
    @State private var isAnimating = false
    @StateObject var viewModel = ViewModel()
    @ObservedObject var global = Global.shared

    var body: some View {
        ZStack {
            VStack {
                Image("agora")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:400,height: 100)
                    .padding(.top,10)
                Text("Different Kind of Food")
                    .font(.title)
                    .bold()
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : -40)

                ScrollView {
                    VStack {
                        ForEach(viewModel.chars, id: \.self) { e in
                            HStack {
                                VStack(alignment: .leading, spacing: 12) {
                                    Text(e.nome!)
                                        .font(.headline)

                                    ForEach(e.alimento, id: \.self) { alimento in
                                        VStack {
                                            HStack {
                                                // Imagem à esquerda
                                                AsyncImage(url: URL(string: alimento.image!)) { image in
                                                    image
                                                        .resizable()
                                                        .clipShape(Circle())
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                .frame(width: 100, height: 100)

                                                // Informações à direita
                                                VStack(alignment: .leading) {
                                                    Text(alimento.nomealimento!)
                                                    Text("Valor R$:\(alimento.valoralimento!)")
                                                }
                                                Spacer()
                                            }

                                            // Botão "Add"
                                            Button(action: {
                                                global.selectedProducts.append(alimento)
                                            }, label: {
                                                Text("Add")
                                                    .frame(
                                                        width: 80,
                                                        height: 30,
                                                        alignment: .center
                                                    )
                                                    .foregroundColor(.white)
                                                    .background(Color.purple)
                                                    .cornerRadius(8)
                                                }
                                            )
                                            Divider()
                                        }
                                    }

                                    ForEach(e.bebida, id: \.self) { bebida in
                                        VStack {
                                            HStack {
                                                // Imagem à esquerda
                                                AsyncImage(url: URL(string: bebida.image!)) { image in
                                                    image
                                                        .resizable()
                                                        .clipShape(Circle())
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                .frame(width: 100, height: 100)

                                                // Informações à direita
                                                VStack(alignment: .leading) {
                                                    Text(bebida.nomebebida!)
                                                    Text("Valor R$:\(bebida.valorbebida!)")
                                                }
                                                Spacer()
                                            }

                                            // Botão "Add"
                                            Button(action: {
                                                global.selectedbebida.append(bebida)
                                    
                                            }, label: {
                                                Text("Add")
                                                    .frame(
                                                        width: 80,
                                                        height: 30,
                                                        alignment: .center
                                                    )
                                                    .foregroundColor(.white)
                                                    .background(Color.purple)
                                                    .cornerRadius(8)
                                                }
                                            )

                                            Divider()
                                        }
                                    }

                                }
                                .padding()
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5)) {
                isAnimating = true
            }
            viewModel.fetch()
        }
    }
}

#Preview {
    menuScreen()
}
