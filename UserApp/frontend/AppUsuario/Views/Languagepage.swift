import SwiftUI

struct LanguagePage: View {
    @State private var selectedLanguage: String = "Português"
    
    let languages = ["Português", "Inglês", "Espanhol", "Francês", "Alemão"]
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            // Título da página
            Text("Configurações de Idioma")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            
            // Lista de opções de idiomas
            List {
                ForEach(languages, id: \.self) { language in
                    HStack {
                        Text(language)
                            .font(.system(size: 18))
                            .foregroundColor(.blue)
                        
                        Spacer()
                        
                        if language == selectedLanguage {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedLanguage = language
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
            .padding(.horizontal, 32)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Idioma")
        .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
    }
}

struct LanguagePage_Previews: PreviewProvider {
    static var previews: some View {
        LanguagePage()
    }
}