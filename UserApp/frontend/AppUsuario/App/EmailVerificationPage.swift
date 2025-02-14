import SwiftUI

struct EmailVerificationPage: View {
    @State private var codePart1: String = ""
    @State private var codePart2: String = ""
    @State private var codePart3: String = ""
    @State private var codePart4: String = ""
    @State private var navigateToMainMenu = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Spacer()
                
                // Texto de Instrução
                Text("Preencha os campos com o código enviado ao e-mail.")
                    .font(.system(size: 18, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 32)
                
                // Campos de Entrada de Código
                HStack(spacing: 10) {
                    TextField("", text: $codePart1)
                        .frame(width: 50, height: 50)
                        .font(.system(size: 24))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                    
                    TextField("", text: $codePart2)
                        .frame(width: 50, height: 50)
                        .font(.system(size: 24))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                    
                    TextField("", text: $codePart3)
                        .frame(width: 50, height: 50)
                        .font(.system(size: 24))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                    
                    TextField("", text: $codePart4)
                        .frame(width: 50, height: 50)
                        .font(.system(size: 24))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                }
                
                // Botão de Verificação
                Button(action: {
                    if validateCode() {
                        navigateToMainMenu = true
                    } else {
                        showAlert = true
                        alertMessage = "Código incorreto. Por favor, tente novamente."
                    }
                }) {
                    Text("Verificar")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200)
                        .background(Color.blue)
                        .cornerRadius(25)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Erro"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            .background(
                NavigationLink(destination: MainMenuPage(), isActive: $navigateToMainMenu) {
                    EmptyView()
                }
            )
        }
    }
    
    func validateCode() -> Bool {
        // Validação simples do código (pode ser substituída por uma validação real)
        return codePart1 == "1" && codePart2 == "2" && codePart3 == "3" && codePart4 == "4"
    }
}

struct EmailVerificationPage_Previews: PreviewProvider {
    static var previews: some View {
        EmailVerificationPage()
    }
}