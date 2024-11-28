use async_trait::async_trait;

use crate::{nota_credito::domain::models::nota_credito_model::{GetAllNotaCreditoResponse, NotaCreditoModel}, utils::err::{header_error::ErrorHeader, request_error::RequestError}};





#[async_trait]
pub trait NotaCreditoRepositoryTrait: Send+Sync {
    fn new() -> Self where Self:Sized;
    async fn get_all_notes(&self) -> Result<GetAllNotaCreditoResponse, ErrorHeader>;
}