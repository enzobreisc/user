import SwiftUI

struct AppInfoPage: View {
    @State private var selection = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            // Logo do aplicativo centralizado
            Image(systemName: "app.fill")
                .resizable()
                .frame(width: 120, height: 120)
                .foregroundColor(.blue)
                .padding(.bottom, 40)
            
            // Carrossel arredondado com melhor disposição do texto
            TabView(selection: $selection) {
                InfoCard(text1: "A User converte seu tempo de scrolling para", text2: "imersões de sua preferência")
                    .tag(0)
                
                InfoCard(text1: "Algumas imersões bloqueiam", text2: "aplicativos distrativos")
                    .tag(1)
                
                InfoCard(text1: "Você pode personalizar", text2: "seu tempo de imersão")
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(height: 250)
            
            Spacer()
            
            // Botão de Continuar só aparece na última página do carrossel
            if selection == 2 {
                NavigationLink(destination: MainMenuPage()) {
                    Text("Continuar")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200)
                        .background(Color.blue)
                        .cornerRadius(25)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                }
                .padding(.bottom, 50)
            }
        }
        .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
    }
}

// Estrutura para cada slide do carrossel
struct InfoCard: View {
    let text1: String
    let text2: String
    
    var body: some View {
        VStack {
            Text(text1)
                .font(.system(size: 18))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            Text(text2)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
        }
        .frame(width: 280, height: 180)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
        .padding()
    }
}

struct AppInfoPage_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoPage()
    }
}
