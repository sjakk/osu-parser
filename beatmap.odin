package main


import "core:fmt"

obj: Beatmap 


Beatmap :: struct{
Meta: Metadata,
Diff: Difficulty,
//TODO: Edit: Editor,
}

pathfile :: "asset_files/candyland.osu"

main :: proc(){
meta_init(pathfile,&obj.Meta)
diff_init(pathfile,&obj.Diff)


fmt.println(obj);
}
