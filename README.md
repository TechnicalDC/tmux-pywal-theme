# tmux-pywal-theme
A dark tmux color scheme for tmux

![preview](https://github.com/TechnicalDC/tmux-pywal-theme/blob/main/preview.png)

### Set Options

**!** Set the following options in your `.tmux.conf`

#### widgets

Widgets can be controlled by setting `@pywal_widgets`, for example:

```
set -g @pywal_widgets "#(date +%s)"
```

Once set, these widgets will show on the right.

**default**: empty string.

#### Time format

Time format can be controlled by setting `@pywal_time_format`, for example:

```
set -g @pywal_time_format "%I:%M %p"
```

`%I` - The hour as a decimal number using a 12-hour clock  
`%M` - The minute as a decimal number  
`%p` -  Either "AM" or "PM" according to the given time value.

**default**: `%R` - The time in 24-hour notation (%H:%M).

These modifiers were taken from from [strftime manpage](http://man7.org/linux/man-pages/man3/strftime.3.html).

#### Date format

Date format can be controlled by setting `@pywal_date_format`, for example:

```
set -g @pywal_date_format "%D"
```

`%D` - Equivalent to %m/%d/%y (American format).   
`%m` - The month as a decimal number.  
`%d` - The day of the month as a decimal number  
`%y` - The year as a decimal number without the century.  

**default**: `%d/%m/%Y` - The date in non-American format.

These modifiers were taken from from [strftime manpage](http://man7.org/linux/man-pages/man3/strftime.3.html).

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

```
set -g @plugin 'TechnicalDC/tmux-pywal-theme'
```

Hit `prefix + I` to fetch the plugin and source it.

### Manual Installation

Clone the repo:

```
$ git clone https://github.com/TechnicalDC/tmux-pywal-theme /a/path/you/choose
```

Add this line to the bottom of `.tmux.conf`:

```
run-shell /a/path/you/choose tmux-pywal-theme.tmux
```

Reload TMUX environment (type this in terminal)
```
$ tmux source-file ~/.tmux.conf
```


### License

[MIT](LICENSE)
