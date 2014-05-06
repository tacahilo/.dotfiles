import sys

percol.view.PROMPT  = ur"<bold><yellow>Input:</yellow></bold> %q"
percol.view.RPROMPT = ur"(%F) [%i/%I]"

from percol.finder import FinderMultiQueryMigemo
if sys.platform == "darwin":
    FinderMultiQueryMigemo.dictionary_path = "/usr/local/Cellar/cmigemo/20110227/share/migemo/utf-8/migemo-dict"
else:
    FinderMultiQueryMigemo.dictionary_path = "/usr/local/share/migemo/utf-8/migemo-dict"

# Emacs like
percol.import_keymap({
    "C-a" : lambda percol: percol.command.beginning_of_line(),
    "C-b" : lambda percol: percol.command.backward_char(),
    "C-d" : lambda percol: percol.command.delete_forward_char(),
    "C-e" : lambda percol: percol.command.end_of_line(),
    "C-f" : lambda percol: percol.command.forward_char(),
    "C-g" : lambda percol: percol.cancel(),
    "C-h" : lambda percol: percol.command.delete_backward_char(),
    "C-j" : lambda percol: percol.finish(),
    "C-k" : lambda percol: percol.command.kill_end_of_line(),
    "C-m" : lambda percol: percol.finish(),
    "C-n" : lambda percol: percol.command.select_next(),
    "C-p" : lambda percol: percol.command.select_previous(),
    "C-v" : lambda percol: percol.command.select_next_page(),
    "C-y" : lambda percol: percol.command.yank(),
    "M-<" : lambda percol: percol.command.select_top(),
    "M->" : lambda percol: percol.command.select_bottom(),
    "M-v" : lambda percol: percol.command.select_previous_page(),
})
