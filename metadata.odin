package main 


import "core:os"
import "core:strings"
import "core:strconv"
import bm "utils"

Metadata :: struct{
Title: string,
TitleU: string,
Artist: string,
ArtistU: string,
Creator: string,
Version: string,
Source: string,
Tags: []string,
BeatmapID: int, // diff id
BeatmapSetID: int, // beatmap id
}


@(private)
meta_init :: proc(pathfile:string,obj:^Metadata){

  line,ok := os.read_entire_file(pathfile,context.allocator)
    if !ok{
        return
    }

    defer delete(line,context.allocator)

    it := string(line)
    for line in strings.split_lines_iterator(&it){

        switch{
            case strings.contains(line,bm.Title):
                obj.Title,_ = strings.cut(line,len(bm.Title))
            
            case strings.contains(line,bm.TitleU):
                obj.TitleU,_ = strings.cut(line,len(bm.TitleU))


            case strings.contains(line,bm.Artist):
                obj.Artist,_ = strings.cut(line,len(bm.Artist))

            case strings.contains(line,bm.ArtistU):
                obj.ArtistU,_ = strings.cut(line,len(bm.ArtistU))
            
            case strings.contains(line,bm.Creator):
                obj.Creator,_ = strings.cut(line,len(bm.Creator))
            
            case strings.contains(line,bm.Version):
                obj.Version,_ = strings.cut(line,len(bm.Version))
            
            case strings.contains(line,bm.Source):
                obj.Source,_ = strings.cut(line,len(bm.Source))
            
            case strings.contains(line,bm.BeatmapID):
                value,_ := strconv.parse_int(strings.cut(line,len(bm.BeatmapID)))
                obj.BeatmapID = value

            case strings.contains(line,bm.BeatmapSetID):
                value,_ := strconv.parse_int(strings.cut(line,len(bm.BeatmapSetID)))
                obj.BeatmapSetID = value


            case strings.contains(line,bm.Tags):
                str,_ := strings.cut(line,len(bm.Tags))
                value := strings.split_after(str," ")
                obj.Tags = value
        }
            


    }
}



