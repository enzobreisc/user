import SwiftUI

struct InicialPage: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // Nome do aplicativo
                Text("USER")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.blue)
                    .padding(.top, 50)
                
                // Logo do aplicativo
                Image(systemName: "app.fill")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding(.vertical, 50)
                
                // Botão de Cadastro
                NavigationLink(destination: SignUpPage()) {
                    Text("Cadastro")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.blue)
                        .padding()
                        .frame(width: 200)
                        .background(Color.white)
                        .cornerRadius(25)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                }
                .padding(.bottom, 20)
                
                // Botão de Login
                NavigationLink(destination: LoginPage()) {
                    Text("Login")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200)
                        .background(Color.blue)
                        .cornerRadius(25)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                }
                .padding(.bottom, 20)
                
                // Botão de Suporte
                NavigationLink(destination: SupportPage()) {
                    Text("Falar com o Suporte")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.blue)
                        .padding()
                        .frame(width: 150)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
            .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
        }
    }
}

struct InicialPage_Previews: PreviewProvider {
    static var previews: some View {
        InicialPage()
    }
}