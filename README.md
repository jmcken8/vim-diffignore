# Vim plugin for ignoring patterns in a diff.

## Functions

### DiffIgnoreAdd

    call DiffIgnoreAdd("regex1", "regex2", ...)

Adds one or more regexes to the list of patterns to ignore.
Note that to ignore a diff section, all lines in both panes
of the diff must match.

Updates the diff panes after.

### DiffIgnoreRemove

    call DiffIgnoreRemove("regex1", "regex2", ...)

Removes one or more regexes from the list of patterns to ignore.

Updates the diff panes after.


### DiffIgnoreList

    call DiffIgnoreList()

List all current diffs.
