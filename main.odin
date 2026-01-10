package main

import "core:fmt"
import os "core:os/os2"
import mustache "./vendor/odin-mustache"

User :: struct {
    name: string,
}

main :: proc() {
    user := User{
        name = "Test",
    }

    s, err := mustache.render_from_filename("templates/index.mustache", user)

    write_err := os.write_entire_file("static/index.html", transmute([]u8)s)

    if err != nil {
        fmt.println(err)
    }
}
