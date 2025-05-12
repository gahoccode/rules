Create a new gh-pages branch with git checkout -b gh-pages
git add dist -f 
git commit -m "adding dist once"
Make gh-pages a subtree of the main branch by git push subtree --prefix dist origin gh-pages 