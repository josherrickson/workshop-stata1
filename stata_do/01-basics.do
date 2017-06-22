Basics
============

## The Stata Environment

[![](../images/stata_main_screen.png)](../images/stata_main_screen.png)

When a user first opens Stata, there are five main windows that will appear:

- The Results Window
    - All commands which are run are echoed out here, as well as any
      ouptut they produce. Not all commands produce output though most
      do (e.g. obtaining summaries of the data or running a
      statistical procedure). Items that appear in the results window
      in <span style="color:blue">blue</span> are clickable.
- The Command Window
    - This window is where users can interactively type Stata commands
      and submit them to Stata for processing.  Everything that one
      can do in Stata is based on a set of Stata commands. Stata
      commands are case sensitive. All Stata commands and options are
      in lower case. When variables are used in any command, the
      variable names are also case sensitive.
- The Variables Window
    - This window displays all of the variables in the data set that
      is currently open in Stata, and users can click on variable
      names in this window to carry the variables over into Stata
      commands in the Command window. Note that Stata allows only one
      data-set to be open in a session.
- The Review Window
    - Stata will keep a running record of all Stata commands that have
      been submitted in the current session in this window. Users can
      simply click on previous commands in this window to recall them
      in the Command window.
- The Properties Window
    - This window allows variable properties and data-set properties
      to be managed. Variable names, labels, value labels, notes,
      display formats, and storage types can be viewed and modified
      here.

Each of these five windows will be nested within a larger overall
window for the Stata session, which contains menus and tool bars
available for users. There are additional windows that users can
access from the Window menu, which include the Graph window (which
will open when graphs have been created), the Viewer window (which is
primarily used for help features and Stata news), the Data Editor
window (for use when viewing data sets), and the Do-file Editor window
(for use when writing .do files).

In the lower left-hand corner of the main Stata window, there will be
a directory displayed. This is known as the working directory, and is
where Stata will look to find data files and other associated Stata
files unless the user specifies another directory. We will cover
examples of changing the working directory.

## One Data

One functionality where Stata differs than most other statistical or
data analysis software is that Stata can only have a single data set
open at a time. (You can open a second instance of Stata to open a
second data set, but the two instances cannot communicate.)

Any command you run knows to operate on the data set you have
open. For example, there is a command `summarize` which provides
summary information about variables. The command is simply
`summarize`, there is no need to direct it towards a specific data
set.

If you have multiple data sets you need to work with, you can either

1. Switch between the two datasets as needed. This can be burdensome, though tools such as [`preserve`](#preserve) help greatly.

2. Merge the data sets, the better option. We'll discuss [merging](#merge) later.

## Give Stata a command

Let's try running a Stata command. In the command window, type (or copy) the following:

```
version
```

The following should appear in the Results window:

~~~~
<<dd_do>>
version
<</dd_do>>
~~~~

The first line proceeded by the `.` indicates the command that was written, `version`, and the rest is the output. Here, I am running Stata version
15.0 (your version may vary).

In this document, if you see a single command without a period, it indicates something that can be run. If you instead see a Results output where the
first line is the command prefaced by the `.`, that was run in Stata and only the Results are included since they include the command. The command can
still be run, *but should be run without the `.`*.

## Updating

If you have administrative access on your computer (e.g. if it is your personal machine, or your IT department has given you the ability), you can
update Stata freely. Major point upgrades such as the newly released 15.0 require reinstallation, but minor upgrades (such as the 14.1 and 14.2
updates) as well as minor internal updates are free.

To check for updates, you can run

```
update query
```

If any updates are available (regardless of whether you ran a query first), you can obtain all updates with

```
update all
```

If you do not have administrative access on your computer, you'll need to reach out to your IT administrators to update.

## Installing user-written commands

In addition to built in commands, Stata supports user-written programs, know as "ado-files"^[As we'll see in [a bit](#do-files), you can save Stata
commands in a "do-file". While I've never seen an official definition, I tend to think of "ado" as "automatic do".]. Once installed, these
user-written programs operate identically to any built-in command, with the caveat that they may not be quite as polished or complete since they're
volunteer written.

We won't be covering any ado-files in these notes, but if you wanted to install a program named `newcommand`:

```
ssc install newcommand
```

You can remove a program with

```
ssc uninstall newcommand
```

Finally, to see a list of all user-written programs you have installed, used

```
ado
```

[Updating Stata](#updating) will not update any ado-files, instead you can run


```
adoupdate
```

to list all available updates and

```
adoupdate, update
```

to update any.

## Do-files

We [saw](#the-stata-environment) that commands can be typed interactively, one command at a time, and the results immediately observed. From this, the
output can be copied/exported/printed, or the results can be saved. However, a better paradigm would save all the commands run separately so that the
analysis is [reproducible](https://en.wikipedia.org/wiki/Reproducibility).

For this purpose, Stata has Do-files (named because they are saved with the .do extension, such as `analysis.do`) which are scripts containing only
commands and [comments](#comments). We can then run any subset of the commands (including the entire file), re-running parts or all of the
analysis. Additionally you can easily save and/or share this command, allowing yourself or a colleague to re-run the analysis.

There are several ways to start a new Do-file.

1. File -> New -> Do-file
2. You can enter the command
```
doedit
```
3. If you select some commands in the Review window, you can right click and choose "Send select to Do-file Editor".

For the last option there, note that performing that twice will create two separate Do-files instead of appending the commands. Instead, you can copy
and paste from the Review window to add to an existing Do-file.

Let's manually add some commands to a Do-file to see how to execute the commands. In a Do-file editor, enter the following

```
sysuse auto
summarize price
compress
```

Once the lines are in the editor, highlight the commands (you do not need to highlight the entire line, you merely need to ensure your selection
includes part of every line you want run) and press the "Execute/Do" (on Windows) or "Do" (on Mac) button. You should see the following appear in your
Results window.

~~~~
<<dd_do>>
sysuse auto
summarize price
compress
<</dd_do>>
~~~~

We will cover in later sections what each of these commands does ([`sysuse`](working-with-data-sets.html#sysuse), [`summarize`](#summarize), [`compress`](#compress)).


### Comments
### Version control
## Basic command syntax
### referring to variables (`var1 var2 var3` vs `var1-var3` vs `var*`)
## Stata Help
### Short commands
## `set more off`
## Working directory
