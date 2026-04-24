func Eatchar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc

iabbrev select SELECT <c-r>=Eatchar('\s')<cr>
iabbrev insert INSERT <c-r>=Eatchar('\s')<cr>
iabbrev into INTO <c-r>=Eatchar('\s')<cr>
iabbrev convert CONVERT <c-r>=Eatchar('\s')<cr>
iabbrev float FLOAT <c-r>=Eatchar('\s')<cr>
iabbrev varchar VARCHAR <c-r>=Eatchar('\s')<cr>
iabbrev char CHAR <c-r>=Eatchar('\s')<cr>
iabbrev auto_increment AUTO_INCREMENT <c-r>=Eatchar('\s')<cr>
iabbrev create CREATE <c-r>=Eatchar('\s')<cr>
iabbrev table TABLE <c-r>=Eatchar('\s')<cr>
iabbrev show SHOW <c-r>=Eatchar('\s')<cr>
iabbrev from FROM <c-r>=Eatchar('\s')<cr>
iabbrev drop DROP <c-r>=Eatchar('\s')<cr>
iabbrev delete DELETE <c-r>=Eatchar('\s')<cr>
iabbrev where WHERE <c-r>=Eatchar('\s')<cr>
iabbrev values VALUES <c-r>=Eatchar('\s')<cr>
iabbrev min MIN <c-r>=Eatchar('\s')<cr>
iabbrev go GO <c-r>=Eatchar('\s')<cr>
iabbrev new NEW <c-r>=Eatchar('\s')<cr>
iabbrev delimiter DELIMITER <c-r>=Eatchar('\s')<cr>
iabbrev trigger TRIGGER <c-r>=Eatchar('\s')<cr>
iabbrev row ROW <c-r>=Eatchar('\s')<cr>
iabbrev each EACH <c-r>=Eatchar('\s')<cr>
iabbrev begin BEGIN <c-r>=Eatchar('\s')<cr>
iabbrev for FOR <c-r>=Eatchar('\s')<cr>
iabbrev group GROUP <c-r>=Eatchar('\s')<cr>
iabbrev max MAX <c-r>=Eatchar('\s')<cr>
iabbrev like LIKE <c-r>=Eatchar('\s')<cr>
iabbrev in IN <c-r>=Eatchar('\s')<cr>
iabbrev as AS <c-r>=Eatchar('\s')<cr>
iabbrev not NOT <c-r>=Eatchar('\s')<cr>
iabbrev desc DESC <c-r>=Eatchar('\s')<cr>
iabbrev mid MID <c-r>=Eatchar('\s')<cr>
iabbrev len LEN <c-r>=Eatchar('\s')<cr>
iabbrev ucase UCASE <c-r>=Eatchar('\s')<cr>
iabbrev lcase LCASE <c-r>=Eatchar('\s')<cr>
iabbrev primary PRIMARY <c-r>=Eatchar('\s')<cr>
iabbrev key KEY <c-r>=Eatchar('\s')<cr>
iabbrev int INT <c-r>=Eatchar('\s')<cr>
iabbrev identity IDENTITY <c-r>=Eatchar('\s')<cr>
iabbrev constraint CONSTRAINT <c-r>=Eatchar('\s')<cr>
iabbrev order ORDER <c-r>=Eatchar('\s')<cr>
iabbrev by BY <c-r>=Eatchar('\s')<cr>
iabbrev on ON <c-r>=Eatchar('\s')<cr>
iabbrev sum SUM <c-r>=Eatchar('\s')<cr>
iabbrev left LEFT <c-r>=Eatchar('\s')<cr>
iabbrev and AND <c-r>=Eatchar('\s')<cr>
iabbrev case CASE <c-r>=Eatchar('\s')<cr>
iabbrev else ELSE <c-r>=Eatchar('\s')<cr>
iabbrev end END <c-r>=Eatchar('\s')<cr>
iabbrev avg AVG <c-r>=Eatchar('\s')<cr>
iabbrev year YEAR <c-r>=Eatchar('\s')<cr>
iabbrev inner INNER <c-r>=Eatchar('\s')<cr>
iabbrev join JOIN <c-r>=Eatchar('\s')<cr>
iabbrev then THEN <c-r>=Eatchar('\s')<cr>
iabbrev null NULL <c-r>=Eatchar('\s')<cr>
iabbrev when WHEN <c-r>=Eatchar('\s')<cr>
iabbrev isnull ISNULL <c-r>=Eatchar('\s')<cr>
iabbrev output OUTPUT <c-r>=Eatchar('\s')<cr>
iabbrev declare DECLARE <c-r>=Eatchar('\s')<cr>
iabbrev view VIEW <c-r>=Eatchar('\s')<cr>
iabbrev or OR <c-r>=Eatchar('\s')<cr>
iabbrev as AS <c-r>=Eatchar('\s')<cr>
iabbrev top TOP <c-r>=Eatchar('\s')<cr>
iabbrev replace REPLACE <c-r>=Eatchar('\s')<cr>

















