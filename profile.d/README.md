Shared shell configuration
==========================

Shared settings between different shells.


Tips and tricks: random cool things from the internet
-----------------------------------------------------

Get basename of file

```bash
echo ${path_to_file##*/}
```

Get dirname of file

```bash
echo ${path_to_file%/*}
```

Remove all files except for specified one [link](http://www.commandlinefu.com/commands/view/6652/remove-all-but-one-specific-file#comment):

```bash
rm -f !(survivior.txt)
```

Make a directory and move into it [link](http://www.commandlinefu.com/commands/view/9000/mkdir-cd-into-it-as-single-command#comment)

```bash
mkdir /home/foo/doc/bar && cd $_
```

Rename a file extension [link](http://www.commandlinefu.com/commands/view/1295/quickly-rename-a-file#comment)

```bash
mv filename.{old,new}
```

Open Finder from the current Terminal location [link](http://www.commandlinefu.com/commands/view/2395/open-finder-from-the-current-terminal-location#comment)

```bash
open .
```

Start `COMMAND`, and kill it if still running after 5 seconds [link](http://www.commandlinefu.com/commands/view/9721/start-command-and-kill-it-if-still-running-after-5-seconds#comment)

```bash
timeout 5s <COMMAND>
```

Run last command (potentially as root) [link](http://www.commandlinefu.com/commands/view/13/run-the-last-command-as-root#comment)

```bash
[sudo] !!
```

Run previous command with changed arguments [link](http://www.commandlinefu.com/commands/view/19/runs-previous-command-but-replacing#comment)

```bash
^foo^bar     # changes first found match
^foo^bar^:&  # changes all found matches
```

Invoke editor to edit command [link](http://www.commandlinefu.com/commands/view/1446/rapidly-invoke-an-editor-to-write-a-long-complex-or-tricky-command#comment)

```bash
ctrl-x e
fc

# In vim mode; ie. go out of insert mode and v
<Esc> v
```

Use last argument of most recent command [link](http://www.commandlinefu.com/commands/view/1551/place-the-argument-of-the-most-recent-command-on-the-shell#comment)

```bash
<Esc> _
$_
```

Delete and yank partial command [link](http://www.commandlinefu.com/commands/view/6148/type-partial-command-kill-this-command-check-something-you-forgot-yank-the-command-resume-typing.#comment)

```bash
<ctrl+u> [...] <ctrl+y>

# In vim mode; ie. same yanking as usual
<Esc> dd [...] p
```

Show currently mounted file systems [link](http://www.commandlinefu.com/commands/view/1556/currently-mounted-filesystems-in-nice-layout#comment)

```bash
mount | column -t
```

Show external IP [link](http://www.commandlinefu.com/commands/view/5427/get-your-external-ip-address#comment)

```bash
curl ifconfig.me
```

Serve current directory as LAN server [link](http://www.commandlinefu.com/commands/view/71/serve-current-directory-tree-at-httphostname8000#comment)

```bash
python -m SimpleHTTPServer 8080
python3 -m http.server 8080
```
