import SwiftUI
import Combine

struct ProdutorPerfilPage: View {
    @StateObject private var viewModel = ProdutorPerfilViewModel()
    var producerId: String
    
    var body: some View {
        VStack {
            if let producer = viewModel.producer {
                ScrollView {
                    VStack(spacing: 20) {
                        // Foto de perfil do produtor
                        if let url = URL(string: producer.profilePicture) {
                            AsyncImage(url: url) { image in
                                image.resizable()
                                     .aspectRatio(contentMode: .fill)
                                     .frame(width: 100, height: 100)
                                     .clipShape(Circle())
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        
                        // Nome do produtor
                        Text(producer.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        // Bio do produtor
                        Text(producer.bio)
                            .font(.body)
                            .padding(.horizontal)
                        
                        // Sessões de imersões, lives e newsletters
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Imersões (\(producer.immersionsCount))")
                                .font(.headline)
                            ForEach(producer.immersions) { immersion in
                                Text(immersion.title)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                            }
                        }
                        .padding(.horizontal, 32)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Lives (\(producer.livesCount))")
                                .font(.headline)
                            ForEach(producer.lives) { live in
                                Text(live.title)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                            }
                        }
                        .padding(.horizontal, 32)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Newsletters (\(producer.newslettersCount))")
                                .font(.headline)
                            ForEach(producer.newsletters) { newsletter in
                                Text(newsletter.title)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                            }
                        }
                        .padding(.horizontal, 32)
                        
                        // Sessão sobre o produtor
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Sobre o Produtor")
                                .font(.headline)
                            Text(producer.bio)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                        }
                        .padding(.horizontal, 32)
                    }
                }
            } else {
                ProgressView()
                    .onAppear {
                        viewModel.fetchProducer(producerId: producerId)
                    }
            }
        }
        .navigationTitle("Perfil do Produtor")
    }
}

class ProdutorPerfilViewModel: ObservableObject {
    @Published var producer: Producer?
    private var cancellables = Set<AnyCancellable>()
    
    func fetchProducer(producerId: String) {
        guard let url = URL(string: "https://api.example.com/producers/\(producerId)") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Producer.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching producer: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] producer in
                self?.producer = producer
            })
            .store(in: &cancellables)
    }
}

struct Producer: Identifiable, Codable {
    var id: String
    var name: String
    var profilePicture: String
    var bio: String
    var trailerUrl: String
    var immersionsCount: Int
    var livesCount: Int
    var newslettersCount: Int
    var immersions: [Content]
    var lives: [Live]
    var newsletters: [Newsletter]
}

struct Content: Identifiable, Codable {
    var id: String
    var title: String
}

struct Live: Identifiable, Codable {
    var id: String
    var title: String
}

struct Newsletter: Identifiable, Codable {
    var id: String
    var title: String
}

struct ProdutorPerfilPage_Previews: PreviewProvider {
    static var previews: some View {
        ProdutorPerfilPage(producerId: "1")
    }
}