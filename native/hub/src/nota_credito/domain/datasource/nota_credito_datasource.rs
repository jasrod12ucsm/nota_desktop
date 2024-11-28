use async_trait::async_trait;

use crate::{
    nota_credito::domain::models::{get_by_motive_model::GetByMotiveModelResponse, nota_credito_model::GetAllNotaCreditoResponse, total_recouded_model::{TotalRecaudedModel, TotalRecaudedModelResponse}},
    utils::err::header_error::ErrorHeader,
};

#[async_trait]
pub trait NotaCreditoDataSourceTrait: Sized {
    fn new() -> Self;
    async fn get_all_notes(&self) -> Result<GetAllNotaCreditoResponse, ErrorHeader>;
    async fn get_total_recauded(&self)->Result<TotalRecaudedModelResponse,ErrorHeader>;
    async fn get_by_motive(&self)-> Result<GetByMotiveModelResponse,ErrorHeader>;
}
