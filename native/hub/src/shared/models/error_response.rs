use serde::{Deserialize, Serialize};

use crate::messages::auth::models::register_form_data::RegisterFormDataOutputMessageError;

#[derive(Deserialize,Serialize, Debug)]
pub struct ErrorResponse{
    pub error:String,
    pub status_code:i32
}
impl From<(ErrorResponse, String)> for RegisterFormDataOutputMessageError {
    fn from(value: (ErrorResponse, String)) -> Self {
        let (error_response, custom_description) = value;
        Self {
            error: error_response.error,
            description: custom_description, // Asigna el valor personalizado a `description`
            status_code: error_response.status_code,
        }
    }
}
