Setting up Github Markdown previews in BBEdit
=============================================


1. Install redcarpet gem, as used by Github [(see details here)](https://github.com/github/markup/tree/master)

    ```shell
    $ gem install redcarpet
    ```

2. Change directory to the BBEdit application support location, and create the Packages
directory if it isn't already there:

    ```shell
    $ cd ~/Library/Application\ Support/BBEdit/
    $ [ ! -d Packages ] && mkdir Packages
    ```
    
3. Enter the package directory and clone the github repo to an appropriately named
directory:

    ```shell
    $ cd Packages
    $ git clone https://github.com/gavinaiken/bbedit-scripts.git markdown-github.bbpackage
    ```

4. Optionally, if you want to make the Github Flavored Markdown preview style the default
for all markdown files, you can add symlinks to the css and filter files using the
included script, i.e.:

    ```shell
    $ cd ~/Library/Application\ Support/BBEdit/Packages/markdown-github.bbpackage
    $ ./create-symlinks.sh
    ```

5. Now use ```Markup > Preview in BBEdit``` on any markdown.
