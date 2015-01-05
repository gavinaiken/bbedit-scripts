Setting up Github Markdown previews in BBEdit
=============================================


1. Install redcarpet gem, as used by Github [(see details here)](https://github.com/github/markup/tree/master)

    ```javascript
    gem install redcarpet
    ```

2. `$ cd Library/Application\ Support/BBEdit/`

3. `$ mkdir Packages` # if it doesn't already exists

4. `$ cd Packages`

5. `$ git clone https://github.com/gavinaiken/bbedit-scripts markdown-github.bbpackage`

6. Now use ```Markup > Preview in BBEdit``` on any markdown.
