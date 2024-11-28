//! This `hub` crate is the
//! entry point of the Rust logic.

mod common;
mod messages;
mod utils;
mod nota_credito;
mod shared;

use nota_credito::infrastructure::manager::nota_credito_manager::NotaCreditoManager;
use tokio; // Comment this line to target the web.
// use tokio_with_wasm::alias as tokio; // Uncomment this line to target the web.

rinf::write_interface!();

// Use `tokio::spawn` to run concurrent tasks.
// Always use non-blocking async functions
// such as `tokio::fs::File::open`.
// If you really need to use blocking code,
// use `tokio::task::spawn_blocking`.
async fn main() {
    tokio::spawn(NotaCreditoManager::run());
}