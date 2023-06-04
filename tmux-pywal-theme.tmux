#!/bin/bash
. "${HOME}/.cache/wal/colors.sh"

pywal_black="${color0}"
pywal_blue="${color4}"
pywal_yellow="${color3}"
pywal_red="${color1}"
pywal_magenta="${color5}"
pywal_cyan="${color6}"
pywal_white="#CBCCC6"
pywal_green="${color2}"
pywal_visual_grey="${color8}"
pywal_comment_grey="${color15}"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$pywal_white"
set "message-bg" "$pywal_black"

set "message-command-fg" "$pywal_white"
set "message-command-bg" "$pywal_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$pywal_black"
setw "window-status-bg" "$pywal_black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$pywal_black"
setw "window-status-activity-fg" "$pywal_black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$pywal_comment_grey"
set "window-active-style" "fg=$pywal_white"

set "pane-border-fg" "$pywal_white"
set "pane-border-bg" "$pywal_black"
set "pane-active-border-fg" "$pywal_green"
set "pane-active-border-bg" "$pywal_black"

set "display-panes-active-colour" "$pywal_yellow"
set "display-panes-colour" "$pywal_blue"

set "status-bg" "$pywal_black"
set "status-fg" "$pywal_white"

set "@prefix_highlight_fg" "$pywal_black"
set "@prefix_highlight_bg" "$pywal_green"
set "@prefix_highlight_copy_mode_attr" "fg=$pywal_black,bg=$pywal_green"
set "@prefix_highlight_output_prefix" "  "

status_widgets=$(get "@pywal_widgets")
time_format=$(get "@pywal_time_format" "%R")
date_format=$(get "@pywal_date_format" "%d.%m.%Y")

set "status-right" "#[fg=$pywal_blue,bg=$pywal_black,nounderscore,noitalics]  #[fg=$pywal_white,bg=$pywal_black,nounderscore,noitalics]${time_format} #[fg=$pywal_cyan,bg=$pywal_black,nounderscore,noitalics]   #[fg=$pywal_white,bg=$pywal_black,nounderscore,noitalics]${date_format} #[fg=$pywal_visual_grey,bg=$pywal_black]#[fg=$pywal_visual_grey,bg=$pywal_visual_grey]#[fg=$pywal_white, bg=$pywal_visual_grey]${status_widgets}#[fg=$pywal_black,bg=$pywal_visual_grey,nobold,nounderscore,noitalics]#[fg=$pywal_green,bg=$pywal_black,nobold,nounderscore,noitalics]#[fg=$pywal_black,bg=$pywal_green,bold] #h "
set "status-left" "#[fg=$pywal_black,bg=$pywal_green,bold]   #S #{prefix_highlight}#[fg=$pywal_green,bg=$pywal_black,nobold,nounderscore,noitalics]"

set "window-status-format" "#[fg=$pywal_black,bg=$pywal_black,nobold,nounderscore,noitalics]#[fg=$pywal_white,bg=$pywal_black] #I  #W #[fg=$pywal_black,bg=$pywal_black,nobold,nounderscore,noitalics]"
set "window-status-current-format" "#[fg=$pywal_black,bg=$pywal_yellow,nobold,nounderscore,noitalics]#[fg=$pywal_black,bg=$pywal_yellow,nobold] #I  #W #[fg=$pywal_yellow,bg=$pywal_black,nobold,nounderscore,noitalics]"
