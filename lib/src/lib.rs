extern crate sysinfo;

use sysinfo::{System, SystemExt};

#[no_mangle]
pub extern fn get_ram() -> u64 {
    let mut sys = System::new();
    sys.refresh_all();
    let used_mem = sys.get_used_memory(); 
    
    return used_mem;
}
