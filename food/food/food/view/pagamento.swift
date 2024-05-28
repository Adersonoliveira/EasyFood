import SwiftUI

struct Pagamento: View {
    @State private var showingCreditCardDetailView = false
    @State private var showSavedMessage = false
    @State private var showingPixDetailView = false
    @State private var showCopiedMessage = false
    @ObservedObject var global = Global.shared

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                NavigationLink(destination: PixDetailView(isPresented: $showingPixDetailView, showCopiedMessage: $showCopiedMessage)) {
                    HStack {
                        Image("icone-pix")
                            .resizable()
                            .frame(width: 100, height: 90)
                        Text("Pix")
                            .bold()
                            
                    }
                }
               
                NavigationLink(destination: CreditCardDetailView(isPresented: $showingCreditCardDetailView, showSavedMessage: $showSavedMessage)) {
                    HStack {
                        Image("card")
                            .resizable()
                            .frame(width: 100, height: 90)
                        Text("Cartão")
                            .bold()
                        
                    }
                }

                Spacer()
                NavigationLink(destination: Qrcoderetira()) {
                    Text("Confirmar")
                        .frame(width: 200, height: 50)
                        .foregroundColor(.white)
                        .background(Color.purple)
                        .cornerRadius(8)
                        .padding()
                }
            }
            .navigationBarTitle("Pagamento")
            .alert(isPresented: $showSavedMessage) {
                Alert(title: Text("Salvo com sucesso"), message: nil, dismissButton: .default(Text("OK")))
            }
            .alert(isPresented: $showCopiedMessage) {
                Alert(title: Text("Copiado"), message: nil, dismissButton: .default(Text("OK")))
            }
            .onAppear 
            {
                global.selectedProducts.removeAll()
                global.selectedbebida.removeAll()
            }
        }
    }
}

struct PixDetailView: View {
    @Binding var isPresented: Bool
    @Binding var showCopiedMessage: Bool

    var body: some View {
        VStack(spacing: 20) {
            Image("qrcode")

            Spacer()

            Button(action: {
                showCopiedMessage = true
                isPresented = false
            }) {
                Text("Copiar")
            }
            .padding()
        }
        .padding()
        .navigationBarTitle("PIX")
    }
}

struct CreditCardDetailView: View {
    @Binding var isPresented: Bool
    @Binding var showSavedMessage: Bool
    @State private var cardNumber = ""
    @State private var cardNome = ""
    @State private var expirationDate = ""
    @State private var cvv = ""

    var body: some View {
        VStack(spacing: 20) {
            TextField("Número do Cartão", text: $cardNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Nome no Cartão", text: $cardNome)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Data de Expiração", text: $expirationDate)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("CVV", text: $cvv)
                .textFieldStyle(RoundedBorderTextFieldStyle())

              
            Image("card")
                .resizable()
                .frame(width: 180, height: 180)
            Button(action: {
                showSavedMessage = true
                isPresented = false
            }) {
                Text("Salvar")
            }
            .frame(width: 250, height: 50)
            .padding(.horizontal)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.purple, lineWidth: 1)
            )
            .padding()
        }
        .padding()
        .navigationBarTitle("Cartão de Crédito")
    }
}

struct Pagamento_Previews: PreviewProvider {
    static var previews: some View {
        Pagamento()
    }
}
