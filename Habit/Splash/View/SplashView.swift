//
//  SplashView.swift
//  Habit
//
//  Created by osvaldo ferreira on 04/07/23.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        VStack{
            Group{
                switch viewModel.uiState{
                case .loading:
                  loadingView()
                case .goToSignInScreen:
                    signInScreen
                case .goToHomeScreen:
                    homeScreen
                case .error(let msg):
                    loadingView(error: msg)
                }
            }.onAppear(perform: viewModel.onAppear)
        }
    }
}

// Opcao 1: compartilhamento de objeto
//struct LoadingView :View{
//    var body: some View{
//        ZStack{
//            Image("logo")
//                .resizable()
//                .scaledToFit()
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .padding(20)
//                .background(Color.white)
//                .ignoresSafeArea()
//        }
//    }
//}

// Opcao 2: Variaveis em extensoes
//extension SplashView{
//    var loading: some View{
//        ZStack{
//            Image("logo")
//                .resizable()
//                .scaledToFit()
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .padding(20)
//                .background(Color.white)
//                .ignoresSafeArea()
//
//        }
//    }
//}

extension SplashView{
    var homeScreen: some View{
            setTitle(title:"Home")
    }
}

extension SplashView{
    var signInScreen: some View{
        setTitle(title: "Login")
    }
}

extension SplashView{
    func setTitle(title: String) -> some View{
            Text(title)
                .font(.system(size: 40,
                              weight: .bold,
                              design: .monospaced))
    }
}

// Opcao 3: Funcoes em extensoes
extension SplashView{
    func loadingView(error: String? = nil) -> some View{
        ZStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .background(Color.white)
                .ignoresSafeArea()
            
            if let error = error{
                Text("")
                    .alert(isPresented: .constant(true)){
                        Alert(title: Text("Habit"),
                              message: Text(error),
                              dismissButton: .default(Text("OK")){
                            //faz algo
                        })
                    }
            }
        }
    }
}

//extension SplashView{
//    func loadingViewError(error: String? = nil) -> some View{
//        ZStack{
//            if let error = error{
//                Text("")
//                    .alert(isPresented: .constant(true)){
//                        Alert(title: Text("Habit"),
//                              message: Text(error),
//                              dismissButton: .default(Text("OK")){
//                            //faz algo
//                        })
//                    }
//            }else{
//                loadingView()
//            }
//        }
//    }
//}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SplashViewModel()
        SplashView(viewModel: viewModel)
    }
}
