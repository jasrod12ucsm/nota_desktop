use std::sync::Arc;

use crate::{
    common, messages::get_by_dates::GetAllNotesByDateInputMessage,
    nota_credito::infrastructure::containers::containers::NotaCreditoRepo,
    shared::domain::task_entity::TaskEntity,
};

pub struct GetByDatesTask;

impl TaskEntity for GetByDatesTask {
    fn new() -> Self {
        GetByDatesTask
    }
}

impl GetByDatesTask {
    pub async fn run(repo: Arc<NotaCreditoRepo>) -> common::Result<()> {
        let nota_credito_repository = repo.as_nota_credito_repo();
        let mut receiver = GetAllNotesByDateInputMessage::get_dart_signal_receiver()?;
        while let Some(message) = receiver.recv().await {
            let response = nota_credito_repository
                .get_by_dates(message.message.fecha_inicio, message.message.fecha_fin)
                .await?;
            match response {
                crate::nota_credito::domain::models::get_by_dates_model::GetByDatesModelResponse::Success(get_by_dates_output_message) => get_by_dates_output_message.send_signal_to_dart(),
                crate::nota_credito::domain::models::get_by_dates_model::GetByDatesModelResponse::Error(base_error) => base_error.send_signal_to_dart(),
            }
        }
        Ok(())
    }
}
