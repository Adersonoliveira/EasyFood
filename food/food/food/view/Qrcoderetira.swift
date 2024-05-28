import SwiftUI

struct QRCodeView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("Number pedido")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                Text("8945")
                    .frame(width: 120, height: 30)
                    .foregroundColor(.blue)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.purple, lineWidth: 1)
                    )
                
                Button("Copy code") {
                           showingAlert = true
                       }
                       .alert("Copied code", isPresented: $showingAlert) {
                           Button("OK", role: .cancel) { }
                       }
                Button("Close") {
                    dismiss()
                }
                .padding(120)
            }
        }
    }
}

struct Qrcoderetira: View {
    @State private var showingQRCode = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Spacer()
                VStack {
                    Spacer()
                    Text("Pedido realizado com sucesso")
                        .frame(
                            width: 300,
                            height: 50,
                            alignment: .center
                        )
                        .foregroundColor(.white)
                        .background(Color.purple)
                        .cornerRadius(15)
                    Image("ok")
                        .resizable()
                        .frame(width:250,height: 350)
                        .cornerRadius(20)
                        Spacer()
                    }
                Button("Identification Pedido") {
                    showingQRCode.toggle()
                }
                .sheet(isPresented: $showingQRCode) {
                    QRCodeView()
                }
                .frame(width: 160, height: 40)
                .padding(.horizontal)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.purple, lineWidth: 1)
                )
                
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                    Text("voltar ao inicio")
                        .frame(width: 145, height: 30)
                        .foregroundColor(.blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.purple, lineWidth: 1)
                        )
                }
                .padding(40)
                
            }
        }
    }
}

struct Qrcoderetira_Previews: PreviewProvider {
    static var previews: some View {
        Qrcoderetira()
    }
}
