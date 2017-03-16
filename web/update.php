<?php
//测试代码 
//例如：$o = SocketPOP3Client('邮箱地址', '密码', 'POP3服务器', 'POP3端口') 

include'PhpImap/Mailbox.php';
include'PhpImap/IncomingMail.php';
include'mysqli.php';
set_time_limit(0);
// 4. argument is the directory into which attachments are to be saved:
$mailbox = new PhpImap\Mailbox('{imap.qq.com:993/imap/ssl}INBOX', 'ok@xjiangwei.cn', '********', __DIR__);

// Read all messaged into an array:
$mailsIds = $mailbox->searchMailbox('ALL');
if(!$mailsIds) {
    die('Mailbox is empty');
}
$re=$mysqli->query("select id from email");
$dbnum=$re->num_rows;

$emnum=count($mailsIds);

$getnum=$emnum-$dbnum;  //需要获取这么多邮件

//echo "emnum=".$emnum.'<br>';
//print_r($mailsIds);

for($i=$dbnum;$i<$emnum;$i++)    //检查数据库邮件数和邮箱邮件数是否相同，不相同把最新的插入数据库
{
	$mail = $mailbox->getMail($mailsIds[$i]);

	$sql="insert into `email` values ('{$i}','{$mail->subject}','{$mail->fromName}','{$mail->fromAddress}','{$mail->date}')";
	//echo $sql.'<br>';
	
	$mysqli->query($sql);
	
}

echo 'success';
?> 
