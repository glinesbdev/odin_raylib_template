package game

import "core:fmt"
import "core:mem"

MEMCHECK :: #config(MEMCHECK, true)

main :: proc() {
    when MEMCHECK {
        track: mem.Tracking_Allocator
        mem.tracking_allocator_init(&track, context.allocator)
        context.allocator = mem.tracking_allocator(&track)

        defer {
            for _, entry in track.allocation_map {
                fmt.eprintf("%v leaked %v bytes\n", entry.location, entry.size)
            }

            for entry in track.bad_free_array {
                fmt.eprintf("%v bad free\n", entry.location)
            }

            free_all(context.temp_allocator)
            mem.tracking_allocator_destroy(&track)
        }
    }

    game_init()
}
