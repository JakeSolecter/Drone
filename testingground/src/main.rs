extern crate glium;

use glium::*;

fn main() {
    
    //let event_loop = winit::event_loop::EventLoopBuilder::new().build().unwrap();
    let event_loop: winit::event_loop::EventLoop<()> = winit::event_loop::EventLoop::builder().build().unwrap();


    let (window, display) = glium::backend::glutin::SimpleWindowBuilder::new().build(&event_loop);

}

