# Fuck do I know why this dies without `2| tee`
export FZF_DEFAULT_COMMAND="rg -l --fixed-strings --ignore-case --hidden --no-ignore --glob '!.git/*' --glob '!.stversions/*' 2| tee /dev/null "
export LESSOPEN='|~/.lessfilter %s'

export HUSKY=0

# grml-zsh-config for some reason completes globs with a menu instead of inserting all matches, unless this is set
export NOCOR=1
