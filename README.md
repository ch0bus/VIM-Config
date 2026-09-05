Создайте или отредактируйте файл ~/.vimrc:
vim
```
" === Основные настройки ===
set number                          " Номера строк
set relativenumber                  " Относительные номера
set cursorline                      " Подсветка текущей строки
set mouse=a                         " Включить мышь
set clipboard=unnamedplus           " Буфер обмена системы
set encoding=utf-8                  " UTF-8 по умолчанию

" === Отступы и табуляция ===
set expandtab                       " Пробелы вместо табов
set tabstop=4                       " Ширина таба = 4 пробела
set shiftwidth=4                    " Автоотступ = 4 пробела
set softtabstop=4                   " Удаление 4 пробелов за раз
set autoindent                      " Автоотступ новых строк

" === Поиск ===
set ignorecase                      " Игнорировать регистр
set smartcase                       " Но не игнорировать если CAPS
set incsearch                       " Поиск по мере ввода
set hlsearch                        " Подсветить результаты поиска

" === Внешний вид ===
syntax enable                       " Подсветка синтаксиса
set background=dark                 " Тёмная тема
colorscheme desert                  " Или: darkblue, murphy и т.д.
set laststatus=2                    " Всегда показывать статусбар

" === Производительность ===
set lazyredraw                      " Не перерисовывать во время макросов
set ttyfast                         " Быстрое соединение

" === Поведение ===
set backspace=indent,eol,start      " Нормальное удаление
set showmatch                       " Подсветка парных скобок
set autoread                        " Обновлять при изменении снаружи
set wildmenu                        " Автодополнение команд
set listchars=tab:→\ ,trail:·       " Видимые символы

" === Горячие клавиши ===
let mapleader = ","                 " Leader = запятая

" Быстрое сохранение
nnoremap <leader>w :w<CR>

" Быстрый выход
nnoremap <leader>q :q<CR>

" Отключить подсветку поиска
nnoremap <leader>h :nohlsearch<CR>

" Переключаться между сплитами
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" === Python специфика ===
" Проверка PEP8
autocmd FileType python setlocal textwidth=79
autocmd FileType python setlocal colorcolumn=79,120    " Линии на 79 и 120 символах

" Удалять пробелы в конце строк при сохранении Python файлов
autocmd BufWritePre *.py :%s/\s\+$//e

" Автоформатирование на 4 пробела
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

С плагинами (рекомендуется)
```
Используйте vim-plug для управления плагинами.
1. Установить vim-plug
```bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
2. Расширенный ~/.vimrc с плагинами
vim
```
" === vim-plug ===
call plug#begin('~/.vim/plugged')

" Подсветка синтаксиса Python
Plug 'vim-python/python-syntax'

" Автодополнение (требует Node.js)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Файловый браузер
Plug 'preservim/nerdtree'

" Комментирование кода
Plug 'tpope/vim-commentary'

" Git интеграция
Plug 'tpope/vim-fugitive'

" Поиск файлов
Plug 'ctrlpvim/ctrlp.vim'

" Красивый статусбар
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Темы
Plug 'gruvbox-community/gruvbox'

call plug#end()

" === Основные настройки (как выше) ===
set number
set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4
syntax enable
colorscheme gruvbox
set background=dark

" === NERDTree ===
nnoremap <leader>n :NERDTreeToggle<CR>

" === Ctrl+P (поиск файлов) ===
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" === Python Syntax ===
let g:python_highlight_all = 1
```
3. Установить плагины
bash
```
vim +PlugInstall +qall
```
# Для Neovim (современная альтернатива)

Если хотите что-то проще, используйте Neovim с init.lua:
bash
```
# Установить
brew install neovim  # macOS
# или
sudo apt install neovim  # Linux
```
```
# Создать конфиг
mkdir -p ~/.config/nvim
cat > ~/.config/nvim/init.lua << 'EOF'
```
```
-- Основные настройки
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.cursorline = true
vim.cmd.colorscheme("desert")
EOF
```
Для вашего Django проекта

Добавьте в ~/.vimrc:
vim
```
" === Django специфика ===
autocmd FileType python,html setlocal colorcolumn=79,120

" Быстрый запуск тестов
nnoremap <leader>t :!python manage.py test<CR>

" Запуск сервера
nnoremap <leader>s :!python manage.py runserver<CR>
```
Потом:
```bash

source ~/.bashrc
export EDITOR=vim
```
Теперь Vim будет использоваться редактором по умолчанию! ✅

### что такое nnoremap
nnoremap — маппинг клавиш в Vim

nnoremap — это команда для переназначения клавиш в нормальном режиме (Normal Mode) Vim.
Разбор слова
Часть	Значение
n	Normal mode (нормальный режим, когда вы не печатаете)
nore	no recursive (без рекурсии — не вызывает другие маппинги)
map	переназначить клавишу
Синтаксис
vim

nnoremap <leader>w :w<CR>

    <leader> — клавиша-префикс (по умолчанию \, часто меняют на ,)
    w — вторая нажимаемая клавиша
    :w<CR> — команда Vim (:w + Enter)

Результат: При нажатии \w или ,w файл сохраняется
Примеры
vim
```
" Сохранить файл
nnoremap <leader>w :w<CR>

" Выход
nnoremap <leader>q :q<CR>

" Перейти на следующий буфер
nnoremap <Tab> :bn<CR>

" Удалить текущую строку
nnoremap <leader>d dd

" Скопировать всё в буфер
nnoremap <leader>a ggVG"+y

Разница между map, noremap, nmap, nnoremap
Команда	Режим	Рекурсия
map	Normal, Visual, Operator	✓ Есть (может вызвать другой map)
noremap	Normal, Visual, Operator	✗ Нет (безопаснее)
nmap	Normal	✓ Есть
nnoremap	Normal	✗ Нет (самая безопасная)
imap	Insert	✓ Есть
inoremap	Insert	✗ Нет
Почему nnoremap лучше nmap?
vim

" Опасно (рекурсия)
nmap <leader>d dd        " удалить строку
nmap d <leader>d         " если ещё раз нажать d...

" Безопасно (нет рекурсии)
nnoremap <leader>d dd    " просто удаляет строку

Вывод: используйте nnoremap (с nore) — так маппинги не будут конфликтовать!
В вашем ~/.vimrc
vim

let mapleader = ","              " Установить leader на запятую

nnoremap <leader>w :w<CR>        " ,w — сохранить
nnoremap <leader>q :q<CR>        " ,q — выход
nnoremap <leader>h :nohlsearch<CR>  " ,h — выключить подсветку поиска
nnoremap <C-h> <C-w>h            " Ctrl+h — перейти влево между сплитами

Типичные префиксы:

    <leader> — пользовательский (, или \)
    <C-x> — Ctrl+x
    <S-x> — Shift+x
    <A-x> — Alt+x

Теперь вы можете быстро выполнять команды! 🚀

что это значит: " Переключаться между сплитами
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
Переключение между сплитами в Vim

Сплит — это разделение окна Vim на несколько панелей.
Что это делает
vim

nnoremap <C-h> <C-w>h    " Ctrl+h → перейти ВЛЕВО
nnoremap <C-j> <C-w>j    " Ctrl+j → перейти ВНИЗ
nnoremap <C-k> <C-w>k    " Ctrl+k → перейти ВВЕРХ
nnoremap <C-l> <C-w>l    " Ctrl+l → перейти ВПРАВО

h, j, k, l — это стандартные клавиши движения в Vim (как стрелки, но на домашнем ряду).
Пример

Создайте сплиты в Vim:
bash

vim

Внутри Vim (нормальный режим):
vim

:split         " Разделить по горизонтали
:vsplit        " Разделить по вертикали

Результат:

┌─────────────────┐
│   Файл 1        │
├─────────────────┤
│   Файл 2        │
└─────────────────┘

Без маппинга (стандартный способ)

Переключение между окнами:
vim

Ctrl+w h    " влево
Ctrl+w j    " вниз
Ctrl+w k    " вверх
Ctrl+w l    " вправо

Минус: нужно нажимать Ctrl+w каждый раз — медленно и неудобно.
С маппингом (ваш вариант)
vim

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

Плюс: просто Ctrl+h вместо Ctrl+w h — быстрее!
В действии
bash

# Создать сплиты
vim file1.py file2.py file3.py

# Внутри Vim
:split        # или :sp
:vsplit       # или :vs

Визуально:

┌──────────────┬──────────────┐
│   file1.py   │   file2.py   │
├──────────────┼──────────────┤
│              file3.py       │
└──────────────┴──────────────┘

Навигация:

    Ctrl+h → на file1
    Ctrl+j → на file3
    Ctrl+k → на file2
    Ctrl+l → на file2

Для вашего Django проекта

Очень удобно работать с несколькими файлами одновременно:
bash

vim models.py views.py serializers.py

# В Vim:
:vsplit models.py
:split views.py

# Быстро переключаться:
# Ctrl+h, Ctrl+j, Ctrl+k, Ctrl+l

Это экономит кучу времени! 🎯
```
### как закрыть сплит
Закрытие сплита в Vim

Основные способы:
1. Закрыть текущий сплит
vim

:q          " Quit — закрыть текущее окно

или
vim

:close      " Полный синтаксис команды close

2. Закрыть все остальные сплиты (оставить только текущий)
vim

:only       " Only — оставить только это окно

3. Закрыть все сплиты одновременно
vim

:qa         " Quit All — закрыть все окна и выйти из Vim
:wqa        " Write Quit All — сохранить всё и выйти

Примеры

Есть три сплита:

┌──────────────┬──────────────┐
│   file1.py   │   file2.py   │  ← вы здесь
├──────────────┼──────────────┤
│              file3.py       │
└──────────────┴──────────────┘

:q — закроет только file2.py:

┌──────────────┐
│   file1.py   │
├──────────────┤
│   file3.py   │
└──────────────┘

:only — оставит только file2.py:

┌──────────────┐
│   file2.py   │
└──────────────┘

С маппингом в .vimrc

Если хотите быстрее закрывать, добавьте в .vimrc:
vim

nnoremap <C-q> :q<CR>       " Ctrl+q для быстрого закрытия
nnoremap <Leader>q :only<CR> " ,q для оставления только текущего окна

Тогда просто нажмите Ctrl+q вместо :q + Enter.
