
#![deny(unsafe_code)]
slint::include_modules!();
use std::time::Duration;
use slint::Timer;
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
            let tmps=app.as_weak();
            move|a,b,c|{

                tmps.unwrap().global::<PortScanner>().set_loading(true);

                if minds::my_ip(a.to_string()){
                    let tmpp=tmp.clone();
                    tokio::spawn(async move{
                        let tmpa=minds::scan_port(a.to_string(),b.to_string(),c.to_string()).await;
                        let _=slint::invoke_from_event_loop(move||{
                        let ports=slint::ModelRc::new(slint::VecModel::from(tmpa.clone()));
                        tmpp.unwrap().global::<PortScanner>().set_open_ports(ports);
                        });
                    });
                }else{
                    tmp.unwrap().global::<PortScanner>().set_v_ip(true);
                }

                tmps.unwrap().global::<PortScanner>().set_loading(false);


            }
        });

        app.global::<Navigation>().on_finish_setup({
            let tmp=app.as_weak();
            move ||{
                let tmpp=tmp.clone();
                my_log("setup-complete");
                Timer::single_shot(Duration::from_millis(2000), move||{tmpp.unwrap().global::<Navigation>().set_pentest_page(0);})
            }

        });

    app.run().unwrap();
}
