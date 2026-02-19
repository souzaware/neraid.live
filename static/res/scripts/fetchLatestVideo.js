let id = "dQw4w9WgXcQ";
let list = fetch("https://cors.andreigamer5000.workers.dev/?url=" + ("https://www.youtube.com/feeds/videos.xml?channel_id=UC4U1e34boXZ7cjYjqzf9osw")).then(res => res.text()).then(xml => {

    try {
        let parsed_xml = new DOMParser().parseFromString(xml, "text/xml");

        let entries = parsed_xml.querySelectorAll("entry");
        let latestEntry = entries[0];

        for (let entry of entries) {
            let entryDate = new Date(entry.querySelector("published").innerHTML);

            if (new Date(latestEntry.querySelector("published").innerHTML) > entryDate) {
                continue;
            }

            latestEntry = entry;
        }

        let href = latestEntry.querySelector("link").getAttribute("href");

        let url = URL.parse(href);

        id = url.searchParams.get("v");
    } catch (e) { }

    latest_video_embed.src = `https://youtube.com/embed/${id}`;
});
