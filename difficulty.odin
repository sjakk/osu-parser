package main

import "core:fmt"
import "core:os"
import "core:strings"
import "core:strconv"
import bm "utils"

Difficulty :: struct {
	HPDrainRate:u32,
	CircleSize:u32,
	OverallDifficulty:u32,
	ApproachRate:u32,
	SliderMultiplier:f32,
	SliderTickRate:u32,
}






diff_init :: proc(pathfile:string,obj:^Difficulty){

file,ok := os.read_entire_file(pathfile)
if !ok{
	return;
}

defer delete(file,context.allocator)

it := string(file)

for line in strings.split_lines_iterator(&it){

switch{
	case strings.contains(line,"HPDrainRate"):
		value,_ := strconv.parse_int(bm.cut_string(line,':'))
		obj.HPDrainRate = u32(value)
	case strings.contains(line,"CircleSize"):
		value,_ := strconv.parse_int(bm.cut_string(line,':'))
		obj.CircleSize = u32(value)
	case strings.contains(line,"OverallDifficulty"):
		value,_ := strconv.parse_int(bm.cut_string(line,':'))
		obj.OverallDifficulty = u32(value)
	case strings.contains(line,"ApproachRate"):
		value,_ := strconv.parse_int(bm.cut_string(line,':'))
		obj.ApproachRate = u32(value)
	case strings.contains(line,"SliderMultiplier"):
		value,_ := strconv.parse_f32(bm.cut_string(line,':'))
		obj.SliderMultiplier = value
	case strings.contains(line,"SliderTickRate"):
		value,_ := strconv.parse_int(bm.cut_string(line,':'))
		obj.SliderTickRate = u32(value)
}
}

}
