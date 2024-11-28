use serde::{Deserialize, Serialize};

use crate::messages::{get_all_notes::BaseError, get_by_dates::{GetAllNotesByDateOutput, GetAllNotesByDateOutputMessage}, get_by_motive_price::GetByMotivePriceOutput};

#[derive(Debug, Serialize, Deserialize)]
pub struct GetByDatesModel {
    pub codigo_nota_credito: String,
    pub fecha_emision: String,
    pub precio:String,
    pub motivo:String,
}


impl From<GetByDatesModel> for GetAllNotesByDateOutput{
    fn from(value: GetByDatesModel) -> Self {
        Self{
            codigo_nota_credito: value.codigo_nota_credito,
            fecha_emision: value.fecha_emision,
            precio: value.precio,
            motivo: value.motivo,
        }
    }
}
pub enum GetByDatesModelResponse {
    Success(GetAllNotesByDateOutputMessage),
    Error(BaseError),
}