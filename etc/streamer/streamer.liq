settings.log.stdout := true
settings.log.file := false
settings.clock.log_delay := 60.

#set("log.stdout", true)
#set("log.file", false)
#set("clock.log_delay", 60.);
process.run("ps -p $$ -o ppid= > /var/run/streamer/streamer.pid")

radio = input.alsa(device="pcm.liquidsoap");
radio = fallback(track_sensitive=false, [radio, amplify(0.1, noise()) ])
radio = insert_metadata(radio)
def set_metadata(radio)
    url = "https://co.radiocorax.de/api/2/transmissions/now?format=json"
    process.run("curl -s '#{url}' > /tmp/current")
    title = string.trim(process.read("cat /tmp/current | jq -r '.[0].programme.name'"))
    description = string.trim(process.read("cat /tmp/current | jq -r '.[0].programme.synopsis'"))
    print("set title='#{title}' comment='#{description}'")
    radio.insert_metadata([("title", title), ("comment", description)])
end
set_metadata(radio)
thread.run(every=60., {set_metadata(radio)})
output.icecast(%mp3(bitrate=320), host="localhost", port=8765, user="liquidsoap", password="hackme", mount="radio", radio)

