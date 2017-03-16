

<table class="table table-bordered">
<th  align="center" style="text-align:center;"  colspan="5">已收到的邮件</th>

<tr align="center"><th align="center">类型</th><th align="center">邮件标题</th><th align="center">邮箱地址</th><th align="center">发件人</th><th align="center">时间</th></tr>
<?php

include'mysqli.php';

$sql='select * from work';

$re=$mysqli->query($sql);

while($array=$re->fetch_assoc())
{
	echo "
	<tr align=\"center\"><td>{$array['type']}</td><td>{$array['subject']}</td><td>{$array['fromadd']}</td><td>{$array['fromname']}</td><td>{$array['date']}</td></tr>
	
	
	
	";
	
}

?>
</table>