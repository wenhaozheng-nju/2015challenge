
$path="/run/user/zwh/gvfs/smb-share:server=114.212.190.147,share=lamda/zhengwh/data/";
#$dst_path="/run/user/zwh/gvfs/smb-share:server=114.212.190.147,share=lamda/zhengwh/min_data/";
$dst_path="/run/user/zwh/gvfs/smb-share:server=114.212.190.147,share=lamda/zhengwh/min_data/";
$file_name="Tags";
$file_end="</tags>";
open(SRC_FILE,"<",$path.$file_name.".xml")||die"cannot open the file:$!\n";

$i=1;
$start_line1=<SRC_FILE>;
$start_line2=<SRC_FILE>;
$threshold=9000;
$count=1;

 
open(DST_FILE,">".$dst_path.$file_name."_".$count.".xml");
print DST_FILE $start_line1;
print DST_FILE $start_line2;
while($line=<SRC_FILE>){
    if($i>$threshold)
    {
        $i=1;
        $count=$count+1;
        close DST_FILE;
        open(DST_FILE,">".$dst_path.$file_name."_".$count.".xml");
        print DST_FILE $start_line1;
        print DST_FILE $start_line2;
    }
    print DST_FILE $line;
    $i=$i+1;
}
close SRC_FILE;
close DST_FILE;
$i=1;
while($i<$count)
{
    open(DST_FILE,">>".$dst_path.$file_name."_".$i.".xml");
    print DST_FILE $file_end;
    close DST_FILE;
    $i=$i+1;
}
