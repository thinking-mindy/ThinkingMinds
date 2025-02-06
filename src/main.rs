#![deny(unsafe_code)]
slint::include_modules!();
use slint::Model;
use fulgul::dev::minds;

fn my_log(my_err:&str){
    match std::fs::write("minds.twd", my_err){
        Ok(_)=>println!("Log reated"),
        Err(_)=>println!("Log not reated")
    }
}

#[tokio::main]
async fn main() {
    let app = App::new().unwrap();

    app.global::<LoginCheck>().on_validate_login({
        let tmp=app.as_weak();
       move |uname,pass|{
        if uname=="rooty" && pass=="rooty"{
            tmp.unwrap().global::<LoginCheck>().set_logged_in(true);
        }else {
            let tmpp=tmp.clone();
            tmpp.unwrap().global::<LoginStatus>().set_loading(false);
            tmpp.unwrap().global::<LoginCheck>().set_err(true)
        }
        }});

        app.global::<PortScanner>().on_begin_scan({
            let tmp=app.as_weak();
            tmp.unwrap().global::<PortScanner>().set_loading(true);

            move|a,b,c|{
                if minds::my_ip(a.to_string()){
                    let tmpp=tmp.clone();
                    tokio::spawn(async move{
                        let tmpa=minds::scan_port(a.to_string(),b.to_string(),c.to_string()).await;
                        let _=slint::invoke_from_event_loop(move||{
                        let ports=slint::ModelRc::new(slint::VecModel::from(tmpa.clone()));
                        tmpp.unwrap().global::<PortScanner>().set_open_ports(ports);
                        tmpp.unwrap().global::<PortScanner>().set_loading(false);

                        });
                    });
                }else{
                    tmp.unwrap().global::<PortScanner>().set_v_ip(true);
                }
            }
        });
        app.global::<Wifi>().on_scan_wifi({
            let tmps=app.as_weak();

            tmps.unwrap().global::<Wifi>().set_loading(true);
            move||{
                let tmpp=tmps.clone();
                tokio::spawn(async move{
                    let tmpa=minds::scan_networks().await;
                    let _=slint::invoke_from_event_loop(move||{
                    let names=slint::ModelRc::new(slint::VecModel::from(tmpa.clone()));
                    tmpp.unwrap().global::<Wifi>().set_wifi_names(names);
                    tmpp.unwrap().global::<Wifi>().set_loading(false);
                    });
                });
            }
        });

        app.global::<Navigation>().on_go({
            let tmp=app.as_weak();
            move |a,b|{
                let tmpp=tmp.clone();
                let mut arr:Vec<i32>=tmpp.unwrap().global::<Navigation>().get_history().iter().collect();
                tmpp.unwrap().global::<Navigation>().set_page(a);
                tmpp.unwrap().global::<Navigation>().set_page_name(b);
                if arr.len()==0{arr.push(a)}else{if let Some(value) =arr.last() {if a!=*value{arr.push(a)}}}
                tmpp.unwrap().global::<Navigation>().set_history(slint::ModelRc::new(slint::VecModel::from(arr.clone())));
            }
        });

        app.global::<Navigation>().on_go_back({
            let tmp=app.as_weak();
            move ||{
                let tmpp=tmp.clone();
                let mut arr:Vec<i32>=tmpp.unwrap().global::<Navigation>().get_history().iter().collect();
                let lpage=if arr.len()>0{arr.pop().unwrap()}else{0};
                tmpp.unwrap().global::<Navigation>().set_page(lpage);
                tmpp.unwrap().global::<Navigation>().set_history(slint::ModelRc::new(slint::VecModel::from(arr.clone())));
            }
        });

    app.run().unwrap();
}
