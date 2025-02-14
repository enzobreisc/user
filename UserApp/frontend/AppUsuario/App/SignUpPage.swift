import SwiftUI

struct SignUpPage: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var birthDate: String = ""
    @State private var phone: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var dragOffset: CGFloat = 0
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var profileImage: Image? = nil
    @State private var isImagePickerPresented: Bool = false
    
    private let maxDrag: CGFloat = 250
    
    var body: some View {
        VStack {
            Spacer()
            
            // Área interativa para adicionar foto de perfil
            Button(action: {
                isImagePickerPresented.toggle()
            }) {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                } else {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 100, height: 100)
                        .overlay(
                            Image(systemName: "camera.fill")
                                .foregroundColor(.blue)
                        )
                }
            }
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(image: $profileImage)
            }
            .padding(.bottom, 20)
            
            Text("Cadastre-se para começar sua jornada de imersão.")
                .font(.system(size: 18, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(.blue)
                .padding(.horizontal, 32)
            
            Group {
                TextField("Nome completo", text: $name)
                TextField("E-mail", text: $email)
                TextField("Nascimento", text: $birthDate)
                TextField("Telefone", text: $phone)
                SecureField("Senha", text: $password)
                SecureField("Confirmar Senha", text: $confirmPassword)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal, 32)
            .padding(.bottom, 10)
            
            // Botão deslizante
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 25)
                    .fill(dragOffset >= maxDrag ? Color.green : Color.blue)
                    .frame(width: 300, height: 60)
                    .shadow(radius: 5)
                
                Text("Arraste para se cadastrar")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 50, height: 50)
                    .offset(x: dragOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                let newOffset = min(max(gesture.translation.width, 0), maxDrag)
                                dragOffset = newOffset
                            }
                            .onEnded { _ in
                                if dragOffset >= maxDrag {
                                    if validateFields() {
                                        showAlert = true
                                        alertMessage = "Cadastro realizado com sucesso!"
                                    } else {
                                        showAlert = true
                                        alertMessage = "Por favor, preencha todos os campos corretamente."
                                    }
                                }
                                dragOffset = 0
                            }
                    )
            }
            .padding(.bottom, 50)
            
            Spacer()
        }
        .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Aviso"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    func validateFields() -> Bool {
        let nameComponents = name.split(separator: " ")
        guard nameComponents.count >= 2 else { return false }
        
        guard email.contains("@") && email.contains(".") else { return false }
        
        let birthDatePattern = #"^\d{2}/\d{2}/\d{4}$"#
        guard let _ = birthDate.range(of: birthDatePattern, options: .regularExpression) else { return false }
        
        let phonePattern = #"^\(\d{2}\) \d{4,5}-\d{4}$"#
        guard let _ = phone.range(of: phonePattern, options: .regularExpression) else { return false }
        
        guard password == confirmPassword && !password.isEmpty else { return false }
        
        return true
    }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}