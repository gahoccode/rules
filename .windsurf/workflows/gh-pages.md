Create a dist folder if it's not already been created and inform user
Create a new gh-pages branch with git checkout -b gh-pages
git add dist -f 
git commit -m "adding dist once"
git subtree push  --prefix dist origin gh-pages 