import SwiftUI

struct ContentDetailPage: View {
    var content: Content
    
    var body: some View {
        VStack {
            Text(content.title)
                .font(.largeTitle)
                .padding()
            
            Text(content.description)
                .font(.body)
                .padding()
            
            // Adicione o player de vídeo aqui
            Spacer()
        }
        .navigationTitle(content.title)
    }
}

struct Content: Identifiable {
    var id: String
    var title: String
    var description: String
    var topic: String
    var videoUrl: String
}

struct ContentDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailPage(content: Content(id: "content1", title: "Mentoria 1", description: "Descrição da mentoria 1", topic: "Tópico 1", videoUrl: "url_to_video"))
    }
}