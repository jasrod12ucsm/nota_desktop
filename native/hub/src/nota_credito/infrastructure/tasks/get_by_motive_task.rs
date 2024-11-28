use std::sync::Arc;

use crate::{
    common, messages::get_by_motive_price::GetByMotivePriceInputMessage,
    nota_credito::infrastructure::containers::containers::NotaCreditoRepo,
    shared::domain::task_entity::TaskEntity,
};

pub struct GetByMotiveTask;
impl TaskEntity for GetByMotiveTask {
    fn new() -> Self {
        GetByMotiveTask
    }
}

impl GetByMotiveTask {
    pub async fn run(repo: Arc<NotaCreditoRepo>) -> common::Result<()> {
        let nota_credito_repository = repo.as_nota_credito_repo();
        let mut receiver = GetByMotivePriceInputMessage::get_dart_signal_receiver()?;
        while let Some(_) = receiver.recv().await {
            let response = nota_credito_repository.get_by_motive().await?;
            match response {
                crate::nota_credito::domain::models::get_by_motive_model::GetByMotiveModelResponse::Success(get_by_motive_output_message) => get_by_motive_output_message.send_signal_to_dart(),
                crate::nota_credito::domain::models::get_by_motive_model::GetByMotiveModelResponse::Error(base_error) => base_error.send_signal_to_dart(),
            }
        }
        Ok(())
    }
}
