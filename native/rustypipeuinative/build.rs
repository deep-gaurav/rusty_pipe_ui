use dart_bindgen::{config::*, Codegen};
#[cfg(not(target_os = "linux"))]
fn main(){

}

#[cfg(target_os = "linux")]
fn main() {
    let crate_dir = std::env::var("CARGO_MANIFEST_DIR").unwrap();
    let config = cbindgen::Config {
        language: cbindgen::Language::C,
        ..Default::default()
    };
    cbindgen::Builder::new()
        .with_crate(crate_dir)
        .with_config(config)
        .generate()
        .expect("Unable to generate bindings")
        .write_to_file("binding.h");

    let config = DynamicLibraryConfig {
        ios: DynamicLibraryCreationMode::Executable.into(),
        android: DynamicLibraryCreationMode::open("librustypipeuinative.so").into(),
        linux: DynamicLibraryCreationMode::open(
            "${File(Platform.resolvedExecutable).parent.path}/lib/librustypipeuinative.so",
        )
        .into(),
        windows: DynamicLibraryCreationMode::open(
            "${File(Platform.resolvedExecutable).parent.path}/librustypipeuinative.dll",
        )
        .into(),
        ..Default::default()
    };
    // load the c header file, with config and lib name
    let codegen = Codegen::builder()
        .with_src_header("binding.h")
        .with_lib_name("rustypipeuinative")
        .with_config(config)
        .build()
        .unwrap();
    // generate the dart code and get the bindings back
    let bindings = codegen.generate().unwrap();
    // // write the bindings to your dart package
    // // and start using it to write your own high level abstraction.
    bindings
        .write_to_file("../../packages/rustypipeuinative/lib/ffi.dart")
        .unwrap();
}
