use async_trait::async_trait;
use reqwest::StatusCode;
use serde::de::value;

use crate::{
    messages::{
        get_all_notes::{BaseError, GetAllNotesOutput, GetAllNotesOutputMessage},
        get_by_motive_price::{GetByMotivePriceOutput, GetByMotivePriceOutputMessage},
        total_recauded::TotalRecaudedOutputMessage,
    },
    nota_credito::domain::{
        datasource::nota_credito_datasource::NotaCreditoDataSourceTrait,
        models::{
            get_by_motive_model::{GetByMotiveModel, GetByMotiveModelResponse},
            nota_credito_model::{GetAllNotaCreditoResponse, NotaCreditoModel},
            total_recouded_model::{TotalRecaudedModel, TotalRecaudedModelResponse},
        },
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
    async fn get_total_recauded(&self) -> Result<TotalRecaudedModelResponse, ErrorHeader> {
        let response = self
            .client
            .get(&format!(
                "{}api/all/sum-total-prices-by-type",
                self.base_url
            ))
            .send()
            .await?;
        match response.status() {
            StatusCode::OK => {
                let total_recauded: Vec<TotalRecaudedModel> = response.json().await?;
                Ok(TotalRecaudedModelResponse::Success(
                    TotalRecaudedOutputMessage {
                        total_recauded_t: total_recauded.get(0).unwrap().total_precio.clone(),
                        total_recauded_p: total_recauded.get(1).unwrap().total_precio.clone(),
                    },
                ))
            }
            _ => {
                let error = response.text().await?;
                Ok(TotalRecaudedModelResponse::Error(BaseError {
                    message: error,
                }))
            }
        }
    }
    async fn get_by_motive(&self) -> Result<GetByMotiveModelResponse, ErrorHeader> {
        let response = self
            .client
            .get(&format!(
                "{}api/nota/count-and-sum-by-motive",
                self.base_url
            ))
            .send()
            .await?;
        match response.status() {
            StatusCode::OK => {
                let total_recauded: Vec<GetByMotiveModel> = response.json().await?;

                let value: Vec<GetByMotivePriceOutput> = total_recauded
                    .into_iter()
                    .map(|value| value.into())
                    .collect();
                Ok(GetByMotiveModelResponse::Success(
                    GetByMotivePriceOutputMessage { notes: value },
                ))
            }

            _ => {
                let error = response.text().await?;
                Ok(GetByMotiveModelResponse::Error(BaseError {
                    message: error,
                }))
            }
        }
    }
}
