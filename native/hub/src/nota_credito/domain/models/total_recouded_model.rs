use serde::{Deserialize, Serialize};

use crate::messages::{get_all_notes::BaseError, total_recauded::TotalRecaudedOutputMessage};


#[derive(Debug, Serialize, Deserialize,Clone)]
pub struct TotalRecaudedModel{
    pub tipo: String,
    pub total_precio: String,
}



pub enum TotalRecaudedModelResponse {
    Success(TotalRecaudedOutputMessage),
    Error(BaseError),
}