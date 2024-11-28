use serde::{Deserialize, Serialize};

use crate::messages::{get_all_notes::BaseError, get_by_motive_price::{GetByMotivePriceOutput, GetByMotivePriceOutputMessage}};




#[derive(Debug, Serialize, Deserialize)]
pub struct GetByMotiveModel{
    motivo:String,
    cantidad:String,
    total_precio:String,
}

impl From<GetByMotiveModel> for GetByMotivePriceOutput{
    fn from(value: GetByMotiveModel) -> Self {
        Self{
            motivo: value.motivo,
            cantidad: value.cantidad,
            total_precio: value.total_precio,
        }
    }
}


pub enum GetByMotiveModelResponse {
    Success(GetByMotivePriceOutputMessage),
    Error(BaseError),
}