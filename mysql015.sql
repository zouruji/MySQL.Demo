USE mysql_study_01;
SELECT *
FROM tb_employee;

/* 时间和日期函数*/
/* select查询的数据如果不是来源于表，可以省略from语句*/

/*
但是在oracle数据库中，select必须匹配from语句
所有oracle提供了dual表用于这种特殊的查询语句
unix_timestamp表示返回unix系统格式的时间戳
表示系统当前时间和1970-01-01 0；0；0的时间差值（值）
而很多编程语言获取的时间戳是毫秒值
*/

SELECT NOW()'当前日期时间', UNIX_TIMESTAMP()'时间戳'
, CURRENT_DATE()'当前日期', CURRENT_TIME()'当前时间';
SELECT birthday, YEAR(birthday)
, MONTH(birthday), DAY(birthday)
, HOUR(birthday), MINUTE(birthday), SECOND(birthday)
FROM tb_employee;
SELECT *
FROM tb_employee
WHERE YEAR(birthday)>=1996 AND YEAR(birthday)<=1998;
SELECT *
FROM tb_employee
WHERE YEAR(birthday) BETWEEN 1996 AND 1998;
/*
week（日期） 日期是当年的第几周
dayofweek 日期是星期几，1是星期天，7是星期六
dayofyear 日期是当年的第几天
dayfmonth 日期是当月的第几天
*/

SELECT WEEK(NOW()), DAYOFWEEK(NOW())
, DAYOFYEAR(NOW()), DAYOFMONTH(NOW());

/*date_odd(日期，interval 日期加的数量 加的位置
（年/月/日/时/分/秒）)
*/
SELECT DATE_ADD(NOW(), INTERVAL 10 DAY)
, DATE_ADD(NOW(), INTERVAL -10 MONTH)
, DATE_ADD(NOW(), INTERVAL 10 YEAR)
, DATE_ADD(NOW(), INTERVAL 67 SECOND);

SELECT DATE_FORMAT(birthday,'%Y年%m月%d日')
, DATE_FORMAT(NOW(),'%H时%i分%s秒')
FROM tb_employee;

/*timestampdiff（时间模式，日期一，日期二）*/
/*返回日期一和日期二的时间差距，时间模式包括年月日时分秒*/
SELECT birthday, TIMESTAMPDIFF(YEAR,birthday, NOW())
, TIMESTAMPDIFF(MONTH,birthday, NOW())
, TIMESTAMPDIFF(DAY,birthday, NOW())
, TIMESTAMPDIFF(HOUR,birthday, NOW())
, TIMESTAMPDIFF(MINUTE,birthday, NOW())
, TIMESTAMPDIFF(SECOND,birthday, NOW())
FROM tb_employee;
SELECT TIMESTAMPDIFF(YEAR,'2001-1-15 9:30:40', NOW());
SELECT *
FROM tb_employee
WHERE TIMESTAMPDIFF(YEAR,birthday, NOW())>=25;