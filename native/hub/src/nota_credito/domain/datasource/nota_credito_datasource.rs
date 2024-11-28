use async_trait::async_trait;

use crate::{
    nota_credito::domain::models::nota_credito_model::GetAllNotaCreditoResponse,
    utils::err::header_error::ErrorHeader,
};

#[async_trait]
pub trait NotaCreditoDataSourceTrait: Sized {
    fn new() -> Self;
    async fn get_all_notes(&self) -> Result<GetAllNotaCreditoResponse, ErrorHeader>;
}
