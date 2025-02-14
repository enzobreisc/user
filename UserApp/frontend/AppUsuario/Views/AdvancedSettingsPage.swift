import SwiftUI

struct AdvancedSettingsPage: View {
    var body: some View {
        VStack {
            Text("Configurações Avançadas")
                .font(.largeTitle)
                .padding()
            
            // Adicione aqui as configurações avançadas
            Spacer()
        }
        .navigationTitle("Configurações Avançadas")
    }
}

struct AdvancedSettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedSettingsPage()
    }
}