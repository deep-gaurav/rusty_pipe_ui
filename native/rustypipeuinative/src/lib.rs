#[no_mangle]
pub extern "C" fn get_port() -> u16 {
    rusty_pipe_cli::get_unused_port().unwrap_or(0)
    // 20
}

#[no_mangle]
pub extern "C" fn run_server(port: u16) {
    std::env::set_var("RUST_BACKTRACE", "full");
    android_logger::init_once(android_logger::Config::default().with_min_level(log::Level::Debug));
    rusty_pipe_cli::run_server(port)
    // main();
}

// #[ndk_glue::main(backtrace = "on")]
// pub fn main() {
//     let dev = oboe::AudioDeviceInfo::request(oboe::AudioDeviceDirection::Output);

//     log::info!("Devices {:#?}", dev.map(|d| d.len()));
// }
