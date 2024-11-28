use serde::{Deserialize, Serialize};
use crate::messages::auth::models::{get_devices::GetDevicesOutputMessageError, login_client::LoginClientOutputMessageError, register_auth::RegisterAuthOutputMessageError, register_form_data::RegisterFormDataOutputMessageError, renew_token::RenewTokenOutputMessageError, singout::SingOutOutputMessageError};

#[derive(Serialize,Deserialize,Debug,Default)]
pub struct ErrorRequest3{
    pub error:String,
  
    pub status_code:i32,
    pub message:String
}
impl From<ErrorRequest3> for LoginClientOutputMessageError{
    fn from(value: ErrorRequest3) -> Self {
        Self{
            error: value.error,
            status_code: value.status_code,
            description: value.message,
        }
    }
}
impl From<ErrorRequest3> for RegisterFormDataOutputMessageError{
    fn from(value: ErrorRequest3) -> Self {
        Self{
            error: value.error,
            status_code: value.status_code,
            description: value.message,
        }
    }
}
impl From<ErrorRequest3> for RegisterAuthOutputMessageError{
    fn from(value: ErrorRequest3) -> Self {
        Self{
            error: value.error,
            status_code: value.status_code,
            message: value.message,
            
        }
    }
}
impl  From<ErrorRequest3> for RenewTokenOutputMessageError {
    fn from(value: ErrorRequest3) -> Self {
        Self{
            error: value.error,
            description: value.message,
            status_code: value.status_code,
        }
    }
}
impl From<ErrorRequest3> for GetDevicesOutputMessageError {
    fn from(value: ErrorRequest3) -> Self {
        GetDevicesOutputMessageError { error: value.error, description: value.message, status_code: value.status_code }
    }
    
}
impl From<ErrorRequest3> for SingOutOutputMessageError {
    fn from(value: ErrorRequest3) -> Self {
        SingOutOutputMessageError{ error: value.error, description: value.message, status_code: value.status_code }
    }
}