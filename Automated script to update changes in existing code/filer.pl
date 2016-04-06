print "enter the file name";
chomp($fname1=<>);
open(DATA1,"<".$fname1);
@arr11=<DATA1>;
close(DATA1);
$jkl=0;
$stoppart="stop_script";

until($arr11[$jkl] =~ /$stoppart/)
{
print "$arr11[$jkl]";


$fname=$arr11[$jkl];
open(DATA,"<".$fname);
@arr1=<DATA>;
close(DATA);
@arr2=();
$pattern="def test_";
$pattern2="def tearDown";
$arr1len=$#arr1+1;
print "$arr1len";
$i=0;
until($arr1[$i] =~ /$pattern/)
{
push(@arr2,$arr1[$i]);
$i++;
if($i == $arr1len)
{
print "operation incomplete";
exit 0;
}
}
push(@arr2,$arr1[$i]);

$i++;
push(@arr2,"        try:\n");
print "$i";

until($arr1[$i] =~ /$pattern2/)
{
$space="    ";
$temp=$space.$arr1[$i];
push(@arr2,$temp);
$i++;
print "$i";
print "\n";
}

push(@arr2,"        except Exception as e:\n");
push(@arr2,"            exc_type, exc_obj, exc_tb,fname = master_module.catch_exception(e,self.start_time)\n");
push(@arr2,"            self.fail(\"\\n ERROR NAME : \"+str(exc_type)+\"\\nFILE NAME : \"+str(fname)+\"\\nERROR AT LINE : \"+str(exc_tb.tb_lineno)+\"\\nREASON FOR FAILURE : \" + str(e))\n");
push(@arr2,$arr1[$i]);

$i++;

print "$i";
print "$arr1len";
for($j=$i;$j<$arr1len;$j++)
{
push(@arr2,$arr1[$j]);
}
open(DATA,">".$fname);
print DATA @arr2;
close(DATA);


$jkl++;
}
