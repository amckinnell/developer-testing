Description="RSpec plugin"

function syntaxUpdate(desc)
  AddKeyword("describe", 3)
  AddKeyword("it", 3)
end

Plugins={
  { Type="lang", Chunk=syntaxUpdate },
}
