# reaper
alias reaper-jack="PIPEWIRE_LATENCY=\"128/48000\" pw-jack reaper"

# cs4401 shell
alias cs4401-shell="ssh tvnguyen@cs4401shell.walls.ninja"
alias cs4401-shell2="ssh tvnguyen@cs4401shell2.walls.ninja"
alias cs4401-rsync='rsync --delete-after --filter=":e- .gitignore" --filter "- .git/" -avPh ~/workplaces/cs4401 tvnguyen@cs4401shell.walls.ninja:~/'
alias cs4401-rsync2='rsync --delete-after --filter=":e- .gitignore" --filter "- .git/" -avPh ~/workplaces/cs4401 tvnguyen@cs4401shell2.walls.ninja:~/'
alias cs4401-docker='docker run --privileged -v $PWD:/root/host-share --name cs4401 --rm -d -it --workdir=/root rjwalls/epictreasure tmux && docker exec cs4401 sh -c "echo 0 > /proc/sys/kernel/randomize_va_space" && docker attach cs4401'

# bandit wargame. sample usage: `banditsh 0` to connect to level 0
function banditsh() {
  if [ -z "$1" ]; then
    echo "Error: You must specify a level number." >&2
    return 1
  fi
  ssh "bandit$1"@bandit.labs.overthewire.org -p 2220
}

# rclone for gdrive
alias rclone-gdrive='rclone bisync ngthinh302-gdrive:College\ Documents ~/Documents/College\ Documents'
alias rclone-gdrive-re='rclone bisync ngthinh302-gdrive:College\ Documents ~/Documents/College\ Documents --resync'
alias rclone-gdrive-redry='rclone bisync ngthinh302-gdrive:College\ Documents ~/Documents/College\ Documents --resync --dry-run'

# ghidra
alias ghidra='~/workplaces/ghidra_11.3.1_PUBLIC/ghidraRun'
