import SwiftUI

struct NewslettersPage: View {
    @State private var newsletters: [Newsletter] = []
    
    var body: some View {
        List(newsletters) { newsletter in
            VStack(alignment: .leading) {
                Text(newsletter.title)
                    .font(.headline)
                Text(newsletter.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Newsletters")
        .onAppear {
            // Carregar newsletters do backend
            loadNewsletters()
        }
    }
    
    func loadNewsletters() {
        // Simulação de carregamento de dados do backend
        newsletters = [
            Newsletter(id: "newsletter1", title: "Newsletter 1", description: "Descrição da newsletter 1"),
            Newsletter(id: "newsletter2", title: "Newsletter 2", description: "Descrição da newsletter 2")
        ]
    }
}

struct Newsletter: Identifiable {
    var id: String
    var title: String
    var description: String
}

struct NewslettersPage_Previews: PreviewProvider {
    static var previews: some View {
        NewslettersPage()
    }
}