if filereadable("package.json")
  let $PATH = getcwd() . '/node_modules/.bin:' . $PATH
endif
