#!/bin/sh

package_dirname="markdown-github.bbpackage"

css_dirname="Preview CSS"
css_filename="DefaultCSS_Markdown.css"

filter_dirname="Preview Filters"
filter_filename="DefaultFilter_Markdown.rb"

my_dir=$( dirname "$0" )
cd "$my_dir"

home_dir=~
expected_dir="$home_dir/Library/Application Support/BBEdit/Packages/$package_dirname"
if [ "`pwd`" != "$expected_dir" ]
then
    echo "Package does not seem to be in the correct directory, it should be in $expected_dir"
    exit 1
fi

[ ! -d "../../$css_dirname" ] && mkdir "../../$css_dirname"

[ ! -d "../../$filter_dirname" ] && mkdir "../../$filter_dirname"

ln -s "../Packages/$package_dirname/Contents/$css_dirname/$css_filename" "../../$css_dirname"
ln -s "../Packages/$package_dirname/Contents/$filter_dirname/$filter_filename" "../../$filter_dirname"
echo "Successfully installed symlinks"
exit 0
