import SwiftUI

struct carrinho: View {
    
    @ObservedObject var global = Global.shared
    
    var total: Double {
        var total = 0.0
        
        for produto in global.selectedProducts {
            if let valorString = produto.valoralimento, let valor = Double(valorString) {
                total += valor
            }
        }
        
        for bebida in global.selectedbebida {
            if let valorString = bebida.valorbebida, let valor = Double(valorString) {
                total += valor
            }
        }
        
        return total
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ForEach(global.selectedProducts, id: \.self) { produto in
                        HStack {
                            AsyncImage(url: URL(string: produto.image!)) { image in
                                image
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 100, height: 100)
                            } placeholder: {
                                Color.gray
                                    .frame(width: 100, height: 100)
                            }
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(produto.nomealimento!)
                                    .font(.headline)
                                Text("Valor R$:\(produto.valoralimento!)")
                                    .font(.subheadline)
                            }
                            
                            Spacer()
                            
                            HStack(spacing: 10) {
                                Button(action: {
                                    // Lógica para aumentar a quantidade do produto
                                }) {
                                    Image(systemName: "plus.circle")
                                        .foregroundColor(.blue)
                                }
                                Button(action: {
                                    global.selectedProducts.removeAll(where: { $0 == produto })
                                }) {
                                    Image(systemName: "minus.circle")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                    }
                    
                    // Adicionando bebidas selecionadas ao carrinho
                    ForEach(global.selectedbebida, id: \.self) { bebida in
                        HStack {
                            AsyncImage(url: URL(string: bebida.image!)) { image in
                                image
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 100, height: 100)
                            } placeholder: {
                                Color.gray
                                    .frame(width: 100, height: 100)
                            }
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(bebida.nomebebida!)
                                    .font(.headline)
                                Text("Valor R$:\(bebida.valorbebida!)")
                                    .font(.subheadline)
                            }
                            
                            Spacer()
                            
                            HStack(spacing: 10) {
                                Button(action: {
                                    // Lógica para aumentar a quantidade da bebida
                                }) {
                                    Image(systemName: "plus.circle")
                                        .foregroundColor(.blue)
                                }
                                Button(action: {
                                    global.selectedbebida.removeAll(where: { $0 == bebida })
                                }) {
                                    Image(systemName: "minus.circle")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                    }
                }
            }
            
            VStack {
                Spacer()
                Text("Total: R$ \(String(format: "%.2f", total))")
                    .bold()
                    .frame(width: 250, height: 50)
                    .padding(.horizontal)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                NavigationLink(destination: Pagamento()) {
                    Text("Finalizar Pedido")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.purple)
                        .cornerRadius(8)
                }
                .padding()
            }
        }
        .padding(.horizontal)
    }
}

struct Carrinho_Previews: PreviewProvider {
    static var previews: some View {
        carrinho()
    }
}
