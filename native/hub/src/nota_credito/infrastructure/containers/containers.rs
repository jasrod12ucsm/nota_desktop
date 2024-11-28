use crate::nota_credito::domain::repository::nota_credito_repository::NotaCreditoRepositoryTrait;

pub enum NotaCreditoRepo {
    NotaCredito(Box<dyn NotaCreditoRepositoryTrait>),
}

impl NotaCreditoRepo {
    pub fn as_nota_credito_repo(&self) -> &dyn NotaCreditoRepositoryTrait {
        match self {
            NotaCreditoRepo::NotaCredito(repo) => repo.as_ref(),
        }
    }
}
