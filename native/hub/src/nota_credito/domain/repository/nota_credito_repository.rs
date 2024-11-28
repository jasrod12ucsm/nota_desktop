use async_trait::async_trait;

use crate::{
    nota_credito::domain::models::{
        get_by_dates_model::GetByDatesModelResponse, get_by_id_model::GetOneNotaCreditoResponse, get_by_motive_model::GetByMotiveModelResponse, nota_credito_model::{GetAllNotaCreditoResponse, NotaCreditoModel}, total_recouded_model::TotalRecaudedModelResponse
    },
    utils::err::{header_error::ErrorHeader, request_error::RequestError},
};

#[async_trait]
pub trait NotaCreditoRepositoryTrait: Send + Sync {
    fn new() -> Self
    where
        Self: Sized;
    async fn get_all_notes(&self) -> Result<GetAllNotaCreditoResponse, ErrorHeader>;
    async fn get_total_recauded(&self) -> Result<TotalRecaudedModelResponse, ErrorHeader>;
    async fn get_by_motive(&self) -> Result<GetByMotiveModelResponse, ErrorHeader>;
    async fn get_by_dates(
        &self,
        date1: String,
        date2: String,
    ) -> Result<GetByDatesModelResponse, ErrorHeader>;
    async fn find_by_id(&self, id: String) -> Result<GetOneNotaCreditoResponse, ErrorHeader>;
}
