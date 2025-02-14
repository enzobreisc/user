import SwiftUI

struct NotificationsPage: View {
    @State private var enableAppNotifications: Bool = true
    @State private var enableImmersionNotifications: Bool = true
    @State private var enableNewsletterNotifications: Bool = true
    @State private var selectedAppSound: String = "Padrão"
    @State private var selectedImmersionSound: String = "Padrão"
    @State private var selectedNewsletterSound: String = "Padrão"
    
    let soundOptions = ["Padrão", "Som 1", "Som 2", "Som 3", "Baixar Som..."]
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            // Ícone de música
            Image(systemName: "music.note")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .padding(.bottom, 20)
            
            // Texto explicativo
            Text("Personalize suas notificações e escolha a frequência de Hz para cada tipo de notificação.")
                .font(.system(size: 18, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(.blue)
                .padding(.horizontal, 32)
            
            // Caixa de seleção para notificações do aplicativo
            Toggle(isOn: $enableAppNotifications) {
                Text("Notificações do Aplicativo")
                    .font(.system(size: 18))
                    .foregroundColor(.blue)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
            .padding(.horizontal, 32)
            
            // Seleção de som para notificações do aplicativo
            Picker("Som de Notificação", selection: $selectedAppSound) {
                ForEach(soundOptions, id: \.self) { sound in
                    Text(sound).tag(sound)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
            .padding(.horizontal, 32)
            
            // Caixa de seleção para notificações de imersões
            Toggle(isOn: $enableImmersionNotifications) {
                Text("Notificações de Imersões")
                    .font(.system(size: 18))
                    .foregroundColor(.blue)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
            .padding(.horizontal, 32)
            
            // Seleção de som para notificações de imersões
            Picker("Som de Notificação", selection: $selectedImmersionSound) {
                ForEach(soundOptions, id: \.self) { sound in
                    Text(sound).tag(sound)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
            .padding(.horizontal, 32)
            
            // Caixa de seleção para notificações de newsletters
            Toggle(isOn: $enableNewsletterNotifications) {
                Text("Notificações de Newsletters")
                    .font(.system(size: 18))
                    .foregroundColor(.blue)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
            .padding(.horizontal, 32)
            
            // Seleção de som para notificações de newsletters
            Picker("Som de Notificação", selection: $selectedNewsletterSound) {
                ForEach(soundOptions, id: \.self) { sound in
                    Text(sound).tag(sound)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
            .padding(.horizontal, 32)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Notificações")
        .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
    }
}

struct NotificationsPage_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsPage()
    }
}