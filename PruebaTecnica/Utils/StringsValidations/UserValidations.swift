//
//  UserValidations.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 8/8/24.

import Foundation
import FirebaseAuth
import FirebaseFirestore

class UserValidations {
    
    static func errorSignInMsg(errors:Error) -> String {
        if let error = errors as NSError? {
            let authErrorCode = AuthErrorCode(rawValue: error.code)
            switch authErrorCode {
            case .invalidEmail:
                return "La dirección de correo electrónico está mal formateada."
            case .wrongPassword:
                return "La contraseña es incorrecta."
            case .userNotFound:
                return "No se encontró ningún usuario con esa dirección de correo electrónico."
            case .userDisabled:
                return "La cuenta del usuario ha sido deshabilitada."
            case .tooManyRequests:
                return "Demasiadas solicitudes de inicio de sesión. Inténtalo de nuevo más tarde."
            case .operationNotAllowed:
                return "La operación no está permitida. Verifica la configuración de autenticación."
            case .invalidCredential:
                return "Las credenciales proporcionadas son inválidas."
            default:
                return "Error desconocido: \(error.localizedDescription)"
            }
        }else{
            return ""
        }
    }
    
    static func errorSignUpMsg(errors:Error)->String{
        if let error = errors as NSError? {
            let authErrorCode = AuthErrorCode(rawValue: error.code)
                switch authErrorCode {
                case .weakPassword:
                    return "La contraseña es demasiado débil."
                case .invalidEmail:
                    return "El correo electrónico no es válido."
                case .emailAlreadyInUse:
                    return "Este correo electrónico ya está en uso."
                case .operationNotAllowed:
                    return "Esta operación no está permitida."
                case .userDisabled:
                    return "Esta cuenta de usuario ha sido deshabilitada."
                case .requiresRecentLogin:
                        return "El usuario debe volver a iniciar sesión para realizar esta operación."
                    case .networkError:
                        return "Error de red. Verifica tu conexión a Internet."
                    case .userNotFound:
                        return "El usuario no fue encontrado."
                    case .wrongPassword:
                        return "La contraseña actual es incorrecta."
                default:
                   return "Error desconocido: \(error.localizedDescription)"
                }
            } else {
                return ""
            }
    }
    
    static func errorFirestoreMsg(errors:Error) -> String {
        if let error = errors as NSError? {
            let errorCode = FirestoreErrorCode.Code(rawValue: error.code)
            print("errorCode: \(errorCode)")
            switch errorCode {
                case .cancelled:
                    return "La operación fue cancelada."
                case .invalidArgument:
                    return "Los datos proporcionados son inválidos."
                case .deadlineExceeded:
                    return "La operación tardó demasiado y se agotó el tiempo."
                case .notFound:
                    return "El documento solicitado no fue encontrado."
                case .alreadyExists:
                    return "El documento ya existe."
                case .permissionDenied:
                    return "No tienes permisos para realizar esta operación."
                case .resourceExhausted:
                    return "Recursos insuficientes para completar la operación."
                case .failedPrecondition:
                    return "La operación no se puede realizar en el estado actual."
                case .aborted:
                    return "La operación fue abortada."
                case .outOfRange:
                    return "Un argumento proporcionado está fuera del rango permitido."
                case .unimplemented:
                    return "La operación no está implementada."
                case .internal:
                    return "Ocurrió un error interno."
                case .unavailable:
                    return "El servicio no está disponible actualmente."
                case .dataLoss:
                    return "Se produjo una pérdida de datos."
                case .unauthenticated:
                    return "El usuario no está autenticado."
                default:
                    return "Error desconocido."
                }
        }else{
            return ""
        }
      
    }
}
