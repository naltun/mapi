extern crate sysinfo;
extern crate walkdir;

use sysinfo::{DiskExt, System, SystemExt};
use walkdir::WalkDir;

#[no_mangle]
pub extern fn get_files_count() -> usize {
    let path = "/";
    let files_count = WalkDir::new(path).into_iter().count();

    return files_count;
}

#[no_mangle]
pub extern fn get_ram_used() -> u64 {
    let mut sys = System::new();
    sys.refresh_all();
    let used_mem = sys.get_used_memory(); 
    
    return used_mem;
}

#[no_mangle]
pub extern fn get_harddisk_avail() -> u64 {
    let mut sys = System::new();
    sys.refresh_disk_list();
    sys.refresh_disks();
    
    let mut harddisk_avail = 0;
    let hdd = sys.get_disks();
    for disk in hdd.iter() {
        harddisk_avail = harddisk_avail + disk.get_available_space();
    }

    return harddisk_avail;
}
