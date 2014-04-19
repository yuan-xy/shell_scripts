 find  /home/zjzj/jianguan/webapps/ROOT/exam_photo/ -type f -ctime +180   -print0 |xargs -0  -I {} mv {} .
