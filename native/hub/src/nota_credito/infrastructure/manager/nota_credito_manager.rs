use std::sync::Arc;

use rinf::debug_print;

use crate::nota_credito::{
    domain::repository::nota_credito_repository::NotaCreditoRepositoryTrait,
    infrastructure::{
        containers::containers::NotaCreditoRepo,
        repository::nota_credito_repository::NotaCreditoRepository,
        tasks::{
            get_all_nota_credito_task::GetAllNotaCreditoTask, get_by_dates_task::GetByDatesTask, get_by_id_nota_task::GetByIdTask, get_by_motive_task::GetByMotiveTask, get_price_by_type::GetPriceByTask
        },
    },
};

pub struct NotaCreditoManager;

impl NotaCreditoManager {
    pub async fn run() {
        debug_print!("NotaCreditoManager");
        let nota_credito_repository = NotaCreditoRepository::new();
        let repo_nota = std::sync::Arc::new(NotaCreditoRepo::NotaCredito(Box::new(
            nota_credito_repository,
        )));
        let repo_nota_2 = Arc::clone(&repo_nota);
        let repo_nota_3 = Arc::clone(&repo_nota);
        let repo_nota_4 = Arc::clone(&repo_nota);
        let repo_nota_5 = Arc::clone(&repo_nota);
        tokio::spawn(GetAllNotaCreditoTask::run(repo_nota));
        tokio::spawn(GetPriceByTask::run(repo_nota_2));
        tokio::spawn(GetByMotiveTask::run(repo_nota_3));
        tokio::spawn(GetByDatesTask::run(repo_nota_4));
        tokio::spawn(GetByIdTask::run(repo_nota_5));
    }
}
