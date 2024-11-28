use std::sync::Arc;

use rinf::debug_print;

use crate::{
    common, messages::get_by_id::GetByIdInputMessage, nota_credito::{domain::models::get_by_id_model::GetOneNotaCreditoResponse, infrastructure::containers::containers::NotaCreditoRepo}, shared::domain::task_entity::TaskEntity
};

pub struct GetByIdTask;
impl TaskEntity for GetByIdTask {
    fn new() -> Self {
        GetByIdTask
    }
}

impl GetByIdTask {
    pub async fn run(repo: Arc<NotaCreditoRepo>) -> common::Result<()> {
        let nota_credito_repository = repo.as_nota_credito_repo();
        let mut receiver = GetByIdInputMessage::get_dart_signal_receiver()?;
        while let Some(message) = receiver.recv().await {
            let response = nota_credito_repository
                .find_by_id(message.message.codigo_nota_credito)
                .await?;
            match response {
                GetOneNotaCreditoResponse::Success(get_one_nota_output_message) => {
                    debug_print!("{:?}", get_one_nota_output_message);
                    get_one_nota_output_message.send_signal_to_dart()},
               GetOneNotaCreditoResponse::Error(base_error) => base_error.send_signal_to_dart(),
            }
        }
        Ok(())
    }
}
