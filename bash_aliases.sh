#!/usr/bin/env sh

# Aliases for bash, probably work on other shells too.
#
# Provides the following aliases:
#
# - openf
# - openg
#
# You can include these aliases in your own ~/.bash_alias by copy/pasting
# the contents of this file.
# You could also include this file from your ~/.bash_aliases for
# automatic updates.
#
# ```
#   . ~/projects/ide/bash_aliases.sh
# ```

# Fuzzy finder. Requires fd, fzf and bat
openf() {
	# Find all files with fd, pass them to fzf for selecting and use bat to
	# render the preview
	# It allows the user to select multiple files to be opened with the
	# editor.
	FILES=$(fd --type f | fzf --layout=reverse --height=40 --multi --preview 'bat --color=always {}' | tr '\n' ' ')

	# Only open editor if at least one file is selected
	if [ -n "$FILES" ]; then
		# Use spaces instead of newlines for seperating the files
		FILES=$(echo "$FILES" | tr '\n' ' ')

		# Append the command to the history, as if the user entered
		# the command
		history -s $EDITOR $FILES

		# Open the editor with the selected files
		$EDITOR $FILES
	fi
}

# regular epxression finder. Requires rg ("ripgrep") and fzf.
# Note that you can pass arguments to prepopulate the searchbar.
openg() {
	INITIAL_QUERY="$*"
	RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case"
	FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY'" \

	# Execute rg whenever the user changes input. Allow the user
	# to select more than one file
	FILES=$(fzf --bind "change:reload:$RG_PREFIX {q} || true" \
		--ansi --query "$INITIAL_QUERY" \
		--layout=reverse --height=40 --multi
	)

	if [ -n "$FILES" ]; then
		FILES=$(echo "$FILES" | cut -d ':' -f 1 | tr '\n' ' ')

		# Append the command to the history, as if the user entered
		# the command
		history -s $EDITOR $FILES

		# Open the editor with the selected files
		$EDITOR $FILES
	fi
}
