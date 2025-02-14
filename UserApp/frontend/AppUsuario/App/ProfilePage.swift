import SwiftUI

struct ProfilePage: View {
    @State private var name: String = "Nome do Usuário"
    @State private var email: String = "email@exemplo.com"
    @State private var age: String = "25"
    @State private var developmentDays: Int = 10 // Exemplo de dias de desenvolvimento
    
    var body: some View {
        VStack {
            HStack {
                // Botão para voltar ao menu principal
                Button(action: {
                    // Ação para voltar ao menu principal
                }) {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding()
                }
                
                Spacer()
                
                // Botão para editar o perfil
                Button(action: {
                    // Ação para editar o perfil
                }) {
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding()
                }
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            Spacer()
            
            // Foto de perfil
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.bottom, 20)
            
            // Informações do perfil
            Text(name)
                .font(.title)
                .foregroundColor(.white)
                .padding(.bottom, 10)
            
            Text("Idade: \(age)")
                .font(.title2)
                .foregroundColor(.white)
                .padding(.bottom, 10)
            
            Text(email)
                .font(.title2)
                .foregroundColor(.white)
                .padding(.bottom, 20)
            
            // Direcionamentos para abas
            VStack(spacing: 20) {
                NavigationLink(destination: DevelopmentPage()) {
                    Text("Desenvolvimento")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.8))
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                }
                
                NavigationLink(destination: LanguagePage()) {
                    Text("Idioma")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.8))
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                }
                
                NavigationLink(destination: PaymentPage()) {
                    Text("Pagamentos")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.8))
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            
            // Menu grande para meta de desenvolvimento
            VStack {
                Text("Meta de Desenvolvimento")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                
                Text("Você está a \(developmentDays) dias da sua meta de desenvolvimento")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            
            Spacer()
        }
        .background(Color.blue.edgesIgnoringSafeArea(.all))
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}