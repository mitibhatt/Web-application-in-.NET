# Host: localhost  (Version: 5.5.42)
# Date: 2015-06-22 11:42:54
# Generator: MySQL-Front 5.3  (Build 4.198)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "tblanswer"
#

CREATE TABLE `tblanswer` (
  `answerid` int(11) NOT NULL AUTO_INCREMENT,
  `questionid` int(11) NOT NULL DEFAULT '0',
  `answer` varchar(1000) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL DEFAULT '',
  `dateandtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`answerid`),
  KEY `Foreign Key` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tblquery"
#

CREATE TABLE `tblquery` (
  `queryid` int(11) NOT NULL AUTO_INCREMENT,
  `querydesc` varchar(500) NOT NULL DEFAULT '',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`queryid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Structure for table "tblquestion"
#

CREATE TABLE `tblquestion` (
  `questionid` int(11) NOT NULL AUTO_INCREMENT,
  `queryid` int(11) NOT NULL DEFAULT '0',
  `question` varchar(1000) NOT NULL DEFAULT '',
  `username` varchar(100) NOT NULL DEFAULT '',
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Procedure "PrcDdlrelatedto"
#

CREATE PROCEDURE `PrcDdlrelatedto`()
BEGIN
select queryid,queryDesc from tblquery where flag = 1;
END;

#
# Procedure "PrcGetAnswer"
#

CREATE PROCEDURE `PrcGetAnswer`(
qid int(11)
)
BEGIN
select answer as Answer,username as Postedby, dateandtime as Datetime from tblanswer 
where questionid = qid order by dateandtime desc;
END;

#
# Procedure "PrcGetQuestionForLabel"
#

CREATE PROCEDURE `PrcGetQuestionForLabel`( qid int(11))
BEGIN
select question from tblquestion where questionid = qid;
END;

#
# Procedure "PrcInsTblanswer"
#

CREATE PROCEDURE `PrcInsTblanswer`(
questionid int(11),
answer varchar (500),
username varchar(10),
datetime datetime
)
BEGIN
Insert into tblanswer (questionid,answer,username,dateandtime) values (questionid,answer,username,datetime);
END;

#
# Procedure "PrcInsTblQuestion"
#

CREATE PROCEDURE `PrcInsTblQuestion`(
queryid int(11),
question varchar(500),
username varchar (100),
datetime datetime)
BEGIN
insert into tblquestion (queryid,question,username,datetime) values (queryid,question,username,now());
END;

#
# Procedure "PrcQuestion"
#

CREATE PROCEDURE `PrcQuestion`()
BEGIN
SELECT   q.questionid, q.question, tq.querydesc,
          IFNULL(a.total, 0) num, q.datetime
FROM      tblquery tq,tblquestion q
LEFT JOIN ( SELECT   COUNT(*) total, questionid
            FROM     tblanswer
            GROUP BY questionid
          ) a ON (a.questionid = q.questionid) where tq.queryid = q.queryid order by q.datetime desc;
END;
