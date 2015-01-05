#!/bin/sh

package_dirname="markdown-github.bbpackage"

css_dirname="Preview CSS"
css_filename="DefaultCSS_Markdown.css"

filter_dirname="Preview Filters"
filter_filename="DefaultFilter_Markdown.rb"

my_dir=$( dirname "$0" )
cd "$my_dir"

if [ ! -d "../../$css_dirname" ] || [ ! -d "../../$filter_dirname" ] || [ ! -d "../$package_dirname" ]
then
    echo "Package does not seem to be in the correct directory, it should be in ~/Library/Application Support/BBEdit/Packages/$package_dirname"
    exit 1
fi

ln -s "../Packages/$package_dirname/Contents/$css_dirname/$css_filename" "../../$css_dirname"
ln -s "../Packages/$package_dirname/Contents/$filter_dirname/$filter_filename" "../../$filter_dirname"
echo "Successfully installed symlinks"
exit 0
