1. git checkout main --force
2. git push origin --delete gh-pages
3. git checkout gh-pages
4. git add dist -f
5. git commit -m ""
6. git subtree push --prefix dist origin gh-pages
