func Eatchar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc

"autocomplet python ###################################################
iabbrev comentdoc 
			\#+------------------------------+#<cr>
			\#\| OPEN \|#<cr>
			\#+------------------------------+#<cr>
			\<cr>
			\<cr>
			\<cr>
			\#+------------------------------+#<cr>
			\#\| END \|#<cr>
			\#+------------------------------+#<cr>
			\<up><up><up><up><up><esc><Home>f@s<c-r>=Css('\s')<cr>

iabbrev if if :<left><c-r>=Eatchar('\s')<cr>
iabbrev args **args<c-r>=Eatchar('\s')<cr>
iabbrev Kwargs **kwargs<c-r>=Eatchar('\s')<cr>
iabbrev elif elif :<left><c-r>=Eatchar('\s')<cr>
iabbrev else else:<esc><c-r>=Eatchar('\s')<cr>
iabbrev def def () -> :<cr>""""""<cr>return<up><up><left><left><left><left><left><left><c-r>=Eatchar('\s')<cr>
iabbrev adef async def () -> :<cr>""""""<cr>return<up><up><c-r>=Eatchar('\s')<cr>
iabbrev defget @property<cr>def (self) -> :<cr>""""""<cr>return self.<up><up><left><left><left><left><left><left><left><left><left><left><left><c-r>=Eatchar('\s')<cr>
iabbrev defset @.setter<cr>def (self, ) -> None:<cr>""""""<cr>self. =<up><up><left><left><left><left><left><left><left><c-r>=Eatchar('\s')<cr>

"iabbrev defgs 
"			\<cr>
"			\@property<cr>
"			\def xyz(self) -> :<cr>
"			\''''''<cr>
"			\return self.xyz<cr>
"			\<cr>
"			\@xyz.setter<cr>
"			\def xyz(self, ) -> None:<cr>
"			\''''''<cr>
"			\return self.xyz =
"
"nmap <space>r <esc>:%s/xyz/

iabbrev for for i in @:<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev while while @:<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev class class @:<cr>""""""<up><esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev from from @ import<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev form from @ import<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev super super().__init__()<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev true True<c-r>=Eatchar('\s')<cr>
iabbrev false False<c-r>=Eatchar('\s')<cr>
iabbrev none None<c-r>=Eatchar('\s')<cr>
iabbrev lambda lambda @:<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev ifname if __name__ == '__main__'@:<esc><Home>f@s<c-r>=Eatchar('\s')<cr>

iabbrev defi def __init__(self, @):<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev defnew def __new__(self, @):<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev defstr def __str__(@) -> str:<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev defrepr def __repr__(@) -> str:<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev defadd def __add__(@):<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev defqe def __qe__(@):<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev defpow def __pow__(@):<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev defdel def __del__(@):<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev deflen def __len__(@):<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev defdelet def __delet__(@):<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev deflen def __len__(@):<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev defne def __ne__(@):<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev defgt def __gt__(@):<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev deflt def __lt__(@):<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev defge def __ge__(@):<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev defle def __le__(@):<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
iabbrev defor def __or__(@):<esc><Home>f@s<c-r>=Eatchar('\s')<cr>
