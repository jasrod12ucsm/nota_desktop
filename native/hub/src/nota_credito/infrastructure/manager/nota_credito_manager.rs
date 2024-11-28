use std::sync::Arc;

use crate::nota_credito::{
    domain::repository::nota_credito_repository::NotaCreditoRepositoryTrait,
    infrastructure::{
        containers::containers::NotaCreditoRepo,
        repository::nota_credito_repository::NotaCreditoRepository,
        tasks::{
            get_all_nota_credito_task::GetAllNotaCreditoTask, get_price_by_type::GetPriceByTask,
        },
    },
};

pub struct NotaCreditoManager;

impl NotaCreditoManager {
    pub async fn run() {
        let nota_credito_repository = NotaCreditoRepository::new();
        let repo_nota = std::sync::Arc::new(NotaCreditoRepo::NotaCredito(Box::new(
            nota_credito_repository,
        )));
        let repo_nota_2 = Arc::clone(&repo_nota);
        tokio::spawn(GetAllNotaCreditoTask::run(repo_nota));
        tokio::spawn(GetPriceByTask::run(repo_nota_2));
    }
}
