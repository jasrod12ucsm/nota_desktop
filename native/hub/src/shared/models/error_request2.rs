use serde::{Deserialize, Serialize};

use crate::messages::auth::models::{login_client::LoginClientOutputMessageError, register_auth::RegisterAuthOutputMessageError, register_form_data::RegisterFormDataOutputMessageError};

#[derive(Serialize,Deserialize,Debug,Default)]
pub struct ErrorRequest2{
    pub error:String,
     #[serde(rename="statudCode")]
    pub statud_code:i32,
    pub message:String
}




impl From<ErrorRequest2> for RegisterAuthOutputMessageError{
    fn from(value: ErrorRequest2) -> Self {
        Self{
            error: value.error,
            status_code: value.statud_code,
            message: value.message,
        }
    }
}
impl From<ErrorRequest2> for RegisterFormDataOutputMessageError {
    fn from(value: ErrorRequest2) -> Self {
        Self { error: value.error , description:value.message , status_code: value.statud_code}
    }
    
}
impl From<ErrorRequest2> for LoginClientOutputMessageError {
    fn from(value: ErrorRequest2) -> Self {
        Self { error: value.error , description:value.message , status_code: value.statud_code}
    }
    
}