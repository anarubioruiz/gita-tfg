# -*- tab-width:4 -*-
# This file must not be executable.
#
# To use that functions and aliases, put next line in your .bashrc:
#   source /usr/share/arco-tools/devel.sh

function fexec() {
	cmd=$*

	while [ 1 ]; do
		if type notify-send > /dev/null; then
			notify-send -t 1500 -i gtk-info "fexec: starting" "$cmd" &
		fi

		$cmd
		retval=$?

		echo DONE:$retval

		if type notify-send > /dev/null; then
			if [ $retval -eq 0 ]; then
				icon='gtk-yes'
			else
				icon='gtk-no'
			fi
			notify-send -t 2000 -i $icon "fexec: $retval" "$ $cmd"
		fi
		inotifywait -qr -e MODIFY . || break
		sync
		sleep 0.5
	done
}

alias fmake='fexec make'
