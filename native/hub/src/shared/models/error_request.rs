use serde::{Deserialize, Serialize};

use crate::messages::auth::models::{get_devices::GetDevicesOutputMessageError, login_client::LoginClientOutputMessageError, register_auth::RegisterAuthOutputMessageError, register_form_data::RegisterFormDataOutputMessageError, renew_token::RenewTokenOutputMessageError, singout::SingOutOutputMessageError};


#[derive(Deserialize,Serialize)]
pub struct ErrorRequest{
    pub error:String,
    
    pub description:String,
    pub status_code:i32
}
impl From<ErrorRequest> for RegisterFormDataOutputMessageError{
    fn from(value: ErrorRequest) -> Self {
        Self{
            description:value.description,
            error:value.error,
            status_code:value.status_code
        }
    }
}
impl From<ErrorRequest> for RegisterAuthOutputMessageError{
    fn from(value: ErrorRequest) -> Self {
        Self{
            error: value.error,
            status_code: value.status_code,
            message: value.description,
        }
    }
}
impl From<ErrorRequest> for LoginClientOutputMessageError{
    fn from(value: ErrorRequest) -> Self {
        Self{
            error: value.error,
            status_code: value.status_code,
            description: value.description,
        }
    }
}
impl From<ErrorRequest> for RenewTokenOutputMessageError {
    fn from(value: ErrorRequest) -> Self {
        Self{
            error: value.error,
            description: value.description,
            status_code: value.status_code,
        }
    }

    
}
impl From<ErrorRequest> for GetDevicesOutputMessageError {
    fn from(value: ErrorRequest) -> Self {
        Self{
            error: value.error,
            description: value.description,
            status_code: value.status_code,
        }
    }
}
impl From<ErrorRequest> for SingOutOutputMessageError {
    fn from(value: ErrorRequest) -> Self {
        SingOutOutputMessageError{ error: value.error, description: value.description, status_code: value.status_code }
    }
}