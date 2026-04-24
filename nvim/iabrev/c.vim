func Eatchar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc
iabbrev include #include  <left><c-r>=Eatchar('\s')<cr>
iabbrev return return ;<left><c-r>=Eatchar('\s')<cr>
iabbrev include #include  <left><c-r>=Eatchar('\s')<cr>
iabbrev for for(){}<left><left><left><c-r>=Eatchar('\s')<cr>
iabbrev while while(){}<left><left><left><c-r>=Eatchar('\s')<cr>
iabbrev dowhile do{}while()<left><c-r>=Eatchar('\s')<cr>
iabbrev if if(){}<left><left><left><c-r>=Eatchar('\s')<cr>
iabbrev elseif else if(){}<left><left><left><c-r>=Eatchar('\s')<cr>
iabbrev else else{}<left><c-r>=Eatchar('\s')<cr>
