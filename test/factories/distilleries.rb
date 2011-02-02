Factory.define :distillery do |f|
  f.sequence(:title) {|n| "Distillery #{n}"}
end
