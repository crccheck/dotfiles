# see https://github.com/jni/ipython-config/blob/master/ipython_config.py

c = get_config()

c.TerminalInteractiveShell.autocall = 1
c.TerminalInteractiveShell.confirm_exit = False
c.TerminalInteractiveShell.colors = 'Linux'

c.InteractiveShellApp.exec_lines = []
c.InteractiveShellApp.exec_lines.append('%load_ext autoreload')
c.InteractiveShellApp.exec_lines.append('%autoreload 2')
c.InteractiveShellApp.exec_lines.append('print "%autoreload activated"')

