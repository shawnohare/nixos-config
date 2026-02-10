# Configuration file for ipython.
#
# To generate a new config to see, e.g., all the options, run
# ipython profile create foo
c = get_config()

c.TerminalInteractiveShell.auto_match = True
c.TerminalInteractiveShell.editor = "nvim"
c.TerminalInteractiveShell.editing_mode = "vi"
c.TerminalInteractiveShell.prompt_includes_vi_mode= "vi"
c.TerminalInteractiveShell.true_color = True
# c.Completer.use_jedi = True
