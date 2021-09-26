#[no_mangle]
pub extern "C" fn get_port() -> u16 {
    rusty_pipe_cli::get_unused_port().unwrap_or(0)
}

#[no_mangle]
pub extern "C" fn run_server(port: u16) {
    rusty_pipe_cli::run_server(port);
}
