use tokio::net::TcpStream;
use std::{i32, ops::Range};

pub fn my_ip(a:String)->bool{
    let chunks=a.split(".");
    if chunks.count()<5{true}else{false}
}

pub async fn scan_port(a:String,ra:String,rb:String)->Vec<slint::StandardListViewItem>{
    let mut f=vec![];
    let sp=match ra.parse::<i32>(){Ok(num)=>num,Err(_)=>0};
    let tp=match rb.parse::<i32>(){Ok(num)=>num,Err(_)=>0};
    let p_r:Range<i32>=if sp>1 && tp<sp{sp..tp}else{1..5000};

    for i in p_r{
        match TcpStream::connect(format!("{a}:{i}")).await{
            Ok(v)=>{if v.peer_addr().is_ok(){f.push(slint::StandardListViewItem::from(i.to_string().as_str()))}},
            Err(e)=>{println!("Can't connect{e}")}
        };

    }
    f
}
