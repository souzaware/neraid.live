package main

import "core:fmt"
import "core:log"
import "core:os"
import mustache "./vendor/odin-mustache"

Data :: struct {
    social: []struct {
        site: string,
        page: string,
        icon_url: string,
        url: string,
    }
}

main :: proc() {
    data := Data{
        social = {
            {
                site = "Discord",
                page = "Community",
                icon_url = "res/icons/discord.png",
                url = "https://discord.gg/Et4Fe4Kc",
            },
            {
                site = "GitHub",
                icon_url = "res/icons/github.png",
                url = "https://github.com/souzaware/",
            },
            {
                site = "Twitch",
                icon_url = "res/icons/twitch.png",
                url = "https://twitch.tv/neraid_live",
            },
            {
                site = "YouTube",
                icon_url = "res/icons/youtube.png",
                url = "https://youtube.com/@neraid",
            },
            {
                site = "Patreon",
                icon_url = "res/icons/patreon.png",
                url = "https://patreon.com/neraid_live",
            },
            {
                site = "X",
                icon_url = "res/icons/x.png",
                url = "https://x.com/neraid_live",
            },
            {
                site = "Instagram",
                icon_url = "res/icons/instagram.png",
                url = "https://instagram.com/neraid.live",
            },
            {
                site = "TikTok (eww)",
                icon_url = "res/icons/tiktok.png",
                url = "https://tiktok.com/@neraid.live",
            },
        }
    }

    os.make_directory("static")
    os.make_directory("static/res")
    os.copy_directory_all("static/res", "res/")

    s, err := mustache.render_from_filename("res/templates/index.html", data)

    if err != nil {
        log.error(err)
        return
    }

    write_err := os.write_entire_file("static/index.html", transmute([]u8)s)

    if write_err != nil {
        fmt.println(err)
    }
}
