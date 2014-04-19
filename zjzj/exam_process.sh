cd /home/zjzj/jianguan/webapps/ROOT/exam_photo
ls | xargs identify | grep -v JPEG > ../exam_no_jpg.txt
cd ..
awk -F [ '{print $1}' exam_no_jpg.txt > exam_no_jpg2.txt

for f in  `cat exam_no_jpg2.txt`
do
echo "convert exam_photo/${f} exam_photo/${f}"
convert exam_photo/${f} exam_photo/${f}
done
