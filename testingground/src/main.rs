extern crate glfw;

use glfw::{Action, Context, Key, fail_on_errors};

fn main() {
    let mut glfw = glfw::init(glfw::fail_on_errors!()).unwrap();

    let (mut window, events) = glfw.create_window(800, 600, "Testing ground", glfw::WindowMode::Windowed).expect("Couldn't create window");
    window.set_key_polling(true);
    window.make_current();


    while !window.should_close() {
        glfw.poll_events();

        for (_, event) in glfw::flush_messages(&events) {
            handleWindowEvent(&mut window, event);
        }
    }

}



fn handleWindowEvent(window: &mut glfw::Window, event: glfw::WindowEvent) {
    match event {
        glfw::WindowEvent::Key(Key::Escape, _, Action::Press , _) => {
            window.set_should_close(true);
        }

        _ => {}
    }
}