package main


import "core:fmt"

obj: Beatmap 


Beatmap :: struct{
Meta: Metadata,
// TODO: Diff: Difficulty
}


main :: proc(){
meta_init("asset_files/candyland.osu",&obj.Meta)
}