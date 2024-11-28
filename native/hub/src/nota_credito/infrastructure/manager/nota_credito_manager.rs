use crate::nota_credito::{
    domain::repository::nota_credito_repository::NotaCreditoRepositoryTrait,
    infrastructure::{
        containers::containers::NotaCreditoRepo,
        repository::nota_credito_repository::NotaCreditoRepository, tasks::get_all_nota_credito_task::GetAllNotaCreditoTask,
    },
};

pub struct NotaCreditoManager;

impl NotaCreditoManager {
    pub async fn run() {
        let nota_credito_repository = NotaCreditoRepository::new();
        let repo_nota = std::sync::Arc::new(NotaCreditoRepo::NotaCredito(Box::new(
            nota_credito_repository,
        )));
        tokio::spawn(GetAllNotaCreditoTask::run(repo_nota));
    }
}
