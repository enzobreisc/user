import SwiftUI

struct FeedbackPage: View {
    @State private var feedbackText: String = ""
    
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
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            Spacer()
            
            // Campo de feedbacks
            TextEditor(text: $feedbackText)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.blue, lineWidth: 1)
                )
                .padding(.horizontal, 32)
                .padding(.bottom, 20)
            
            // Botão de enviar
            Button(action: {
                // Ação para enviar feedback
            }) {
                Text("Enviar")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.blue)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(25)
                    .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 20)
            
            Spacer()
            
            // Logo do aplicativo
            HStack {
                Image(systemName: "app.fill")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 100)
                    .padding(.leading, 20)
                
                Spacer()
            }
            .padding(.bottom, 20)
        }
        .background(Color.blue.edgesIgnoringSafeArea(.all))
    }
}

struct FeedbackPage_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackPage()
    }
}