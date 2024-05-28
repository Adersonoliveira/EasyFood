import SwiftUI

struct ContentView: View {
    @ObservedObject var global = Global.shared
    var body: some View {
        TabView {
            menuScreen()
                .tabItem {
                    Label("Menu", systemImage: "house")
                }
            carrinho()
                .badge(global.selectedProducts.count + global.selectedbebida.count)
                .tabItem {
                    Label("Carrinho", systemImage: "cart")
                        
                }
            Qrcoderetira()
                .tabItem {
                    Label("Pedido", systemImage: "qrcode")
                }
            logout()
                .tabItem {
                    Label("sair", systemImage: "arrowshape.right.circle")
                }

        }
    }
}

#Preview {
    ContentView()
}
