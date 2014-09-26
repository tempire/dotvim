let $VIMHOME=expand('<sfile>:p:h:h')
let $VIM_USER_RC = $VIMHOME . "/vimrc.". luser
execute "silent! source " . $VIM_USER_RC
