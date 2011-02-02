Factory.define :whisky do |f|
  f.sequence(:title) {|n| "Whisky #{n}"}
  f.sequence(:rating) {|n| n*10}
  f.association :distillery
end
