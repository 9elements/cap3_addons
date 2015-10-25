* the "official" way of adding functionality seems to be requiring a gem's .rb file(s) from the `Capfile`, which loads the .rake files needed. Maybe a little bit cleaner. Are there further benefits to this approach?
* "checkbranch" should check that the working directory is clean, at least when deploying the current branch
* add "bundle_for_backup"
