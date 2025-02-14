import SwiftUI

struct MainMenuPage: View {
    @State private var searchText: String = ""
    @State private var showSettings: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Barra Superior
                HStack {
                    TextField("Pesquisar", text: $searchText)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                        .padding(.leading, 16)
                    
                    Button(action: {
                        showSettings.toggle()
                    }) {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                    }
                    .padding(.trailing, 16)
                    .popover(isPresented: $showSettings) {
                        SettingsMenu()
                    }
                }
                .padding(.top, 20)
                
                // Contador de Streak
                Text("Você está em sequência há 5 dias")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.blue)
                    .padding(.top, 10)
                
                Spacer()
                
                // Hub Central
                VStack {
                    Text("Dia 1 da Imersão")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.blue)
                        .padding(.top, 20)
                    
                    NavigationLink(destination: MarketplacePage()) {
                        VStack {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 100, height: 100)
                            Text("Adicionar Imersão")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(25)
                                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                        }
                        .padding()
                    }
                    
                    Text("Faltam 3 dias para a imersão ser lançada")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(25)
                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                
                Spacer()
                
                // Menu Inferior
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: LivePage()) {
                        Image(systemName: "video.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    Spacer()
                    
                    NavigationLink(destination: NewsletterPage()) {
                        Image(systemName: "newspaper.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    Spacer()
                    
                    NavigationLink(destination: NotificationsPage()) {
                        Image(systemName: "bell.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    Spacer()
                }
                .padding(.bottom, 10)
                
                NavigationLink(destination: ProfilePage()) {
                    Text("Perfil")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200)
                        .background(Color.purple)
                        .cornerRadius(25)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("Menu Principal")
        }
    }
}

struct SettingsMenu: View {
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink("Configurações de Conta", destination: ProfilePage())
            NavigationLink("Feedback", destination: FeedbackPage())
            NavigationLink("Notificações", destination: NotificationsPage())
            NavigationLink("Segurança e Privacidade", destination: PrivacyPage())
            NavigationLink("Suporte e Ajuda", destination: SupportPage())
            NavigationLink("Configurações Avançadas", destination: AdvancedSettingsPage())
        }
        .padding()
    }
}

struct MainMenuPage_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}