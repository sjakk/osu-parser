package util_beatmap

import "core:strings"

Title :: "Title:"
TitleU :: "TitleUnicode:"
Artist :: "Artist:"
ArtistU :: "ArtistUnicode:"
Creator :: "Creator:"
Version :: "Version:"
Source :: "Source:"
Tags :: "Tags:"
BeatmapID :: "BeatmapID:"
BeatmapSetID :: "BeatmapSetID:"




cut_string :: proc(input:string,char:rune) -> string {

	pos := strings.index_rune(input,char)
	if pos != -1{
	return input[pos+1:]
	}else{
	return input
	}
}
