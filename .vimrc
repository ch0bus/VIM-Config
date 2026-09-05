" === vim-plug ===
call plug#begin('~/.vim/plugged')

" Подсветка синтаксиса Python
Plug 'vim-python/python-syntax'

" Автодополнение (требует Node.js)
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" === Основные настройки ===
set number                          " Номера строк
"set relativenumber                  " Относительные номера
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
autocmd FileType python setlocal colorcolumn=120    " Линии на 79 и 120 символах
highlight ColorColumn ctermbg=darkgray
highlight ColorColumn ctermbg=8

" Удалять пробелы в конце строк при сохранении Python файлов
autocmd BufWritePre *.py :%s/\s\+$//e

" Автоформатирование на 4 пробела
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

" === NERDTree ===
nnoremap <leader>n :NERDTreeToggle<CR>

" === Ctrl+P (поиск файлов) ===
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" === Python Syntax ===
let g:python_highlight_all = 1
