use async_trait::async_trait;

use crate::{nota_credito::{
    domain::{datasource::nota_credito_datasource::NotaCreditoDataSourceTrait, models::nota_credito_model::GetAllNotaCreditoResponse, repository::nota_credito_repository::NotaCreditoRepositoryTrait},
    infrastructure::datasource::nota_credito_datasource::NotaCreditoDataSource,
}, utils::err::header_error::ErrorHeader};

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
}
