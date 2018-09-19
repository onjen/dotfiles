#!/bin/sh

sink=$(pactl list sinks short | grep RUNNING | cut -c1)

volume_print() {

    muted=$(~/src/pamixer/pamixer --sink $sink --get-mute)

    if [ "$muted" = true ]; then
        echo "$sink --"
    else
        echo "$sink: $(~/src/pamixer/pamixer --sink $sink --get-volume)"
    fi
}

volume_up() {
    pactl set-sink-volume $sink +1%
}

volume_down() {
    pactl set-sink-volume $sink -1%
}

volume_mute() {
    pactl set-sink-mute $sink toggle
}

listen() {
    volume_print

    pactl subscribe | while read -r event; do
        if echo "$event" | grep -q "#$sink"; then
            volume_print
        fi
    done
}

case "$1" in
    --up)
        volume_up
        ;;
    --down)
        volume_down
        ;;
    --mute)
        volume_mute
        ;;
    *)
        listen
        ;;
esac
