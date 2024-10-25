alias stable="nvm use stable"
alias ..="cd .."
alias ...="cd ../.."
alias ns="npm run start"
alias nsd="npm run start:dev"
alias test="npm run test"
alias lg="lazygit"

unalias gp 2>/dev/null  # Ignore any error if alias doesn't exist
gp() {
  git push origin "$(git branch --show-current)"
}
