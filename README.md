
# nix.md

Converts code fences into artifacts

## Project goal

Take markdown files like so

`file.md`
~~~markdown

File:
```$ cat -
this should be echoed
```
~~~

And execute them like so:

```bash
$ cat file.md | nixmd > output.md

```

To get
`output.md`
~~~markdown

File:
```$ cat -
this should be echoed
```
```
this should be echoed
```
~~~

### Known Bugs

Code fences must not have blank newlines
