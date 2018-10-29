## Steps to Contribute
-----
> Prerequisites - Git, npm

1. Clone the repository using `git clone https://crypt.cybrilla.io/fintechprimitives/docs.git`
Make sure you have the pull access to do that.

2. Enter the cloned directory, `cd docs` & create a new branch to add your changes, `git checkout -b your-branch-name`

3. *(optional)* If you want to preview the application locally, install npm package, `npm i docsify-cli -g`

4. Create a new markdown file (ex- test.md) at the suitable directory level, ie. inside 'pages' sub-directory if you want the access url to be `/pages/test` and in root directory if you want the url to be, `/test`

5. You can use markdown/html/javascript/vue in the markdown files. For starters, here is a good markdown [tutorial](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

6. Add the corresponding file link to the existing `sidebar.md` file at the suitable position (since markdown lists are based on indentation level). Ex- For direcotry structure like, `pages/test.md`, the link added in `sidebar.md` should be like, `[test](/pages/test)`

7. Test your changes on local, using `docsify serve .`. Makes step 3 mandatory.

8. Push final changes to remote repo, `git push -u origin master` and create a PR.
