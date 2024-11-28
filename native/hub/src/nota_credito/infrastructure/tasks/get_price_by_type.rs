use std::sync::Arc;

use crate::{
    common, messages::total_recauded::TotalRecaudedInputMessage,
    nota_credito::infrastructure::containers::containers::NotaCreditoRepo,
    shared::domain::task_entity::TaskEntity,
};

pub struct GetPriceByTask;
impl TaskEntity for GetPriceByTask {
    fn new() -> Self {
        GetPriceByTask
    }
}

impl GetPriceByTask {
    pub async fn run(repo: Arc<NotaCreditoRepo>) -> common::Result<()> {
        let nota_credito_repository = repo.as_nota_credito_repo();
        let mut receiver = TotalRecaudedInputMessage::get_dart_signal_receiver()?;
        while let Some(_) = receiver.recv().await {
            let response = nota_credito_repository.get_total_recauded().await?;
            match response {
                crate::nota_credito::domain::models::total_recouded_model::TotalRecaudedModelResponse::Success(total_recauded_output_message) => total_recauded_output_message.send_signal_to_dart(),
                crate::nota_credito::domain::models::total_recouded_model::TotalRecaudedModelResponse::Error(base_error) => base_error.send_signal_to_dart(),
            }
        }
        Ok(())
    }
}
