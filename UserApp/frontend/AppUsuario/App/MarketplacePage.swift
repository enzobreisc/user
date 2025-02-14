import SwiftUI

struct MarketplacePage: View {
    @State private var trendingImmersions: [Content] = []
    @State private var popularImmersions: [Content] = []
    @State private var freeImmersions: [Content] = []
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Campo de Pesquisa
                HStack {
                    TextField("Pesquisar", text: $searchText)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                        .padding(.horizontal, 16)
                    
                    Button(action: {
                        // Ação de pesquisa
                    }) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.trailing, 16)
                }
                .padding(.top, 20)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Seção de Imersões em Alta
                        Text("Imersões em Alta")
                            .font(.title)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(trendingImmersions) { content in
                                    NavigationLink(destination: ContentDetailPage(content: content)) {
                                        VStack {
                                            Text(content.title)
                                                .font(.headline)
                                            Text(content.description)
                                                .font(.subheadline)
                                        }
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        // Seção de Imersões Populares
                        Text("Imersões Populares")
                            .font(.title)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(popularImmersions) { content in
                                    NavigationLink(destination: ContentDetailPage(content: content)) {
                                        VStack {
                                            Text(content.title)
                                                .font(.headline)
                                            Text(content.description)
                                                .font(.subheadline)
                                        }
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        // Seção de Imersões Gratuitas
                        Text("Imersões Gratuitas")
                            .font(.title)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(freeImmersions) { content in
                                    NavigationLink(destination: ContentDetailPage(content: content)) {
                                        VStack {
                                            Text(content.title)
                                                .font(.headline)
                                            Text(content.description)
                                                .font(.subheadline)
                                        }
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                }
                .navigationTitle("Marketplace")
                .onAppear {
                    loadContents()
                }
            }
        }
    }
    
    func loadContents() {
        // Simulação de carregamento de dados do backend
        trendingImmersions = [
            Content(id: "content1", title: "Mentoria 1", description: "Descrição da mentoria 1", topic: "Tópico 1", videoUrl: "url_to_video"),
            Content(id: "content2", title: "Mentoria 2", description: "Descrição da mentoria 2", topic: "Tópico 2", videoUrl: "url_to_video")
        ]
        
        popularImmersions = [
            Content(id: "content3", title: "Mentoria 3", description: "Descrição da mentoria 3", topic: "Tópico 3", videoUrl: "url_to_video"),
            Content(id: "content4", title: "Mentoria 4", description: "Descrição da mentoria 4", topic: "Tópico 4", videoUrl: "url_to_video")
        ]
        
        freeImmersions = [
            Content(id: "content5", title: "Mentoria 5", description: "Descrição da mentoria 5", topic: "Tópico 5", videoUrl: "url_to_video"),
            Content(id: "content6", title: "Mentoria 6", description: "Descrição da mentoria 6", topic: "Tópico 6", videoUrl: "url_to_video")
        ]
    }
}

struct Content: Identifiable {
    var id: String
    var title: String
    var description: String
    var topic: String
    var videoUrl: String
}

struct MarketplacePage_Previews: PreviewProvider {
    static var previews: some View {
        MarketplacePage()
    }
}