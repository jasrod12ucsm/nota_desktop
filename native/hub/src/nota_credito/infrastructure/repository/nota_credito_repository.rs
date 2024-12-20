use async_trait::async_trait;

use crate::{
    nota_credito::{
        domain::{
            datasource::nota_credito_datasource::NotaCreditoDataSourceTrait,
            models::{
                get_by_dates_model::GetByDatesModelResponse, get_by_id_model::GetOneNotaCreditoResponse, get_by_motive_model::GetByMotiveModelResponse, nota_credito_model::GetAllNotaCreditoResponse, total_recouded_model::TotalRecaudedModelResponse
            },
            repository::nota_credito_repository::NotaCreditoRepositoryTrait,
        },
        infrastructure::datasource::nota_credito_datasource::NotaCreditoDataSource,
    },
    utils::err::header_error::ErrorHeader,
};

pub struct NotaCreditoRepository {
    pub nota_credito_datasource: NotaCreditoDataSource,
}
#[async_trait]
impl NotaCreditoRepositoryTrait for NotaCreditoRepository {
    fn new() -> Self {
        NotaCreditoRepository {
            nota_credito_datasource: NotaCreditoDataSource::new(),
        }
    }

    async fn get_all_notes(&self) -> Result<GetAllNotaCreditoResponse, ErrorHeader> {
        self.nota_credito_datasource.get_all_notes().await
    }
    async fn get_total_recauded(&self) -> Result<TotalRecaudedModelResponse, ErrorHeader> {
        self.nota_credito_datasource.get_total_recauded().await
    }
    async fn get_by_motive(&self) -> Result<GetByMotiveModelResponse, ErrorHeader> {
        self.nota_credito_datasource.get_by_motive().await
    }
    async fn get_by_dates(
        &self,
        date1: String,
        date2: String,
    ) -> Result<GetByDatesModelResponse, ErrorHeader> {
        self.nota_credito_datasource
            .get_by_dates(date1, date2)
            .await
    }
    async fn find_by_id(&self, id: String) -> Result<GetOneNotaCreditoResponse, ErrorHeader> {
        self.nota_credito_datasource.find_by_id(id).await
    }
}
