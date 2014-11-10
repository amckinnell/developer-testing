desc 'Run the flog metrics tool on the GildedRose class'
task :flog do
  system 'flog -agme lib/gilded_rose.rb | grep -v lib/gilded_rose | tee /dev/tty | pbcopy'
end

desc 'Run mutation testing to assess the characterization'
task :mutate do
  system 'mutant --include lib --require gilded_rose --use rspec GildedRose'
end

desc 'Highlight source code from the clipboard back onto the clipboard (suitable for Keynote)'
task :keynote do
  system 'pbpaste | highlight --out-format rtf --font-size 24 --font Menlo --plug-in highlight/rspec.lua --config-file highlight/twilight.theme --style twilight --src-lang ruby | pbcopy'
end

desc 'Highlight source code from the clipboard back onto the clipboard (suitable for Pages)'
task :pages do
  system 'pbpaste | highlight --out-format rtf --font-size 10 --font Menlo --src-lang ruby --line-numbers | pbcopy'
end

desc 'Approve the received characterization'
task :approve do
  mv received, approved
end

private

def received
  characterization_filename :received
end

def approved
  characterization_filename :approved
end

def characterization_filename(status)
  "spec/fixtures/approvals/gildedrose/knows_how_to_update_quality_for_items.#{status}.txt"
end
