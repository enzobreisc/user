import SwiftUI

struct InicialPage: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Gradiente de fundo
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.2), Color.blue.opacity(0.9)]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                VStack {
                    Spacer()
                    
                    // Nome do aplicativo
                    VStack {
                        Text("USER")
                            .font(.system(size: 66, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.top, 80)
                        
                        Text("Person")
                            .font(.system(size: 20))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    
                    // Logo do aplicativo
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 180, height: 180)
                        .padding(.vertical, 70)
                        .foregroundColor(.white)
                    
                    // Botão de Login
                    NavigationLink(destination: LoginPage()) {
                        Text("Login")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 250)
                            .background(Color.blue)
                            .cornerRadius(25)
                            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                    }
                    .padding(.bottom, 20)
                    
                    // Botão de Cadastro
                    NavigationLink(destination: SignUpPage()) {
                        Text("Cadastro")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.blue)
                            .padding()
                            .frame(width: 250)
                            .background(Color.white)
                            .cornerRadius(25)
                            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                    }
                    .padding(.bottom, 20)
                    
                    // Texto de suporte
                    Text("Problemas de login/cadastro?")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.8))
                    
                    NavigationLink(destination: SupportPage()) {
                        Text("Clique aqui para o suporte")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.blue)
                    }
                    .padding(.bottom, 50)
                    
                    Spacer()
                }
            }
        }
    }
}

struct InicialPage_Previews: PreviewProvider {
    static var previews: some View {
        InicialPage()
    }
}

