import SwiftUI

struct LivesPage: View {
    @State private var lives: [Live] = []
    
    var body: some View {
        List(lives) { live in
            VStack(alignment: .leading) {
                Text(live.title)
                    .font(.headline)
                Text(live.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Lives")
        .onAppear {
            // Carregar lives do backend
            loadLives()
        }
    }
    
    func loadLives() {
        // Simulação de carregamento de dados do backend
        lives = [
            Live(id: "live1", title: "Live 1", description: "Descrição da live 1"),
            Live(id: "live2", title: "Live 2", description: "Descrição da live 2")
        ]
    }
}

struct Live: Identifiable {
    var id: String
    var title: String
    var description: String
}

struct LivesPage_Previews: PreviewProvider {
    static var previews: some View {
        LivesPage()
    }
}