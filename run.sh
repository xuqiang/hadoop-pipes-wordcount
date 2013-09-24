hadoop=~/var/hadoop-1.1.2/bin/hadoop

$hadoop fs -rmr /tmp/wordcount
$hadoop fs -copyFromLocal ./wordcount /tmp/

$hadoop fs -rmr /tmp/output/
$hadoop pipes -conf ./word.xml -input /tmp/input -output /tmp/output/
