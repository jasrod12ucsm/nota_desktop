
use crate::{auth::domain::models::containers::repo::{AuthRepo, LocationRepo}, common::Result};


pub trait AuthTaskManager {
    type Output;
    async fn run(repo:std::sync::Arc<AuthRepo>)->Result<()>;
    
    fn add_task(task: Self::Output );    
}


pub trait LocationTaskManager{
    type Output;
    async fn run(repo:std::sync::Arc<LocationRepo>)->Result<()>;
    fn add_task(task:Self::Output);
}