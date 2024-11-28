use std::sync::Arc;

use rinf::debug_print;

use crate::{common, messages::get_all_notes::GetAllNotesInputMessage, nota_credito::infrastructure::containers::containers::NotaCreditoRepo, shared::domain::task_entity::TaskEntity};
impl TaskEntity for GetAllNotaCreditoTask {
    fn new()-> Self {
        GetAllNotaCreditoTask
    }
}
pub struct GetAllNotaCreditoTask;
impl GetAllNotaCreditoTask {
    pub async fn run(repo: Arc<NotaCreditoRepo>) -> common::Result<()> {
        let nota_credito_repository = repo.as_nota_credito_repo();
        let mut receiver=GetAllNotesInputMessage::get_dart_signal_receiver()?;
        while let Some(_) = receiver.recv().await {
            debug_print!("GetAllNotaCreditoTask");
            let response = nota_credito_repository.get_all_notes().await?;
            debug_print!("{:?}",response);
            match response {
                crate::nota_credito::domain::models::nota_credito_model::GetAllNotaCreditoResponse::Success(get_all_notes_output_message) => get_all_notes_output_message.send_signal_to_dart(),
                crate::nota_credito::domain::models::nota_credito_model::GetAllNotaCreditoResponse::Error(base_error) => base_error.send_signal_to_dart(),
            }
            
        }
        Ok(())
    }
}
