# .vim
Vim configuration

To install, just place the **.vim** folder under your home. Copy (or ln -s) the **.vim/.vimrc** file under your home also.

- For python checkers, install pep8 and flake8 with `pip install pep8 flake8`
- If autocomplete is not working:
    - sudo apt-get install build-essential cmake python-dev
    - cd ~/.vim/bundle/YouCompleteMe; ./install.sh --clang-completer

## Shortcuts

__Normal mode__:
- Ctrl+p: Set paste mode. Ideal when you need to copy with <C-v>.
- Ctrl+n: Disable paste mode.
- za: Fold/unfold
- ñ: Disable highlight search
- F5: Remove trailing whitespace
- Ctrl+t: Open new tab.
- Ctrl+c: Close current tab.
- Tab: Navigate to next tab.
- Shift+Tab: Navigate to previous tab.
- Ctrl+e: Go to next error.
- F12: Generate ctags (then you can use :tag tagname to look for definitions).
    - Ctrl-]: jump to the definition of the word below your cursor.
    - Ctrl-t: Go to the previous file before the jump.
    - :tj tagname: Jump to tag definition.
- F8: Toggle tagbar at the right.
    - Ctrl-N: Go to next Top level tag.
    - Ctrl-P: Go to previous level tag.

__Command mode__:
- w!!: Make the write command ask password for sudo.
