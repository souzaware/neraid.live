package main

import "core:fmt"
import "core:log"
import os "core:os/os2"
import mustache "./vendor/odin-mustache"

Data :: struct {
    social: []struct {
        icon_url: string,
        url: string,
    }
}

main :: proc() {
    data := Data{
        social = {
            {
                icon_url = "res/icons/github-mark-white.svg",
                url = "https://github.com/souzaware/",
            },
        }
    }

    os.make_directory("static/res")
    os.copy_directory_all("static/res", "res/")

    s, err := mustache.render_from_filename("res/templates/index.html", data)

    if err != nil {
        log.error(err)
        return
    }

    write_err := os.write_entire_file("static/index.html", transmute([]u8)s)

    if err != nil {
        fmt.println(err)
    }
}
