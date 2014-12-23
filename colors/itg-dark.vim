" Vim color file
" Converted from Textmate theme itg.dark using Coloration v0.3.3 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "itg-dark"

hi Cursor                         ctermfg=17     ctermbg=231    cterm=NONE           guifg=#272a32  guibg=#f8f8f0   gui=NONE
hi Visual                         ctermfg=NONE   ctermbg=59     cterm=NONE           guifg=NONE     guibg=#41454e   gui=NONE
hi CursorLine                     ctermfg=NONE   ctermbg=008    cterm=NONE           guifg=NONE     guibg=#393b43   gui=NONE
hi CursorColumn                   ctermfg=NONE   ctermbg=008    cterm=NONE           guifg=NONE     guibg=#393b43   gui=NONE
hi ColorColumn                    ctermfg=NONE   ctermbg=008    cterm=NONE           guifg=NONE     guibg=#393b43   gui=NONE
hi LineNr                         ctermfg=007    ctermbg=0      cterm=NONE           guifg=#7f8186  guibg=#393b43   gui=NONE
hi CursorLineNr                   ctermfg=253    ctermbg=0      cterm=NONE           guifg=#d6d7d9  guibg=#393b43   gui=NONE
hi VertSplit                      ctermfg=59     ctermbg=59     cterm=NONE           guifg=#5a5c62  guibg=#5a5c62   gui=NONE
hi MatchParen                     ctermfg=009    ctermbg=NONE   cterm=underline      guifg=#f35656  guibg=NONE      gui=underline
hi StatusLine                     ctermfg=253    ctermbg=59     cterm=bold           guifg=#d6d7d9  guibg=#5a5c62   gui=bold
hi StatusLineNC                   ctermfg=253    ctermbg=59     cterm=NONE           guifg=#d6d7d9  guibg=#5a5c62   gui=NONE
hi Pmenu                          ctermfg=009    ctermbg=NONE   cterm=NONE           guifg=#f35656  guibg=NONE      gui=NONE
hi PmenuSel                       ctermfg=NONE   ctermbg=59     cterm=NONE           guifg=NONE     guibg=#41454e   gui=NONE
hi IncSearch                      ctermfg=17     ctermbg=221    cterm=NONE           guifg=#272a32  guibg=#f0da5e   gui=NONE
hi Search                         ctermfg=NONE   ctermbg=NONE   cterm=underline      guifg=NONE     guibg=NONE      gui=underline
hi Directory                      ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=NONE
hi Folded                         ctermfg=0      ctermbg=60     cterm=NONE           guifg=#5e6a75  guibg=#272a32   gui=NONE

hi Normal                         ctermfg=007    ctermbg=0      cterm=NONE           guifg=#d6d7d9  guibg=#272a32   gui=NONE
hi Boolean                        ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=NONE
hi Character                      ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=NONE
hi Comment                        ctermfg=060    ctermbg=NONE   cterm=NONE           guifg=#5e6a75  guibg=NONE      gui=NONE
hi Conditional                    ctermfg=009    ctermbg=NONE   cterm=NONE           guifg=#f35656  guibg=NONE      gui=NONE
hi Constant                       ctermfg=NONE   ctermbg=NONE   cterm=NONE           guifg=NONE     guibg=NONE      gui=NONE
hi Define                         ctermfg=009    ctermbg=NONE   cterm=NONE           guifg=#f35656  guibg=NONE      gui=NONE
hi DiffAdd                        ctermfg=253    ctermbg=64     cterm=bold           guifg=#d6d7d9  guibg=#46840f   gui=bold
hi DiffDelete                     ctermfg=88     ctermbg=NONE   cterm=NONE           guifg=#8b080a  guibg=NONE      gui=NONE
hi DiffChange                     ctermfg=253    ctermbg=23     cterm=NONE           guifg=#d6d7d9  guibg=#243a5d   gui=NONE
hi DiffText                       ctermfg=253    ctermbg=24     cterm=bold           guifg=#d6d7d9  guibg=#204a87   gui=bold
hi ErrorMsg                       ctermfg=231    ctermbg=009    cterm=NONE           guifg=#f8f8f0  guibg=#f35656   gui=NONE
hi WarningMsg                     ctermfg=231    ctermbg=009    cterm=NONE           guifg=#f8f8f0  guibg=#f35656   gui=NONE
hi Float                          ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=NONE
hi Function                       ctermfg=149    ctermbg=NONE   cterm=NONE           guifg=#a7e450  guibg=NONE      gui=NONE
hi Identifier                     ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=italic
hi Keyword                        ctermfg=009    ctermbg=NONE   cterm=NONE           guifg=#f35656  guibg=NONE      gui=NONE
hi Label                          ctermfg=221    ctermbg=NONE   cterm=NONE           guifg=#f0da5e  guibg=NONE      gui=NONE
hi NonText                        ctermfg=59     ctermbg=0      cterm=NONE           guifg=#3b3a32  guibg=#30333a   gui=NONE
hi Number                         ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=NONE
hi Operator                       ctermfg=009    ctermbg=NONE   cterm=NONE           guifg=#f35656  guibg=NONE      gui=NONE
hi PreProc                        ctermfg=009    ctermbg=NONE   cterm=NONE           guifg=#f35656  guibg=NONE      gui=NONE
hi Special                        ctermfg=253    ctermbg=NONE   cterm=NONE           guifg=#d6d7d9  guibg=NONE      gui=NONE
hi SpecialKey                     ctermfg=59     ctermbg=59     cterm=NONE           guifg=#3b3a32  guibg=#393b43   gui=NONE
hi Statement                      ctermfg=009    ctermbg=NONE   cterm=NONE           guifg=#f35656  guibg=NONE      gui=NONE
hi StorageClass                   ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=italic
hi String                         ctermfg=221    ctermbg=NONE   cterm=NONE           guifg=#f0da5e  guibg=NONE      gui=NONE
hi Tag                            ctermfg=009    ctermbg=NONE   cterm=NONE           guifg=#f35656  guibg=NONE      gui=NONE
hi Title                          ctermfg=253    ctermbg=NONE   cterm=bold           guifg=#d6d7d9  guibg=NONE      gui=bold
hi Todo                           ctermfg=60     ctermbg=NONE   cterm=inverse,bold   guifg=#5e6a75  guibg=NONE      gui=inverse,bold
hi Type                           ctermfg=009    ctermbg=NONE   cterm=NONE           guifg=#f35656  guibg=NONE      gui=NONE
hi Underlined                     ctermfg=NONE   ctermbg=NONE   cterm=underline      guifg=NONE     guibg=NONE      gui=underline
hi rubyClass                      ctermfg=009    ctermbg=NONE   cterm=NONE           guifg=#f35656  guibg=NONE      gui=NONE
hi rubyFunction                   ctermfg=149    ctermbg=NONE   cterm=NONE           guifg=#a7e450  guibg=NONE      gui=NONE
hi rubyInterpolationDelimiter     ctermfg=NONE   ctermbg=NONE   cterm=NONE           guifg=NONE     guibg=NONE      gui=NONE
hi rubySymbol                     ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=NONE
hi rubyConstant                   ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=italic
hi rubyStringDelimiter            ctermfg=221    ctermbg=NONE   cterm=NONE           guifg=#f0da5e  guibg=NONE      gui=NONE
hi rubyBlockParameter             ctermfg=215    ctermbg=NONE   cterm=NONE           guifg=#f3a056  guibg=NONE      gui=italic
hi rubyInstanceVariable           ctermfg=NONE   ctermbg=NONE   cterm=NONE           guifg=NONE     guibg=NONE      gui=NONE
hi rubyInclude                    ctermfg=009    ctermbg=NONE   cterm=NONE           guifg=#f35656  guibg=NONE      gui=NONE
hi rubyGlobalVariable             ctermfg=NONE   ctermbg=NONE   cterm=NONE           guifg=NONE     guibg=NONE      gui=NONE
hi rubyRegexp                     ctermfg=214    ctermbg=NONE   cterm=NONE           guifg=#f6aa11  guibg=NONE      gui=NONE
hi rubyRegexpDelimiter            ctermfg=214    ctermbg=NONE   cterm=NONE           guifg=#f6aa11  guibg=NONE      gui=NONE
hi rubyEscape                     ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=NONE
hi rubyControl                    ctermfg=009    ctermbg=NONE   cterm=NONE           guifg=#f35656  guibg=NONE      gui=NONE
hi rubyClassVariable              ctermfg=NONE   ctermbg=NONE   cterm=NONE           guifg=NONE     guibg=NONE      gui=NONE
hi rubyOperator                   ctermfg=009    ctermbg=NONE   cterm=NONE           guifg=#f35656  guibg=NONE      gui=NONE
hi rubyException                  ctermfg=009    ctermbg=NONE   cterm=NONE           guifg=#f35656  guibg=NONE      gui=NONE
hi rubyPseudoVariable             ctermfg=NONE   ctermbg=NONE   cterm=NONE           guifg=NONE     guibg=NONE      gui=NONE
hi rubyRailsUserClass             ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=italic
hi rubyRailsARAssociationMethod   ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=NONE
hi rubyRailsARMethod              ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=NONE
hi rubyRailsRenderMethod          ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=NONE
hi rubyRailsMethod                ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=NONE
hi erubyDelimiter                 ctermfg=NONE   ctermbg=NONE   cterm=NONE           guifg=NONE     guibg=NONE      gui=NONE
hi erubyComment                   ctermfg=60     ctermbg=NONE   cterm=NONE           guifg=#5e6a75  guibg=NONE      gui=NONE
hi erubyRailsMethod               ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=NONE
hi htmlTag                        ctermfg=009    ctermbg=NONE   cterm=NONE           guifg=#f35656  guibg=NONE      gui=NONE
hi htmlEndTag                     ctermfg=009    ctermbg=NONE   cterm=NONE           guifg=#f35656  guibg=NONE      gui=NONE
hi htmlTagName                    ctermfg=009    ctermbg=NONE   cterm=NONE           guifg=#f35656  guibg=NONE      gui=NONE
hi htmlArg                        ctermfg=009    ctermbg=NONE   cterm=NONE           guifg=#f35656  guibg=NONE      gui=NONE
hi htmlSpecialChar                ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=NONE
hi javaScriptFunction             ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=italic
hi javaScriptRailsFunction        ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=NONE
hi javaScriptBraces               ctermfg=NONE   ctermbg=NONE   cterm=NONE           guifg=NONE     guibg=NONE      gui=NONE
hi yamlKey                        ctermfg=009    ctermbg=NONE   cterm=NONE           guifg=#f35656  guibg=NONE      gui=NONE
hi yamlAnchor                     ctermfg=NONE   ctermbg=NONE   cterm=NONE           guifg=NONE     guibg=NONE      gui=NONE
hi yamlAlias                      ctermfg=NONE   ctermbg=NONE   cterm=NONE           guifg=NONE     guibg=NONE      gui=NONE
hi yamlDocumentHeader             ctermfg=221    ctermbg=NONE   cterm=NONE           guifg=#f0da5e  guibg=NONE      gui=NONE
hi cssURL                         ctermfg=215    ctermbg=NONE   cterm=NONE           guifg=#f3a056  guibg=NONE      gui=italic
hi cssFunctionName                ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=NONE
hi cssColor                       ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=NONE
hi cssPseudoClassId               ctermfg=115    ctermbg=NONE   cterm=NONE           guifg=#76e9c2  guibg=NONE      gui=NONE
hi cssClassName                   ctermfg=115    ctermbg=NONE   cterm=NONE           guifg=#76e9c2  guibg=NONE      gui=NONE
hi cssValueLength                 ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=NONE
hi cssCommonAttr                  ctermfg=006    ctermbg=NONE   cterm=NONE           guifg=#74f1c6  guibg=NONE      gui=NONE
hi cssBraces                      ctermfg=NONE   ctermbg=NONE   cterm=NONE           guifg=NONE     guibg=NONE      gui=NONE
