use async_trait::async_trait;
use reqwest::StatusCode;

use crate::{
    messages::get_all_notes::{BaseError, GetAllNotesOutput, GetAllNotesOutputMessage},
    nota_credito::domain::{
        datasource::nota_credito_datasource::NotaCreditoDataSourceTrait,
        models::nota_credito_model::{GetAllNotaCreditoResponse, NotaCreditoModel},
    },
    utils::{err::header_error::ErrorHeader, helpers::env::env::ENV},
};

pub struct NotaCreditoDataSource {
    base_url: String,
    client: reqwest::Client,
}
#[async_trait]
impl NotaCreditoDataSourceTrait for NotaCreditoDataSource {
    fn new() -> Self {
        NotaCreditoDataSource {
            base_url: format!(
                "{}{}",
                ENV.get_string("URL").expect("error in url environment"),
                "api/nota"
            ),
            client: reqwest::Client::new(),
        }
    }
    async fn get_all_notes(&self) -> Result<GetAllNotaCreditoResponse, ErrorHeader> {
        let response = self.client.get(&self.base_url).send().await?;
        match response.status() {
            StatusCode::OK => {
                let notes: Vec<GetAllNotesOutput> = response
                    .json::<Vec<NotaCreditoModel>>()
                    .await?
                    .into_iter()
                    .map(|value| value.into())
                    .collect();
                let structure = GetAllNotesOutputMessage { notes };
                Ok(GetAllNotaCreditoResponse::Success(structure))
            }
            _ => {
                let error = response.text().await?;
                Ok(GetAllNotaCreditoResponse::Error(BaseError {
                    message: error,
                }))
            }
        }
    }
}
